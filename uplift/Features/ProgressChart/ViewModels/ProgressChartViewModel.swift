//
//  SwiftUIView.swift
//  uplift
//
//  Created by Andy Zhuo on 10/2/24.
//

import SwiftUI

class WeeklyProgressViewModel: ObservableObject {
    @Published var weeklyProgress: [WeeklyProgress] = []

    init() {
        generateWeeklyProgress() // Populate data
    }

    // Generate 7 weeks of data
    func generateWeeklyProgress() {
        let weeks = (0..<7).map { weekIndex -> WeeklyProgress in
            var recoveryCount = 0
            var workoutCount = 0
            let weekStartDate = getSunday(weekIndex)
            let sessions = (0..<7).map { dayIndex -> WeeklyProgress.Session in
                // Random assignment for testing
                let sessionType: WeeklyProgress.SessionType
                let randomValue = Int.random(in: 0...2) // Random value between 0 and 2

                switch randomValue {
                case 0:
                    sessionType = .workout
                case 1:
                    sessionType = .recovery
                default:
                    sessionType = .empty
                }
                
                if sessionType == .workout {
                    workoutCount += 1
                }
                else if sessionType == .recovery {
                    recoveryCount += 1
                }
                return WeeklyProgress.Session(type: sessionType)
            }
            return WeeklyProgress(weekStartDate: weekStartDate, dailySessions: sessions, workoutCount:workoutCount, recoveryCount:recoveryCount)
        }
        weeklyProgress = weeks
    }

    // Get the date of the Sunday's for the last n weeks in "M/d" format
    func getSunday(_ weekIndex: Int) -> String {
        let calendar = Calendar.current
        let today = Date()
        guard let sunday = calendar.date(byAdding: .weekOfYear, value: -weekIndex, to: today),
              let thisSunday = calendar.date(from: calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: sunday)) else {
            return ""
        }
        let formatter = DateFormatter()
        formatter.dateFormat = "M/d"
        return formatter.string(from: thisSunday)
    }
}
