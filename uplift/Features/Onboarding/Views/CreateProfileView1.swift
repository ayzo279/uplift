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
    @ObservedObject var viewModel: RegisterViewModel
    
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
                        TextField("", text: $viewModel.firstName)
                            .underlineTextField()
                    }
                }
                VStack {
                    VStack(alignment: .leading) {
                        Text("LAST NAME").font(.footnote)
                            .foregroundColor(Color.orange)
                            .bold()
                        TextField("", text: $viewModel.lastName)
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
                            TextField("MM", text: $viewModel.dob[0])
                                .keyboardType(.numberPad)
                                .frame(width: 40)
                                .cornerRadius(5)
                                .multilineTextAlignment(.center)
                                .onChange(of: viewModel.dob[0]) { newValue in
                                    if newValue.count > 2 {
                                        viewModel.dob[0] = String(newValue.prefix(2))
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
                            TextField("DD", text: $viewModel.dob[1])
                                .keyboardType(.numberPad)
                                .frame(width: 40)
                                .cornerRadius(5)
                                .multilineTextAlignment(.center)
                                .onChange(of: viewModel.dob[1]) { newValue in
                                    if newValue.count > 2 {
                                        viewModel.dob[1] = String(newValue.prefix(2))
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
                            TextField("YYYY", text: $viewModel.dob[2])
                                .keyboardType(.numberPad)
                                .frame(width: 120)
                                .multilineTextAlignment(.leading)
                                .onChange(of: viewModel.dob[2]) { newValue in
                                    if newValue.count > 4 {
                                        viewModel.dob[2] = String(newValue.prefix(4))
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
                    ToggleSelectorView(selectedOption: $viewModel.gender, options:genderOptions)
                }
                
            }
            Spacer()
        }
        .padding([.leading,.trailing], 40)
    }}

#Preview {
    CreateProfileView1(viewModel: RegisterViewModel())
}
