//
//  TabBarView.swift
//  uplift
//
//  Created by Andy Zhuo on 10/1/24.
//

import SwiftUI

struct TabBarView: View {
    @State private var selectedTab: Tab = .home
    var body: some View {
        ZStack{
            VStack{
               // Navigation to tabs
//                     switch selectedTab {
//                     case .home:
//                         HomeView()
//                     case .social:
//                         SocialView()
//                     case .train:
//                         TrainView()
//                     case .workouts:
//                         WorkoutsView()
//                     case .progress:
//                         ProgressView()
//                     }
                    
                Spacer()
                
                ZStack(alignment:.bottom){
                    Rectangle()
                        .fill(Color.white)
                        .frame(height: 72)
                        .shadow(color: .black.opacity(0.1), radius: 3, x: 0, y: -5)
                    HStack{
                        TabBarButton(iconName: "house", tab: .home, tabName:"Home", selectedTab: $selectedTab)
                        TabBarButton(iconName: "person.2", tab:.social, tabName:"Social",selectedTab: $selectedTab)
                        Spacer(minLength: 80)
                        TabBarButton(iconName: "list.bullet.rectangle.portrait", tab: .workouts, tabName:"Workouts",selectedTab: $selectedTab)
                        TabBarButton(iconName: "chart.bar", tab: .progress, tabName:"Progress",selectedTab: $selectedTab)
                    }
                    .padding(.horizontal)
                    .padding(.top, 8)
                    .frame(height: 72)
                    .background(Color("White"))
                }
            }

            VStack {
                Spacer()
                HStack {
                    Spacer()
                    TrainButton()
                    Spacer()
                }
                .padding(.bottom, 6)
            }
        }
    }
}


enum Tab {
    case home, social, train, workouts, progress
}

struct TabBarButton: View {
    var iconName: String
    var tab: Tab
    var tabName: String
    @Binding var selectedTab: Tab
    
    var body: some View {
        Button(action: {
          selectedTab = tab
        }) {
            VStack(spacing:4){
                Image(systemName: iconName)
                    .font(.system(size: 30))
                    .frame(maxWidth: .infinity)
                Text(tabName)
                    .font(.system(size:12))
                    .fontWeight(.semibold)
            }
            .foregroundColor(selectedTab == tab ? Color("Orange") : Color("Charcoal"))
        }
    }
}

struct TrainButton: View {
    var body: some View {
        Button(action: {
            // Action for the Train button
        }) {
            VStack(spacing: 10){
                ZStack {
                    Circle()
                        .fill(Color("White"))
                        .frame(width: 80, height: 80)
                        .shadow(color: Color("Charcoal").opacity(0.4), radius: 3, x: 0, y: 0)

                    Circle()
                        .fill(Color("Orange"))
                        .frame(width: 68, height: 68)
                    Image(systemName: "dumbbell")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 48)
                        .foregroundColor(.white)
                }
                Text("Train")
                    .font(.system(size:12))
                    .fontWeight(.semibold)
                    .foregroundColor(Color("Charcoal"))
            }

        }
    }
}

#Preview {
    TabBarView()
}
