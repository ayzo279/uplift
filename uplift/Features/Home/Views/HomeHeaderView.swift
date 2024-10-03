//
//  HomeHeaderView.swift
//  uplift
//
//  Created by Andy Zhuo on 10/1/24.
//

import SwiftUI

struct HomeHeaderView: View {
    var body: some View {
        VStack{
            ZStack{
                Rectangle()
                    .fill(Color("White"))
                    .frame(height: 84)
                    .shadow(color: .black.opacity(0.15), radius: 4, x: 0, y:5)
                
                HStack{
                    HStack{
                        Circle()
                            .stroke(Color("Orange"), lineWidth: 2)
                            .frame(width: 50, height: 50)
                            .overlay(
                                Text("AB")
                                    .font(.title2)
                                    .foregroundColor(Color("Orange")))
                        Text("Andrew B.")
                            .font(.system(size:16))
                            .fontWeight(.medium)
                    }
                    Spacer()
                    Button(action:{
                        // Open settings
                    }){
                        Image(systemName:"gearshape")
                            .foregroundColor(Color("Charcoal"))
                            .font(.system(size:20))
                            .fontWeight(.medium)

                    }
                }
                .frame(height:84)
                .padding(.horizontal, 24)
            }
            Spacer()
        }
        .frame(height: 84)
        Spacer()
    }
}

#Preview {
    HomeHeaderView()
}
