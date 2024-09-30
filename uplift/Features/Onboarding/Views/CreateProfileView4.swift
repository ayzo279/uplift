//
//  CreateProfileView4.swift
//  uplift
//
//  Created by Andy Zhuo on 9/29/24.
//

import SwiftUI

struct CreateProfileView4: View {
    var body: some View {
        VStack(alignment:.leading, spacing: 80){
            Text("One more thing,\nmaybe a profile picture?")
                .font(.title2)
                .fontWeight(.semibold)
            VStack(alignment:.center, spacing: 20){
                Circle()
                    .stroke(Color("Orange"), lineWidth: 2)
                    .frame(width: 200, height: 200)
                    .overlay(
                        Text("AB")
                            .font(.largeTitle)
                            .foregroundColor(Color("Orange"))
                    )
                VStack(alignment:.leading, spacing: 8){
                    Button(action: {
                        // Camera button
                        print("TODO")
                    }){
                        Text("Take photo with camera")
                            .foregroundColor(Color("Charcoal"))
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.leading)
                    }
                    Button(action: {
                        // Access photo library button
                        print("TODO")
                    }){
                        Text("Choose from library")
                            .foregroundColor(Color("Charcoal"))
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.leading)

                    }
                }
            }
            .frame(maxWidth: .infinity) // This ensures the inner VStack takes up full width

            Spacer()
        }
        .padding([.leading, .trailing], 40) // Maintain consistency with padding

    }
}

#Preview {
    CreateProfileView4()
}
