//
//  fplApp.swift
//  fpl
//
//  Created by Adam Pagels on 2025-09-11.
//

import SwiftData
import SwiftUI

private struct APIServiceKey: EnvironmentKey {
    static let defaultValue: FPLAPIService = FPLAPIService()
}

extension EnvironmentValues {
    var apiService: FPLAPIService {
        get { self[APIServiceKey.self] }
        set { self[APIServiceKey.self] = newValue }
    }
}

@main
struct fplApp: App {
    private let apiService = FPLAPIService()
    @State private var homeViewModel: HomeViewModel
    @State private var competitionsViewModel: CompetitionsViewModel

    init() {
        _homeViewModel = State(wrappedValue: HomeViewModel(apiService: apiService))
        _competitionsViewModel = State(wrappedValue: CompetitionsViewModel(apiService: apiService))
    }

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
                .environment(\.apiService, apiService)
        }
        .modelContainer(sharedModelContainer)
    }
}
