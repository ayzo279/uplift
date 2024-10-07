//
//  RegisterViewModel.swift
//  uplift
//
//  Created by Andy Zhuo on 9/24/24.
//
import SwiftUI
import Combine
import FirebaseAuth
import FirebaseFirestore

class HomeViewModel: ObservableObject {
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    
    init() {
        fetchUser() // Fetch user data when the view model is initialized
    }
    
    private var db = Firestore.firestore()
    
    func fetchUser() {
        guard let user = Auth.auth().currentUser else {
            print("No user is signed in.")
            return
        }
        
        let userRef = db.collection("users").document(user.uid)

        userRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let data = document.data()
                self.firstName = data?["first_name"] as? String ?? ""
                self.lastName = data?["last_name"] as? String ?? ""
            } else {
                print("Document does not exist: \(error?.localizedDescription ?? "Unknown error")")
            }
        }
    }
}


