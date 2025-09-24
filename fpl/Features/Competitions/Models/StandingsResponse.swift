//
//  StandingsResponse.swift
//  fpl
//
//  Created by Adam Pagels on 2025-09-23.
//

import Foundation

// MARK: - Root Response

struct StandingsResponse: Codable {
    let newEntries: Pagination<Entry>?
    let lastUpdatedData: String
    let league: League
    let standings: Pagination<StandingEntry>?

    enum CodingKeys: String, CodingKey {
        case newEntries = "new_entries"
        case lastUpdatedData = "last_updated_data"
        case league, standings
    }
}

// MARK: - League

struct League: Codable {
    let id: Int
    let name: String
    let created: String
    let closed: Bool
}

// MARK: - Pagination

struct Pagination<T: Codable>: Codable {
    let hasNext: Bool
    let page: Int
    let results: [T]

    enum CodingKeys: String, CodingKey {
        case hasNext = "has_next"
        case page, results
    }
}

struct Entry: Codable {
    // TODO: Add structure once it's known
}

// MARK: - StandingEntry

struct StandingEntry: Codable, Identifiable {
    let id: Int
    let eventTotal: Int
    let playerName: String
    let rank: Int
    let lastRank: Int
    let rankSort: Int
    let total: Int
    let entry: Int
    let entryName: String
    let hasPlayed: Bool

    enum CodingKeys: String, CodingKey {
        case id, entry, total, rank, lastRank = "last_rank", rankSort = "rank_sort"
        case eventTotal = "event_total"
        case playerName = "player_name"
        case entryName = "entry_name"
        case hasPlayed = "has_played"
    }
}
