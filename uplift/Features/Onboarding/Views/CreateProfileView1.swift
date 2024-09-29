//
//  CreateProfileView1.swift
//  uplift
//
//  Created by Andy Zhuo on 9/28/24.
//

import SwiftUI

// Code adapted from https://thehappyprogrammer.com/custom-textfield-in-swiftui
extension Color {
    static let darkPink = Color(red: 208 / 255, green: 45 / 255, blue: 208 / 255)
}

extension View {
    func underlineTextField() -> some View {
        self
            .overlay(Rectangle().frame(height: 2).padding(.top, 25))
            .foregroundColor(Color.gray)
    }
}

struct CreateProfileView1: View {
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var dob: [String] = ["", "",""]
    @State private var defaultOption: String = "MALE"
    @State private var genderOptions: [String] = ["MALE","FEMALE","NONBINARY"]
    var body: some View {
        VStack(alignment: .leading, spacing: 80){
            Text("Let's create your profile.")
                .font(.title2)
                .fontWeight(.semibold)
            VStack(spacing: 20){
                VStack {
                    VStack(alignment: .leading) {
                        Text("FIRST NAME").font(.footnote)
                            .foregroundColor(Color.orange)
                            .bold()
                        TextField("", text: $firstName)
                            .underlineTextField()
                    }
                }
                VStack {
                    VStack(alignment: .leading) {
                        Text("LAST NAME").font(.footnote)
                            .foregroundColor(Color.orange)
                            .bold()
                        TextField("", text: $firstName)
                            .underlineTextField()
                        Text("Only your first name and last initial will be visible to other users.")
                            .font(.caption2)
                            .padding(.top, 0.1)
                            .foregroundColor(Color.gray)
                    }
                }
            }
            VStack(alignment: .leading, spacing: 20){
                VStack(alignment:.leading) {
                    Text("DATE OF BIRTH (OPTIONAL)").font(.footnote)
                        .foregroundColor(Color.orange)
                        .bold()
                    HStack(spacing: 10) {
                        // Month TextField
                        VStack(spacing:4){
                            TextField("MM", text: $dob[0])
                                .keyboardType(.numberPad)
                                .frame(width: 40)
                                .cornerRadius(5)
                                .multilineTextAlignment(.center)
                                .onChange(of: dob[0]) { newValue in
                                    if newValue.count > 2 {
                                        dob[0] = String(newValue.prefix(2))
                                    }
                                }
                            Rectangle()
                                .frame(width: 40, height: 2)
                                .foregroundColor(Color.gray.opacity(0.5))
                        }
                        
                        // Separator
                        Text("/")
                        
                        // Day TextField
                        VStack(spacing:4){
                            TextField("DD", text: $dob[1])
                                .keyboardType(.numberPad)
                                .frame(width: 40)
                                .cornerRadius(5)
                                .multilineTextAlignment(.center)
                                .onChange(of: dob[1]) { newValue in
                                    if newValue.count > 2 {
                                        dob[1] = String(newValue.prefix(2))
                                    }
                                }
                            Rectangle()
                                .frame(width: 40, height: 2)
                                .foregroundColor(Color.gray.opacity(0.5))
                        }
                        
                        // Separator
                        Text("/")
                        
                        // Year TextField
                        VStack(alignment: .leading, spacing:4){
                            TextField("YYYY", text: $dob[2])
                                .keyboardType(.numberPad)
                                .frame(width: 120)
                                .multilineTextAlignment(.leading)
                                .onChange(of: dob[2]) { newValue in
                                    if newValue.count > 4 {
                                        dob[2] = String(newValue.prefix(4))
                                    }
                                }
                                .padding(.leading, 4)
                            Rectangle()
                                .frame(width: 50, height: 2)
                                .foregroundColor(Color.gray.opacity(0.5))
                        }
                    }
                }
                VStack(alignment: .leading) {
                    Text("GENDER").font(.footnote)
                        .foregroundColor(Color.orange)
                        .bold()
                    ToggleSelectorView(selectedOption: $defaultOption, options:genderOptions)
                }
            }
        }
        .padding([.leading,.trailing], 40)
    }}

#Preview {
    CreateProfileView1()
}
