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

class RegisterViewModel: ObservableObject {
    @Published var selectedCountryCode: CountryCodeModel = countries.first!
    @Published var phoneNumber: String = ""
    
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var gender: String = "MALE"
    @Published var dob: [String] = ["","",""]  // Optional field
    @Published var weight: Int? = nil
    @Published var height: [Int?] = [nil, nil]
    @Published var preferredWeightUnits: String = "LB"  // Default to "kg"
    
    @Published var registrationError: String? = nil
    @Published var isAuthenticated: Bool = false

    
    func sendVerificationCode() {
        // Logic to send the verification code
        print("Sending verification code to \(selectedCountryCode.code + phoneNumber)")
    }
    
    // Function to register user with Firebase
    func registerWithEmail() {
        guard !email.isEmpty, !password.isEmpty else {
            registrationError = "Email and password cannot be empty."
            return
        }
        
        // Firebase Auth call
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                self.registrationError = error.localizedDescription
                return
            }
            
            if let user = authResult?.user {
                print("User registered successfully with email: \(user.email ?? "")")
                self.isAuthenticated = true
            }
        }
    }
    
    func insertUserData() {
            // Get registered user
            guard let user = Auth.auth().currentUser else {
                print("No user is signed in.")
                return
            }
        
            let db = Firestore.firestore()

            let userData: [String: Any] = [
                "first_name": firstName,
                "last_name": lastName,
                "gender": gender,
                "date_of_birth": dob,
                "weight": weight as Any, // Use `as Any` to handle optional
                "height": height as Any, // Use `as Any` to handle optional
                "preferredWeightUnits": preferredWeightUnits,
                "createdAt": Timestamp(date: Date())
            ]

        db.collection("users").document(user.uid).setData(userData) { error in
                if let error = error {
                    print("Error storing user data: \(error.localizedDescription)")
                } else {
                    print("User data stored successfully!")
                }
            }
        }
}


