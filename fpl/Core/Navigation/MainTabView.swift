//
//  MainTabView.swift
//  fpl
//
//  Created by Adam Pagels on 2025-09-21.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            Tab("Home", systemImage: "house") {
                HomeView()
            }
            Tab("Competitions", systemImage: "trophy") {
                CompetitionsView()
            }
        }
    }
}

#Preview {
    MainTabView()
        .environment(HomeViewModel(apiService: FPLAPIService()))
        .environment(CompetitionsViewModel(apiService: FPLAPIService()))
}
