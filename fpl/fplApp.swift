//
//  fplApp.swift
//  fpl
//
//  Created by Adam Pagels on 2025-09-11.
//

import SwiftData
import SwiftUI

private struct APIServiceKey: EnvironmentKey {
    static let defaultValue: FPLAPIService = .init()
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
    @State private var entryStore: EntryStore

    init() {
        let apiService = FPLAPIService()
        let store = EntryStore(apiService: apiService)
        _entryStore = State(wrappedValue: store)

        _homeViewModel = State(wrappedValue: HomeViewModel(apiService: apiService, entryStore: store))
        _competitionsViewModel = State(wrappedValue: CompetitionsViewModel(entryStore: store))
    }

    var body: some Scene {
        WindowGroup {
            MainTabView()
                .environment(homeViewModel)
                .environment(competitionsViewModel)
                .environment(entryStore)
                .environment(\.apiService, apiService)
                .task {
                    await entryStore.loadEntry(teamId: 4_436_644)
                }
        }
    }
}
