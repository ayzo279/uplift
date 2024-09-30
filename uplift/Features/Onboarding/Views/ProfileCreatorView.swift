//
//  ProfileCreatorView.swift
//  uplift
//
//  Created by Andy Zhuo on 9/29/24.
//

import SwiftUI

struct ProfileCreatorView: View {
    @State private var currIndex: Int = 0
       
    var body: some View {
        VStack(spacing: 40){
            HStack {
                if currIndex > 0 {
                    Button(action: {
                        currIndex -= 1
                    }) {
                        Image(systemName: "arrow.left")
                            .foregroundColor(Color("Charcoal"))
                    }
                }
                Spacer() // Ensures arrow stays on the left side
            }
            .padding(.leading, 40) // Move padding to the container, not the button
            
            VStack {
                // Display the current subview based on currIndex
                Group {
                    switch currIndex {
                    case 0:
                        CreateProfileView1()
                    case 1:
                        CreateProfileView2(index:$currIndex)
//                    case 2:
//                        CreateProfileView2(index:$currIndex)
//                    case 3:
//                        CreateProfileView2(index:$currIndex)
                    default:
                        CreateProfileView1() // Fallback
                    }
                }
                .padding(.bottom, 80)
                .frame(height: 600)
                ContinueButtonView(currIndex: $currIndex)
            }
        }
//        Spacer()
    }
}

#Preview {
    ProfileCreatorView()
}
