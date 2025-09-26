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
    let apiService = FPLAPIService()
    let entryStore = EntryStore(apiService: apiService)

    MainTabView()
        .environment(entryStore)
        .environment(HomeViewModel(apiService: apiService, entryStore: entryStore))
        .environment(CompetitionsViewModel(entryStore: entryStore))
}
