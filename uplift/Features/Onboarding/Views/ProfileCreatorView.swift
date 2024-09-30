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
                else {
                    Image(systemName: "arrow.left")
                                            .foregroundColor(Color.clear)
                                            .frame(width: 12, height: 12)
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
                    case 2:
                        CreateProfileView3()
                    case 3:
                        CreateProfileView4()
                    default:
                        CreateProfileView1() // Fallback
                    }
                }
                .padding(.bottom, 80)
                .frame(height: 600)
                if currIndex < 3 {
                    ContinueButtonView(currIndex: $currIndex)
                }
                else {
                    VStack(spacing: 4){
                        HStack(spacing:4){
                            Button(action:{
                                if currIndex < 3 {
                                    currIndex += 1
                                }
                            }){
                                Text("I'm all set!")
                                    .font(.title2)
                                    .bold()
                                Image(systemName: "chevron.right")
                            }
                            .foregroundColor(Color("Orange"))
                        }
                        HStack(spacing: 10) {
                            ForEach(0..<4) { index in
                                Circle()
                                    .fill(index == currIndex ? Color("Orange") : Color("Orange").opacity(0.3)) // Darken the current tab
                                    .frame(width: 12, height: 12)
                            }
                        }
                    }
                }
            }
        }
//        Spacer()
    }
}

#Preview {
    ProfileCreatorView()
}
