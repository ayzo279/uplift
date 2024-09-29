//
//  ToggleSelectorView.swift
//  uplift
//
//  Created by Andy Zhuo on 9/29/24.
//

import SwiftUI

struct ToggleSelectorView: View {
    @Binding var selectedOption: String
    let options: [String]
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(options, id: \.self) { option in
                Button(action: {
                    print(option)
                    selectedOption = option // Update the selected option
                    print(selectedOption)
                })
                    {
                        Text(option)
                            .font(.footnote)
                            .bold()
                            .foregroundColor(selectedOption == option ? .white : .black) // Text color
                            .frame(width: 100, height: 32)
                            .background(selectedOption == option ? Color("Orange") : Color("lightGray"))
                            .cornerRadius(20)
                    }
            }
        }
        .padding(4)
        .background(Color("lightGray"))
        .cornerRadius(40)
    }
}
