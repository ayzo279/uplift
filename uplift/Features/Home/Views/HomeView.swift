//
//  HomeView.swift
//  uplift
//
//  Created by Andy Zhuo on 10/1/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack{
            HomeHeaderView()
            ScrollView{
                DailyProgressView()
            }
            TabBarView()
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    HomeView()
}
