//
//  HomeViewModel.swift
//  fpl
//
//  Created by Adam Pagels on 2025-09-21.
//

import Foundation

@Observable
class HomeViewModel {
    private let apiService: FPLAPIService
    var state: HomeViewState = .idle

    init(apiService: FPLAPIService) {
        self.apiService = apiService
    }

    func loadTeam(teamId: Int, eventId: Int) async {
        state = .loading

        do {
            async let picksResponse = apiService.fetchPicks(teamId: teamId, eventId: eventId)
            async let bootstrapResponse = apiService.fetchBootstrap()

            let (picks, bootstrap) = try await (picksResponse, bootstrapResponse)

            let playersById = Dictionary(uniqueKeysWithValues: bootstrap.elements.map { ($0.id, $0) })

            let teamPlayers: [TeamPlayer] = picks.picks.compactMap { pick in
                guard let player = playersById[pick.element] else { return nil }
                return TeamPlayer(pick: pick, player: player)
            }

            state = .loaded(entryHistory: picks.entryHistory, teamPlayers: teamPlayers)
        } catch {
            print("error", error)
            state = .error("Failed to load team: \(error.localizedDescription)")
        }
    }
}
