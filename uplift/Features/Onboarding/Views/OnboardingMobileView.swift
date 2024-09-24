//
//  OnboardingMobileView.swift
//  uplift
//
//  Created by Andy Zhuo on 9/24/24.
//

import SwiftUI
struct OnboardingMobileView: View {
    @ObservedObject var viewModel: RegisterViewModel
    @State private var isVerifying: Bool = false // State to control navigation

    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            Text("Enter your mobile number")
                .font(.title2)
                .bold()
            
            HStack {
                Picker(selection: $viewModel.selectedCountryCode, label: Text("")) {
                    ForEach(countries, id: \.self) { country in
                        Text("\(country.flagEmoji) \(country.code)")
                            .tag(country)
                    }
                }
                .frame(width: 80)
                .clipped()
                
                TextField("Mobile number", text: $viewModel.phoneNumber)
                    .keyboardType(.numberPad)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(20)
            }
            
            Text("Use your mobile number to register/sign in.\nStandard messaging rates apply.")
                .font(.footnote)
                .foregroundColor(.gray)
            
            // Navigation Link to VerificationCodeView
            NavigationLink(destination: VerificationView(phoneNumber: $viewModel.phoneNumber)) {
                Button(action: {
                    viewModel.sendVerificationCode() // Call the function to send the verification code
                    isVerifying = true // Set the state to navigate
                })
                {
                    Text("Send verification code")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.orange)
                        .cornerRadius(10)
                }
            }
            .padding(.top, 20)

            Button(action: {
                viewModel.switchToEmailRegistration()
            }) {
                Text("Register with email instead")
                    .font(.footnote)
                    .foregroundColor(.black)
            }
            .padding(.top, 10)
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    OnboardingMobileView(viewModel: RegisterViewModel())
}

