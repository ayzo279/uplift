//
//  ProgressChartView.swift
//  uplift
//
//  Created by Andy Zhuo on 10/2/24.
//

import SwiftUI

struct FriendHistoryView: View {
    @ObservedObject var viewModel = FriendHistoryViewModel()
    var body: some View {
        VStack(spacing: 20){
            HStack{
                Text("FITNESS WINS TODAY")
                    .font(.headline)
                Spacer()
            }
            VStack(alignment: .leading, spacing: 20){
                ForEach(viewModel.fitnessWins, id: \.username) {log in
                    HStack{
                        HStack(spacing:12){
                            Circle()
                                .stroke(Color("Orange"), lineWidth: 2)
                                .frame(width: 56, height: 56)
                                .overlay(
                                    Text(initials(username:log.username))
                                        .font(.title2)
                                        .foregroundColor(Color("Orange"))
                                )
                            writeLog(username: log.username, workoutName: log.workoutName, partners:log.partners)
                                .font(.system(size: 16))
                            Spacer()
                        }
                        .frame(width: 320)
                        Spacer()
                        Text(formatTimeAgo(timeAgo:log.timeAgo))
                            .font(.system(size: 12))
                    }
                }
            }
            Spacer()
        }
        .padding(.horizontal, 24)
        .padding(.vertical, 12)
    }
    func initials(username: String) -> String {
        let nameComponents = username.split(separator: " ")
        
        let initials = nameComponents.map { String($0.prefix(1)) }.joined()
        
        return initials.uppercased()
    }
                        
    func writeLog(username: String, workoutName: String, partners: [String]? = nil) -> Text {
        var outputText = Text("\(username)").bold() + Text(" completed ") + Text("\(workoutName)").bold()
        
        if let partners = partners, !partners.isEmpty {
            switch partners.count {
            case 1:
                outputText = outputText + Text(" with \(partners[0])")
            case 2:
                outputText = outputText + Text(" with \(partners[0]) and \(partners[1])")
            default:
                let firstTwoPartners = partners.prefix(2).joined(separator: ", ")
                let remainingCount = partners.count - 2
                outputText = outputText + Text(" with \(firstTwoPartners), and \(remainingCount) more")
            }
        }
        
        return outputText
    }
    
    func formatTimeAgo(timeAgo: Int) -> String {
        var outputString = ""
        if timeAgo < 60 {
            outputString = "\(timeAgo)m"
        }
        else {
            outputString = "\(timeAgo / 60)h"
        }
        return outputString
    }
}

#Preview {
    FriendHistoryView()
}
