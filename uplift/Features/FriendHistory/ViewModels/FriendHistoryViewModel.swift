//
//  SwiftUIView.swift
//  uplift
//
//  Created by Andy Zhuo on 10/2/24.
//

import SwiftUI

class FriendHistoryViewModel: ObservableObject {
    @Published var fitnessWins: [FriendLog] = [
        FriendLog(username: "Allison M.", workoutName: "Killer Legs", timeAgo: 12, partners:["Peter K."]),
        FriendLog(username: "Brandon C.", workoutName: "Chest Day", timeAgo: 30),
        FriendLog(username: "Daniel J.", workoutName: "Recovery", timeAgo: 45),
        FriendLog(username: "Katie B.", workoutName: "Full Body v1", timeAgo: 185),
        FriendLog(username: "Sophia K.", workoutName: "Bicep Burner", timeAgo: 615),
    ]

}
