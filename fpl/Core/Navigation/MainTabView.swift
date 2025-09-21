//
//  MainTabView.swift
//  fpl
//
//  Created by Adam Pagels on 2025-09-21.
//

import SwiftUI

struct MainTabView: View {
    private let apiService = FPLAPIService()
    private var homeViewModel: HomeViewModel

    init() {
        homeViewModel = HomeViewModel(apiService: apiService)
    }

    var body: some View {
        TabView {
            Tab("Home", systemImage: "house") {
                HomeView(homeViewModel: homeViewModel)
            }
        }
    }
}

#Preview {
    MainTabView()
}
