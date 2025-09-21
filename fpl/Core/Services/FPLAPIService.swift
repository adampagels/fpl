//
//  FPLAPIService.swift
//  fpl
//
//  Created by Adam Pagels on 2025-09-21.
//

import Foundation

struct BootstrapResponse: Codable {
    let events: [Gameweek]
    let teams: [Team]
    let elements: [Player]
}

struct Gameweek: Codable, Identifiable {
    let id: Int
    let name: String
    let deadlineTime: String
    let finished: Bool
    let dataChecked: Bool
    let isNext: Bool
    let isCurrent: Bool
    let isPrevious: Bool

    enum CodingKeys: String, CodingKey {
        case id, name
        case deadlineTime = "deadline_time"
        case finished
        case dataChecked = "data_checked"
        case isNext = "is_next"
        case isCurrent = "is_current"
        case isPrevious = "is_previous"
    }
}

struct Team: Codable, Identifiable {
    let id: Int
    let name: String
    let shortName: String
    let strength: Int

    enum CodingKeys: String, CodingKey {
        case id, name
        case shortName = "short_name"
        case strength
    }
}

struct Player: Codable, Identifiable {
    let id: Int
    let webName: String
    let team: Int
    let elementType: Int
    let nowCost: Int
    let selectedByPercent: String
    let totalPoints: Int

    enum CodingKeys: String, CodingKey {
        case id
        case webName = "web_name"
        case team
        case elementType = "element_type"
        case nowCost = "now_cost"
        case selectedByPercent = "selected_by_percent"
        case totalPoints = "total_points"
    }
}

class FPLAPIService {
    private let baseURL = URL(string: "https://fantasy.premierleague.com/api")!
    private var cachedBootstrap: BootstrapResponse?

    func fetchTeamInfo(teamId: Int) async throws -> Data {
        let url = baseURL.appendingPathComponent("entry/\(teamId)/")
        let (data, _) = try await URLSession.shared.data(from: url)
        return data
    }

    func fetchPicks(teamId: Int, eventId: Int) async throws -> TeamPicksResponse {
        let url = baseURL.appendingPathComponent("entry/\(teamId)/event/\(eventId)/picks/")
        let (data, _) = try await URLSession.shared.data(from: url)
        let response = try JSONDecoder().decode(TeamPicksResponse.self, from: data)
        return response
    }

    func fetchBootstrap() async throws -> BootstrapResponse {
        if let cached = cachedBootstrap {
            return cached
        }
        let url = baseURL.appendingPathComponent("bootstrap-static/")
        let (data, _) = try await URLSession.shared.data(from: url)
        let bootstrap = try JSONDecoder().decode(BootstrapResponse.self, from: data)
        cachedBootstrap = bootstrap
        return bootstrap
    }
}
