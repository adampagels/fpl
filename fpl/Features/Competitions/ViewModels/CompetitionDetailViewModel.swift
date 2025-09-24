//
//  CompetitionsDetailViewModel.swift
//  fpl
//
//  Created by Adam Pagels on 2025-09-23.
//

import SwiftUI

@Observable
class CompetitionDetailViewModel {
    private let apiService: FPLAPIService

    var state: CompetitionDetailViewState = .idle

    init(apiService: FPLAPIService) {
        self.apiService = apiService
    }

    func loadCompetitionDetails(leagueId: Int) async {
        do {
            let details = try await apiService.fetchLeagueDetails(leagueId: leagueId)
            state = .loaded(leagueInfo: details)
        } catch {
            print(error)
            state = .error("Failed to load competition: \(error.localizedDescription)")
        }
    }
}
