//
//  ProgressChartModel.swift
//  uplift
//
//  Created by Andy Zhuo on 10/2/24.
//

import Foundation

struct FriendLog {
    let username: String
    let workoutName: String
    let timeAgo: Int
    let partners: [String]?
    
    init(username: String, workoutName: String, timeAgo: Int, partners: [String]? = nil) {
        self.username = username
        self.workoutName = workoutName
        self.timeAgo = timeAgo
        self.partners = partners // Defaults to nil if not provided
    }
}
