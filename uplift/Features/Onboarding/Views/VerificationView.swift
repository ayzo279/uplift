//
//  VerificationView.swift
//  uplift
//
//  Created by Andy Zhuo on 9/24/24.
//

import SwiftUI
import Combine

struct VerificationView: View {
    @Binding var phoneNumber: String
    @State private var verificationCode: [String] = Array(repeating: "", count: 6) // Create an array for 6 digits
    @FocusState private var focusedField: Int? // State to manage focus on the text fields
    @State private var isVerified = false // State to control navigation
    @State private var showAlert: Bool = false // State to show alert for incorrect code
    @State private var alertMessage: String = "" // Message for the alert

    var body: some View {
        VStack(spacing: 20) {
            Text("Confirm your identity")
                .font(.title)
                .bold()

            Text("Enter the verification code sent to \n(\(phoneNumber))")
                .font(.subheadline)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)

            HStack(spacing: 10) {
                ForEach(0..<6, id: \.self) { index in
                    TextField("", text: Binding(
                        get: { self.verificationCode[index] },
                        set: { newValue in
                            // Allow only a single digit
                            if newValue.count <= 1 && (newValue.isEmpty || newValue.rangeOfCharacter(from: CharacterSet.decimalDigits) != nil) {
                                self.verificationCode[index] = newValue
                            }

                            // Automatically focus next field if current one is filled
                            if newValue.count == 1 && index < 5 {
                                focusedField = index + 1 // Move to the next field
                            } else if newValue.isEmpty && index > 0 {
                                focusedField = index - 1 // Move to the previous field if deleted
                            }
                        }
                    ))
                    .keyboardType(.numberPad)
                    .frame(width: 15, height: 40)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(5)
                    .multilineTextAlignment(.center)
                    .focused($focusedField, equals: index) // Bind focus state
                }
            }

            Button(action: {
                // Combine the verification code digits
                let code = verificationCode.joined()
                verifyCode(code) // Call verification function
            }) {
                Text("Verify")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.orange)
                    .cornerRadius(10)
            }
            .alert(alertMessage, isPresented: $showAlert) {
                Button("OK", role: .cancel) { }
            }
        }
        .padding()
        .navigationDestination(isPresented: $isVerified) {
            //OnboardingProfileView() //
        }
    }

    // Function to verify the code
    private func verifyCode(_ code: String) {
        if true { // Verification condition, tentatively bypass
            isVerified = true // Navigate to the profile view
        } else {
            alertMessage = "The verification code is incorrect. Please try again."
            showAlert = true // Show alert if the code is incorrect
        }
    }
}


#Preview {
    VerificationView(phoneNumber: .constant("2158085953"))
}
