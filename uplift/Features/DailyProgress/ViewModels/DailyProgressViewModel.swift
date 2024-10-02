//
//  DailyProgressViewModel.swift
//  uplift
//
//  Created by Andy Zhuo on 10/1/24.
//

// ProgressViewModel.swift
import SwiftUI

class DailyProgressViewModel: ObservableObject {
    @Published var weeklyProgress: [DailyProgress] = []

    init() {
        weeklyProgress = [
            DailyProgress(day: "MON", isCompleted: true),
            DailyProgress(day: "TUE", isCompleted: false),
            DailyProgress(day: "WED", isCompleted: false),
            DailyProgress(day: "THU", isCompleted: false),
            DailyProgress(day: "FRI", isCompleted: false),
            DailyProgress(day: "SAT", isCompleted: false),
            DailyProgress(day: "SUN", isCompleted: false)
        ]
    }

    // Update progress
    func updateProgress(for day: String, completed: Bool) {
        print("TODO")
    }
}
