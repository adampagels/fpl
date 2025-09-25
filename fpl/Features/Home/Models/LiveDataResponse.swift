//
//  LiveDataResponse.swift
//  fpl
//
//  Created by Adam Pagels on 2025-09-24.
//

import Foundation

// MARK: - Live data response

struct LiveDataResponse: Codable {
    let elements: [Element]
}

// MARK: - Element

struct Element: Codable, Identifiable {
    let id: Int
    let stats: Stats
    let explain: [Explain]?
    let modified: Bool?
}

// MARK: - Stats

struct Stats: Codable {
    let minutes: Int
    let goalsScored: Int
    let assists: Int
    let cleanSheets: Int
    let goalsConceded: Int
    let ownGoals: Int
    let penaltiesMissed: Int
    let penaltiesSaved: Int
    let bonus: Int
    let bps: Int
    let influence: String
    let creativity: String
    let threat: String
    let ictIndex: String
    let defensiveContribution: Int
    let expectedGoals: String
    let expectedAssists: String
    let expectedGoalInvolvements: String
    let starts: Int
    let redCards: Int
    let yellowCards: Int
    let saves: Int
    let recoveries: Int
    let totalPoints: Int

    enum CodingKeys: String, CodingKey {
        case minutes, assists, bonus, bps, starts, saves, recoveries
        case goalsScored = "goals_scored"
        case cleanSheets = "clean_sheets"
        case goalsConceded = "goals_conceded"
        case ownGoals = "own_goals"
        case penaltiesMissed = "penalties_missed"
        case penaltiesSaved = "penalties_saved"
        case influence, creativity, threat
        case ictIndex = "ict_index"
        case defensiveContribution = "defensive_contribution"
        case expectedGoals = "expected_goals"
        case expectedAssists = "expected_assists"
        case expectedGoalInvolvements = "expected_goal_involvements"
        case redCards = "red_cards"
        case yellowCards = "yellow_cards"
        case totalPoints = "total_points"
    }
}

// MARK: - Explain

struct Explain: Codable {
    let fixture: Int
    let stats: [ExplainStat]
}

// MARK: - ExplainStat

struct ExplainStat: Codable {
    let identifier: String
    let points: Int
    let value: Int
    let pointsModification: Int

    enum CodingKeys: String, CodingKey {
        case identifier, points, value
        case pointsModification = "points_modification"
    }
}
