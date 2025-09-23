//
//  EntryInfoResponse.swift
//  fpl
//
//  Created by Adam Pagels on 2025-09-22.
//

import Foundation

struct ActivePhase: Codable, Identifiable {
    let id = UUID()
    let phase: Int
    let rank: Int
    let lastRank: Int
    let rankSort: Int
    let total: Int
    let leagueId: Int
    let rankCount: Int?
    let entryPercentileRank: Int?

    enum CodingKeys: String, CodingKey {
        case phase, rank, total
        case lastRank = "last_rank"
        case rankSort = "rank_sort"
        case leagueId = "league_id"
        case rankCount = "rank_count"
        case entryPercentileRank = "entry_percentile_rank"
    }
}

struct ClassicLeague: Codable, Identifiable {
    let id: Int
    let name: String
    let shortName: String?
    let created: String
    let closed: Bool
    let rank: Int?
    let maxEntries: Int?
    let leagueType: String
    let scoring: String
    let adminEntry: Int?
    let startEvent: Int
    let entryCanLeave: Bool
    let entryCanAdmin: Bool
    let entryCanInvite: Bool
    let hasCup: Bool
    let cupLeague: Int?
    let cupQualified: Bool?
    let rankCount: Int?
    let entryPercentileRank: Int?
    let activePhases: [ActivePhase]
    let entryRank: Int
    let entryLastRank: Int

    enum CodingKeys: String, CodingKey {
        case id, name, created, closed, rank, scoring
        case shortName = "short_name"
        case maxEntries = "max_entries"
        case leagueType = "league_type"
        case adminEntry = "admin_entry"
        case startEvent = "start_event"
        case entryCanLeave = "entry_can_leave"
        case entryCanAdmin = "entry_can_admin"
        case entryCanInvite = "entry_can_invite"
        case hasCup = "has_cup"
        case cupLeague = "cup_league"
        case cupQualified = "cup_qualified"
        case rankCount = "rank_count"
        case entryPercentileRank = "entry_percentile_rank"
        case activePhases = "active_phases"
        case entryRank = "entry_rank"
        case entryLastRank = "entry_last_rank"
    }
}

struct H2HLeague: Codable, Identifiable {
    let id: Int
    let name: String
    let shortName: String?
    let created: String
    let closed: Bool
    let rank: Int?
    let maxEntries: Int?
    let leagueType: String
    let scoring: String
    let adminEntry: Int?
    let startEvent: Int
    let entryCanLeave: Bool
    let entryCanAdmin: Bool
    let entryCanInvite: Bool
    let hasCup: Bool
    let cupLeague: Int?
    let cupQualified: Bool?

    enum CodingKeys: String, CodingKey {
        case id, name, created, closed, rank, scoring
        case shortName = "short_name"
        case maxEntries = "max_entries"
        case leagueType = "league_type"
        case adminEntry = "admin_entry"
        case startEvent = "start_event"
        case entryCanLeave = "entry_can_leave"
        case entryCanAdmin = "entry_can_admin"
        case entryCanInvite = "entry_can_invite"
        case hasCup = "has_cup"
        case cupLeague = "cup_league"
        case cupQualified = "cup_qualified"
    }
}

struct CupMatch: Codable, Identifiable {
    let id: Int
    let entry1Entry: Int
    let entry1Name: String
    let entry1PlayerName: String
    let entry1Points: Int
    let entry1Win: Int
    let entry1Draw: Int
    let entry1Loss: Int
    let entry1Total: Int
    let entry2Entry: Int
    let entry2Name: String
    let entry2PlayerName: String
    let entry2Points: Int
    let entry2Win: Int
    let entry2Draw: Int
    let entry2Loss: Int
    let entry2Total: Int
    let isKnockout: Bool
    let winner: Int?
    let seedValue: Int?
    let event: Int
    let tiebreak: Int?
    let isBye: Bool

    enum CodingKeys: String, CodingKey {
        case id, event, winner, tiebreak
        case entry1Entry = "entry_1_entry"
        case entry1Name = "entry_1_name"
        case entry1PlayerName = "entry_1_player_name"
        case entry1Points = "entry_1_points"
        case entry1Win = "entry_1_win"
        case entry1Draw = "entry_1_draw"
        case entry1Loss = "entry_1_loss"
        case entry1Total = "entry_1_total"
        case entry2Entry = "entry_2_entry"
        case entry2Name = "entry_2_name"
        case entry2PlayerName = "entry_2_player_name"
        case entry2Points = "entry_2_points"
        case entry2Win = "entry_2_win"
        case entry2Draw = "entry_2_draw"
        case entry2Loss = "entry_2_loss"
        case entry2Total = "entry_2_total"
        case isKnockout = "is_knockout"
        case seedValue = "seed_value"
        case isBye = "is_bye"
    }
}

