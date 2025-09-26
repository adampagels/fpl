//
//  EntryStore.swift
//  fpl
//
//  Created by Adam Pagels on 2025-09-25.
//

import SwiftUI

@Observable
class EntryStore {
    private let apiService: FPLAPIService
    var entry: FPLEntry?
    var currentEvent: Int = 0

    init(apiService: FPLAPIService) {
        self.apiService = apiService
    }

    func loadEntry(teamId: Int) async {
        do {
            let entry = try await apiService.fetchEntryInfo(teamId: teamId)
            self.entry = entry
            currentEvent = entry.currentEvent
        } catch {
            print("Failed to load entry", error)
        }
    }
}
