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
    case loaded(entryHistory: EntryHistory, teamPlayers: [TeamPlayer])
    case error(String)
}
