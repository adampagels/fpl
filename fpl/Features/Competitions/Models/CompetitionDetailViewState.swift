//
//  CompetitionDetailState.swift
//  fpl
//
//  Created by Adam Pagels on 2025-09-23.
//

import Foundation

enum CompetitionDetailViewState {
    case idle
    case loading
    case loaded(leagueInfo: StandingsResponse)
    case error(String)
}
