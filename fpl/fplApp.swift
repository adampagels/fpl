//
//  fplApp.swift
//  fpl
//
//  Created by Adam Pagels on 2025-09-11.
//

import SwiftData
import SwiftUI

@main
struct fplApp: App {
    @State private var homeViewModel = HomeViewModel(apiService: FPLAPIService())
    @State private var competitionsViewModel = CompetitionsViewModel(apiService: FPLAPIService())

    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            MainTabView()
                .environment(homeViewModel)
                .environment(competitionsViewModel)
        }
        .modelContainer(sharedModelContainer)
    }
}
