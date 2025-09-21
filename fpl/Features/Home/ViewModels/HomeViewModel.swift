//
//  HomeViewModel.swift
//  fpl
//
//  Created by Adam Pagels on 2025-09-21.
//

import Foundation

@Observable
class HomeViewModel {
    private let apiService: FPLAPIService

    init(apiService: FPLAPIService) {
        self.apiService = apiService
    }

    func loadTeamPicks() async {
        do {
            let response = try await apiService.fetchPicks(teamId: 4_436_644, eventId: 5)
            print(response)
        } catch {
            print("error")
        }
    }
}
