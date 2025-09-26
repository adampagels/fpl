//
//  CompetitionsViewModel.swift
//  fpl
//
//  Created by Adam Pagels on 2025-09-22.
//

import Foundation

@Observable
class CompetitionsViewModel {
    @ObservationIgnored var entryStore: EntryStore
    var state: CompetitionsViewState = .idle

    init(entryStore: EntryStore) {
        self.entryStore = entryStore
    }
}
