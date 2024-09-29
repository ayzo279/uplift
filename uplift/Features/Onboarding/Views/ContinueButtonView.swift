//
//  ContinueButtonView.swift
//  uplift
//
//  Created by Andy Zhuo on 9/29/24.
//

import SwiftUI

// ContinueButton Component
struct ContinueButtonView: View {
    @Binding var currIndex: Int

    var body: some View {
        VStack(spacing: 4){
            HStack(spacing:4){
                Button(action:{
                    if currIndex < 3 {
                        currIndex += 1
                    }
                }){
                    Text("Continue")
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

