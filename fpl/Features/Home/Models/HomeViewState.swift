//
//  HomeViewState.swift
//  fpl
//
//  Created by Adam Pagels on 2025-09-21.
//

import Foundation

enum HomeViewState {
    case idle
    case loading
    case loaded(LoadedState)
    case error(String)
}

struct LoadedState {
    let entryHistory: EntryHistory
    let teamPlayers: [TeamPlayer]
    var isRefreshing: Bool = false

    var totalLiveTeamPoints: Int {
        teamPlayers.reduce(0) {
            $0 + $1.liveStats.stats.totalPoints
        }
    }
}
