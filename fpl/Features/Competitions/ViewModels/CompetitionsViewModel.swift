//
//  CompetitionsViewModel.swift
//  fpl
//
//  Created by Adam Pagels on 2025-09-22.
//

import Foundation

@Observable
class CompetitionsViewModel {
    private let apiService: FPLAPIService
    var state: CompetitionsViewState = .idle

    init(apiService: FPLAPIService) {
        self.apiService = apiService
    }

    func loadEntryInfo(teamId: Int) async {
        do {
            let entryResponse = try await apiService.fetchEntryInfo(teamId: teamId)
            state = .loaded(entryInfo: entryResponse)
        } catch {
            print("error", error)
            state = .error("Failed to load team: \(error.localizedDescription)")
        }
    }
}
