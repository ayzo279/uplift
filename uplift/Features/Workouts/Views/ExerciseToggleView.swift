//
//  ExerciseToggleView.swift
//  uplift
//
//  Created by Andy Zhuo on 10/9/24.
//

import SwiftUI

struct ExerciseToggleView: View {
    var name: String
    var instructions: String
    var isSelected: Bool
    var onToggle: () -> Void
    
    var body: some View {
        HStack {
            Button(action: {
                onToggle()
            }) {
                HStack{
                    Image(systemName: isSelected ? "checkmark.square" : "square")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(isSelected ? Color("Orange") : .gray)
                    VStack(alignment: .leading) {
                        Text(truncatedText(name, maxLength: 20))
                            .font(.headline)
                    }
                }
                
                Spacer()
                
                Image(systemName: "questionmark.circle")
                    .resizable()
                    .frame(width: 20, height:20)
            }
        }
        .foregroundColor(Color("Charcoal"))
    }
    
    private func truncatedText(_ text: String, maxLength: Int) -> String {
        if text.count > maxLength {
            let index = text.index(text.startIndex, offsetBy: maxLength)
            return String(text[..<index]) + "..."
        }
        return text
    }
}

//#Preview {
//    ExerciseToggleView(name: "V-bar", instructions: "22", isSelected: false /*onToggle: */)
//}
