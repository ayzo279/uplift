//
//  CreateProfileView3.swift
//  uplift
//
//  Created by Andy Zhuo on 9/29/24.
//

import SwiftUI

struct CreateProfileView3: View {
    var testNames: [String] = ["Adam A", "Allison M", "Brandon C", "Daniel J", "Katie B", "Sophia K"]
    @State private var invitedFriends: [Bool] = Array(repeating: false, count: 6) // Initially set to false for all
    var body: some View {
        VStack(alignment:.leading, spacing: 80){
            Text("Awesome! Let's start building\nyour network.")
                .font(.title2)
                .fontWeight(.semibold)
            VStack(alignment:.leading, spacing:20){
                Text("Connect with friends on Uplift")
                    .font(.headline)
                    .fontWeight(.medium)
                // Friends List
                ScrollView {
                    VStack(spacing:20){
                        ForEach(testNames.indices, id: \.self) {
                            index in
                            HStack(spacing: 12){
                                Circle()
                                    .stroke(Color("Orange"), lineWidth: 2)
                                    .frame(width: 56, height: 56)
                                    .overlay(
                                        Text(testNames[index].prefix(1) + testNames[index].suffix(1))
                                            .font(.title2)
                                            .foregroundColor(Color("Orange"))
                                    )
                                Text(testNames[index] + ".")
                                    .font(.callout)
                                Spacer()
                                Button(action: {
                                    // Toggle invitation status
                                    invitedFriends[index].toggle()
                                }) {
                                    Text(invitedFriends[index] ? "Invited" : "Connect")
                                        .font(.footnote)
                                        .foregroundColor(invitedFriends[index] ? Color.gray : Color("Orange"))
                                        .padding(.vertical, 8)
                                        .padding(.horizontal, 16)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 20)
                                                .stroke(invitedFriends[index] ? Color.gray : Color("Orange"), lineWidth: 2)
                                        )
                                }
                            }
                        }
                    }
                    .padding()
                }
                .background(
                    RoundedRectangle(cornerRadius: 10) // Applying rounded corners to the entire border
                        .stroke(Color("lightGray"), lineWidth: 2)
                )
                .frame(width: 320, height: 350)
                
            }
            Spacer()
        }
    }
}

#Preview {
    CreateProfileView3()
}
