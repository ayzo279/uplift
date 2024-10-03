//
//  ProgressChartModel.swift
//  uplift
//
//  Created by Andy Zhuo on 10/2/24.
//

import Foundation

struct WeeklyProgress {
    let weekStartDate: String
    let dailySessions: [Session]
    let workoutCount: Int
    let recoveryCount: Int
    
    struct Session {
        let type: SessionType
    }

    enum SessionType {
        case workout
        case recovery
        case empty
    }
}
