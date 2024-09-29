//
//  OnboardingMobileView.swift
//  uplift
//
//  Created by Andy Zhuo on 9/24/24.
//
import SwiftUI

struct OnboardingMobileView: View {
    @ObservedObject var viewModel: RegisterViewModel

    var body: some View {
        NavigationStack{
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
                
                NavigationLink(destination:VerificationView(phoneNumber:
                                                                $viewModel.phoneNumber, nFields:6)) {
                    Text("Send verification code")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.orange)
                        .cornerRadius(10)
                }
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

    // Add a basic validation function
    func isValidPhoneNumber(_ phoneNumber: String) -> Bool {
        return phoneNumber.count >= 10 // Simple check for minimum length
    }
}

#Preview {
    OnboardingMobileView(viewModel: RegisterViewModel())
}
