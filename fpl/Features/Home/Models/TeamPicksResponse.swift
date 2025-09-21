//
//  TeamPicksResponse.swift
//  fpl
//
//  Created by Adam Pagels on 2025-09-21.
//

struct TeamPicksResponse: Codable {
    let activeChip: String?
    let automaticSubs: [Pick]
    let entryHistory: EntryHistory
    let picks: [Pick]

    enum CodingKeys: String, CodingKey {
        case activeChip = "active_chip"
        case automaticSubs = "automatic_subs"
        case entryHistory = "entry_history"
        case picks
    }
}
