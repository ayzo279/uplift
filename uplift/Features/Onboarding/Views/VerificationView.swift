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
    let nFields: Int
    @State var verificationCode: [String]
    @FocusState private var focusedField: Int?
    
    
    init(phoneNumber: Binding<String>, nFields: Int){
        self._phoneNumber = phoneNumber
        self.nFields = nFields
        self._verificationCode = State(initialValue: Array(repeating:"", count:nFields))
    }
    
    var body: some View {
        NavigationStack{
            VStack(alignment: .center, spacing: 40){
                VStack(alignment: .center){
                    Text("Confirm your identity")
                        .font(.title)
                        .bold()
                    Text("Enter the verification code sent to \n\(phoneNumber)")
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color.gray)
                }
                HStack {
                    ForEach(0..<6, id: \.self){ index in
                        TextField("", text: Binding(
                            get: {verificationCode[index]},
                            set: {newValue in
                                if newValue.count <= 1 && newValue.rangeOfCharacter(from: CharacterSet.decimalDigits) != nil {
                                    verificationCode[index] = newValue
                                }
                            }
                        ))
                        .keyboardType(.numberPad)
                        .frame(width:48, height: 60)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(5)
                        .multilineTextAlignment(.center)
                        .focused($focusedField, equals:index)
                        .tag(index)
                        .onChange(of: verificationCode[index]) {
                            newValue in
                            if index == nFields - 1 {
                                focusedField = nil
                            }
                            else{
                                focusedField = (focusedField ?? 0) + 1
                            }
                        }
                    }
                }
                VStack(spacing:10){
                    NavigationLink(destination: ProfileCreatorView()){
                        Text("Verify")
                            .font(.headline)
                            .frame(width:320, height: 28)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.orange)
                            .cornerRadius(60)
                    }
                    Button(action: {resendCode()}
                    ){
                        Text("Resend verification code")
                            .foregroundColor(Color.black.opacity(0.8))
                    }
                }
            }
        }
    }
    private func resendCode() {
        print("resending code to \(phoneNumber)")
    }
}


#Preview {
    VerificationView(phoneNumber: .constant("2158085953"), nFields: 6)
}
