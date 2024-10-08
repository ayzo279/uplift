//
//  HomeView.swift
//  uplift
//
//  Created by Andy Zhuo on 10/1/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack(spacing:0){
            HomeHeaderView()
            ZStack{
                ScrollView{
                    Rectangle()
                        .fill(Color("lightGray"))
                        .frame(width:.infinity, height: 4)
                    DailyProgressView()
                    Rectangle()
                        .fill(Color("lightGray"))
                        .frame(width:.infinity, height: 4)
                    ProgressChartView()
                    Rectangle()
                        .fill(Color("lightGray"))
                        .frame(width:.infinity, height: 4)
                    FriendHistoryView()
                }
                .padding(.top, -10)
                .padding(.bottom, 72)
                TabBarView()
            }
        }
        .navigationBarBackButtonHidden(true)
        .background(Color("White"))
    }
}

#Preview {
    HomeView()
}
