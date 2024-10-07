//
//  EmailRegistrationView.swift
//  uplift
//
//  Created by Andy Zhuo on 10/6/24.
//


import SwiftUI

struct EmailLoginView: View {
    @ObservedObject var viewModel: RegisterViewModel
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .center, spacing: 20) {
                Spacer()
                
                Text("Log into your account")
                    .font(.title2)
                    .bold()
                    
                VStack(alignment: .leading) {
                    Text("EMAIL")
                        .font(.footnote)
                        .foregroundColor(Color("Orange"))
                        .bold()
                    
                    TextField("Email", text: $viewModel.email)
                        .padding(12)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color("lightGray"), lineWidth: 1)
                        )
                }
                .padding(.horizontal, 16)
                
                VStack(alignment: .leading) {
                    Text("PASSWORD")
                        .font(.footnote)
                        .foregroundColor(Color("Orange"))
                        .bold()
                    
                    SecureField("Password", text: $viewModel.password)
                        .padding(12)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color("lightGray"), lineWidth: 1)
                        )
                }
                .padding(.horizontal, 16)
                
                Button(action: {
                    viewModel.signInWithEmail()
                }) {
                    Text("Login")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.orange)
                        .cornerRadius(10)
                }
                .padding(.horizontal, 16)
                
                // Display registration error, if any
                if let error = viewModel.authenticationError { // Changed to authenticationError
                    Text(error)
                        .foregroundColor(.red)
                        .font(.footnote)
                        .padding(.top, 10)
                }
                
                NavigationLink(destination: HomeView(), isActive: $viewModel.isAuthenticated) {
                    EmptyView()  // Invisible navigation link that triggers on authentication
                }
                
//                NavigationLink(destination: OnboardingMobileView(viewModel: RegisterViewModel())) {
//                    Text("Register with mobile instead")
//                        .font(.footnote)
//                        .foregroundColor(.black)
//                }
//                .padding(.top, 10)
                
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    EmailLoginView(viewModel: RegisterViewModel())
}
