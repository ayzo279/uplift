//
//  WeekProgressView.swift
//  uplift
//
//  Created by Andy Zhuo on 10/1/24.
//

import SwiftUI

// Get today's day of week, first 3 letters (e.g. MON)
func getToday() -> String {
    let today = Date()
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "EEEE"
    let dayOfWeek = dateFormatter.string(from: today)
    return dayOfWeek.prefix(3).uppercased()
}

struct DailyProgressView: View {
    @ObservedObject var viewModel = DailyProgressViewModel()
    var body: some View {
        VStack{
            VStack(alignment:.center, spacing: 16){
                HStack{
                    Text("PROGRESS THIS WEEK")
                        .font(.headline)
                        .multilineTextAlignment(.leading)
                    Spacer()
                }
                // 7-day badge streak collection
                HStack(alignment:.top, spacing: 10){
                    ForEach(viewModel.weeklyProgress, id: \.day){ badge
                        in VStack(spacing: 12){
                            // Badge
                            Circle()
                                .stroke(badge.isCompleted ? Color("Orange") : Color("lightGray"), lineWidth: 3)
                                .frame(width: 42, height: 42)
                                .background(
                                    badge.isCompleted ?
                                    Image(systemName: "dumbbell")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 30, height: 30)
                                        .foregroundColor(Color("Orange"))
                                    : nil
                                )
                            VStack(spacing:4){
                                // Day-of-the-week
                                Text(badge.day)
                                    .foregroundColor(badge.day == getToday() ? Color("Orange") : Color("Charcoal"))
                                    .font(.system(size:12))
                                    .fontWeight(badge.day == getToday() ? .semibold : .light)
                                if badge.day == getToday() {
                                    Image(systemName: "arrowtriangle.up.fill")
                                        .resizable()
                                        .frame(width: 16, height: 10)
                                        .foregroundColor(Color("Orange"))
                                }
                            }
                        }
                    }
                }
            }
            .padding(.horizontal, 24)
            .padding(.vertical, 12)
            Spacer()
        }
    }
}


#Preview {
    DailyProgressView()
}
