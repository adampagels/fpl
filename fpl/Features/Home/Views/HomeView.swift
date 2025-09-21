//
//  HomeView.swift
//  fpl
//
//  Created by Adam Pagels on 2025-09-21.
//

import SwiftUI

struct HomeView: View {
    var homeViewModel: HomeViewModel
    var body: some View {
        Text("Home")
            .task {
                await homeViewModel.loadTeamPicks()
            }
    }
}

#Preview {
    HomeView(homeViewModel: HomeViewModel(apiService: FPLAPIService()))
}
