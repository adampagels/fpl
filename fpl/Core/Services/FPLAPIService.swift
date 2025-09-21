//
//  FPLAPIService.swift
//  fpl
//
//  Created by Adam Pagels on 2025-09-21.
//

import SwiftUI

class FPLAPIService {
    let baseURL = URL(string: "https://fantasy.premierleague.com/api")!

    func fetchTeamInfo(teamId _: Int) {}

    func fetchPicks(teamId: Int, eventId: Int) async throws -> TeamPicksResponse {
        let url = baseURL.appendingPathComponent("entry/\(teamId)/event/\(eventId)/picks/")

        let (data, _) = try await URLSession.shared.data(from: url)
        let response = try JSONDecoder().decode(TeamPicksResponse.self, from: data)
        return response
    }
}
