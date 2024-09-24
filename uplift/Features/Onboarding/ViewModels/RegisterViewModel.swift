//
//  RegisterViewModel.swift
//  uplift
//
//  Created by Andy Zhuo on 9/24/24.
//
import SwiftUI
import Combine

class RegisterViewModel: ObservableObject {
    @Published var selectedCountryCode: CountryCodeModel = countries.first!
    @Published var phoneNumber: String = ""

    func sendVerificationCode() {
        // Logic to send the verification code
        print("Sending verification code to \(selectedCountryCode.code + phoneNumber)")
    }
    
    func switchToEmailRegistration() {
        // Logic to switch to email registration
    }
}


