//
//  FPLAPIService.swift
//  fpl
//
//  Created by Adam Pagels on 2025-09-21.
//

import Foundation

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

    func fetchEntryInfo(teamId: Int) async throws -> FPLEntry {
        let url = baseURL.appendingPathComponent("entry/\(teamId)")
        let (data, _) = try await URLSession.shared.data(from: url)
        let response = try JSONDecoder().decode(FPLEntry.self, from: data)
        return response
    }

    func fetchLeagueDetails(leagueId: Int) async throws -> StandingsResponse {
        let url = baseURL
            .appendingPathComponent(
                "leagues-classic/\(leagueId)/standings"
            )
        let (data, _) = try await URLSession.shared.data(from: url)
        let response = try JSONDecoder().decode(StandingsResponse.self, from: data)
        return response
    }

    func fetchliveData(eventId: Int) async throws -> LiveDataResponse {
        let url = baseURL.appendingPathComponent("event/\(eventId)/live/")
        let (data, _) = try await URLSession.shared.data(from: url)
        let response = try JSONDecoder().decode(LiveDataResponse.self, from: data)
        return response
    }
}
