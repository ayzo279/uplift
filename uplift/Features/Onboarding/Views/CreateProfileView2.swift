//
//  CreateProfileView1.swift
//  uplift
//
//  Created by Andy Zhuo on 9/28/24.
//

import SwiftUI

struct CreateProfileView2: View {
    @Binding var index: Int
    @ObservedObject var viewModel: RegisterViewModel
    
    @State private var weightOptions: [String] = ["LB","KG"]
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 80){
            Text("Next some basic fitness info.")
                .font(.title2)
                .fontWeight(.semibold)
            VStack(alignment:.leading, spacing: 20){
                // Weight Field
                VStack(alignment:.leading, spacing: 4){
                    Text("WEIGHT").font(.footnote)
                        .foregroundColor(Color.orange)
                        .bold()
                    HStack(spacing:4){
                        VStack(alignment:.leading){
                            TextField("", value: $viewModel.weight, formatter: NumberFormatter())
                                .keyboardType(.numberPad)
                                .frame(width: 60)
                                .multilineTextAlignment(.leading)
                            Rectangle()
                                .frame(width: 60, height: 2)
                                .foregroundColor(Color.gray.opacity(0.5))
                        }
                        Text("LBS")
                            .
                        font(.caption)
                    }
                }
                // Height Field
                VStack(alignment:.leading, spacing: 4){
                    Text("HEIGHT").font(.footnote)
                        .foregroundColor(Color.orange)
                        .bold()
                    HStack{
                        // Feet Field
                        HStack(spacing:4){
                            VStack(alignment:.leading){
                                TextField("", value: $viewModel.height[0], formatter: NumberFormatter())
                                    .keyboardType(.numberPad)
                                    .frame(width: 40)
                                    .multilineTextAlignment(.leading)
                                Rectangle()
                                    .frame(width: 40, height: 2)
                                    .foregroundColor(Color.gray.opacity(0.5))
                            }
                            Text("FT")
                                .font(.caption)
                        }
                        
                        HStack(spacing:4){
                            VStack(alignment:.leading){
                                TextField("", value: $viewModel.height[1], formatter: NumberFormatter())
                                    .keyboardType(.numberPad)
                                    .frame(width: 40)
                                    .multilineTextAlignment(.leading)
                                Rectangle()
                                    .frame(width: 40, height: 2)
                                    .foregroundColor(Color.gray.opacity(0.5))
                            }
                            Text("IN")
                                .font(.caption)
                        }
                        Spacer()
                    }
                    Text("Your weight and height are hidden to others by default.")
                        .font(.caption2)
                        .padding(.top, 0.1)
                        .foregroundColor(Color.gray)
                }
            }
            VStack(alignment: .leading) {
                Text("PREFERRED UNIT OF WEIGHT").font(.footnote)
                    .foregroundColor(Color.orange)
                    .bold()
                ToggleSelectorView(selectedOption: $viewModel.preferredWeightUnits, options:weightOptions)
            }

            Spacer()
        }
        .padding([.leading,.trailing], 40)
    }
}

#Preview{
    CreateProfileView2(index:.constant(1), viewModel: RegisterViewModel())
}
