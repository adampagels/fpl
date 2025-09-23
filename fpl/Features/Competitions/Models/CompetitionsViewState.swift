//
//  CompetitionsViewState.swift
//  fpl
//
//  Created by Adam Pagels on 2025-09-22.
//

import Foundation

enum CompetitionsViewState {
    case idle
    case loading
    case loaded(entryInfo: FPLEntry)
    case error(String)
}
