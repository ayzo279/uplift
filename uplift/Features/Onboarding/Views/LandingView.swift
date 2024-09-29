//
//  LandingView.swift
//  uplift
//
//  Created by Andy Zhuo on 9/24/24.
//

import SwiftUI

struct LandingView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing:40) {
                Image("uplift_logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250, height: 250)
//                    .padding()

                Text("The gym doesn’t have to be scary.\nConnect with friends, share your progress,\nand stay motivated together!")
                    .multilineTextAlignment(.center)
                    .padding()

                NavigationLink(destination: OnboardingMobileView(viewModel: RegisterViewModel())) {
                    Text("Let's get started.")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 300, height: 60)
                        .background(Color.orange)
                        .cornerRadius(60)
                }
            }
        }
    }
}

#Preview {
    LandingView()
}
