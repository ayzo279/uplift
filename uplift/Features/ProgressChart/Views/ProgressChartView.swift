//
//  ProgressChartView.swift
//  uplift
//
//  Created by Andy Zhuo on 10/2/24.
//

import SwiftUI

struct ProgressChartView: View {
    @ObservedObject var viewModel = WeeklyProgressViewModel()
    
    var body: some View {
        VStack(alignment:.center, spacing: 24){
            HStack{
                VStack(alignment: .leading, spacing: 8) {
                    Text("WEEKLY PROGRESS")
                        .font(.headline)
                        .multilineTextAlignment(.leading)
                    
                    Text("Workouts and recovery completed per week")
                        .font(.subheadline)
                        .fontWeight(.light)
                }
                Spacer()
            }
            HStack(alignment: .bottom, spacing: 0){
                ForEach(viewModel.weeklyProgress.reversed(), id: \.weekStartDate) {week in
                    VStack(alignment: .center, spacing: 4) {
                        VStack(spacing:0){
                            VStack(spacing: 2){
                                ForEach(0..<week.recoveryCount, id: \.self) { _ in
                                    RoundedRectangle(cornerRadius: 2)
                                        .fill(Color("Blue"))
                                        .frame(width: 16, height: 20)
                                }
                                ForEach(0..<week.workoutCount, id: \.self) { _ in
                                    RoundedRectangle(cornerRadius: 2)
                                        .fill(Color("Orange"))
                                        .frame(width: 16, height: 20)
                                }
                            }
                            Rectangle()
                                .frame(width: 50, height: 2)
                        }
                        Text(week.weekStartDate)
                            .font(.system(size: 12))
                    }
                }
            }
        }
        .padding(.horizontal, 24)
        .padding(.vertical, 12)
        Spacer()
    }
}

#Preview {
    ProgressChartView()
}
