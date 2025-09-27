//
//  HomeViewModel.swift
//  fpl
//
//  Created by Adam Pagels on 2025-09-21.
//

import Foundation

@Observable
class HomeViewModel {
    @ObservationIgnored private var entryStore: EntryStore
    private let apiService: FPLAPIService
    var state: HomeViewState = .idle

    var currentEvent: Int { entryStore.currentEvent }

    init(apiService: FPLAPIService, entryStore: EntryStore) {
        self.apiService = apiService
        self.entryStore = entryStore
    }

    func loadTeam(teamId: Int, isRefreshing: Bool) async {
        guard currentEvent > 0 else { return }

        switch state {
        case let .loaded(loaded):
            if isRefreshing {
                state = .loaded(LoadedState(
                    entryHistory: loaded.entryHistory,
                    teamPlayers: loaded.teamPlayers,
                    isRefreshing: true
                ))
            } else {
                state = .loading
            }
        default:
            state = isRefreshing ? state : .loading
        }

        do {
            async let picksResponse = apiService.fetchPicks(teamId: teamId, eventId: currentEvent)
            async let bootstrapResponse = apiService.fetchBootstrap()
            async let liveTeamResponse = apiService.fetchliveData(eventId: currentEvent)
            let (picks, bootstrap, liveTeamData) = try await (picksResponse, bootstrapResponse, liveTeamResponse)

            let playersById = Dictionary(uniqueKeysWithValues: bootstrap.elements.map { ($0.id, $0) })
            let teamPlayers: [TeamPlayer] = picks.picks.compactMap { pick in
                guard let player = playersById[pick.element] else { return nil }
                guard let liveStats = liveTeamData.elements.first(where: { $0.id == player.id }) else { return nil }
                return TeamPlayer(pick: pick, player: player, liveStats: liveStats)
            }

            state = .loaded(LoadedState(
                entryHistory: picks.entryHistory,
                teamPlayers: teamPlayers,
                isRefreshing: false
            ))
        } catch {
            print("error", error)
            state = .error("Failed to load team: \(error.localizedDescription)")
        }
    }
}