struct CupStatus: Codable {
    let qualificationEvent: Int?
    let qualificationNumbers: Int?
    let qualificationRank: Int?
    let qualificationState: String?

    enum CodingKeys: String, CodingKey {
        case qualificationEvent = "qualification_event"
        case qualificationNumbers = "qualification_numbers"
        case qualificationRank = "qualification_rank"
        case qualificationState = "qualification_state"
    }
}

struct Cup: Codable {
    let matches: [CupMatch]
    let status: CupStatus
    let cupLeague: Int?

    enum CodingKeys: String, CodingKey {
        case matches, status
        case cupLeague = "cup_league"
    }
}

struct Leagues: Codable {
    let classic: [ClassicLeague]
    let h2h: [H2HLeague]
    let cup: Cup
    let cupMatches: [CupMatch]

    enum CodingKeys: String, CodingKey {
        case classic, h2h, cup
        case cupMatches = "cup_matches"
    }
}

struct FPLEntry: Codable, Identifiable {
    let id: Int
    let joinedTime: String
    let startedEvent: Int
    let favouriteTeam: Int
    let playerFirstName: String
    let playerLastName: String
    let playerRegionId: Int
    let playerRegionName: String
    let playerRegionIsoCodeShort: String
    let playerRegionIsoCodeLong: String
    let yearsActive: Int
    let summaryOverallPoints: Int
    let summaryOverallRank: Int
    let summaryEventPoints: Int
    let summaryEventRank: Int
    let currentEvent: Int
    let leagues: Leagues
    let name: String
    let nameChangeBlocked: Bool
    let enteredEvents: [Int]
    let kit: String?
    let lastDeadlineBank: Int
    let lastDeadlineValue: Int
    let lastDeadlineTotalTransfers: Int
    let clubBadgeSrc: String?

    enum CodingKeys: String, CodingKey {
        case id, name, leagues, kit
        case joinedTime = "joined_time"
        case startedEvent = "started_event"
        case favouriteTeam = "favourite_team"
        case playerFirstName = "player_first_name"
        case playerLastName = "player_last_name"
        case playerRegionId = "player_region_id"
        case playerRegionName = "player_region_name"
        case playerRegionIsoCodeShort = "player_region_iso_code_short"
        case playerRegionIsoCodeLong = "player_region_iso_code_long"
        case yearsActive = "years_active"
        case summaryOverallPoints = "summary_overall_points"
        case summaryOverallRank = "summary_overall_rank"
        case summaryEventPoints = "summary_event_points"
        case summaryEventRank = "summary_event_rank"
        case currentEvent = "current_event"
        case nameChangeBlocked = "name_change_blocked"
        case enteredEvents = "entered_events"
        case lastDeadlineBank = "last_deadline_bank"
        case lastDeadlineValue = "last_deadline_value"
        case lastDeadlineTotalTransfers = "last_deadline_total_transfers"
        case clubBadgeSrc = "club_badge_src"
    }
}

extension FPLEntry {
    var playerFullName: String {
        "\(playerFirstName) \(playerLastName)"
    }

    var formattedBank: String {
        "£\(String(format: "%.1f", Double(lastDeadlineBank) / 10))m"
    }

    var formattedSquadValue: String {
        "£\(String(format: "%.1f", Double(lastDeadlineValue) / 10))m"
    }

    var formattedOverallRank: String {
        summaryOverallRank.formatted(.number)
    }

    var formattedEventRank: String {
        summaryEventRank.formatted(.number)
    }

    var hasClassicLeagues: Bool {
        !leagues.classic.isEmpty
    }

    var hasH2HLeagues: Bool {
        !leagues.h2h.isEmpty
    }

    var hasActiveCup: Bool {
        !leagues.cup.matches.isEmpty
    }

    var joinedDate: Date? {
        ISO8601DateFormatter().date(from: joinedTime)
    }
}

// MARK: - League Type Enums

enum LeagueType: String, CaseIterable {
    case standard = "s"
    case `private` = "x"
    case headToHead = "h"

    var displayName: String {
        switch self {
        case .standard:
            return "Standard"
        case .private:
            return "Private"
        case .headToHead:
            return "Head-to-Head"
        }
    }
}

enum ScoringType: String, CaseIterable {
    case classic = "c"
    case headToHead = "h"

    var displayName: String {
        switch self {
        case .classic:
            return "Classic"
        case .headToHead:
            return "Head-to-Head"
        }
    }
}
