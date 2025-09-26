//
//  CompetitionsView.swift
//  fpl
//
//  Created by Adam Pagels on 2025-09-22.
//

import SwiftUI

struct CompetitionsView: View {
    @Environment(CompetitionsViewModel.self) private var viewModel
    @Environment(\.apiService) private var apiService

    var body: some View {
        NavigationStack {
            Group {
//                        Text("GW Points: \(entryInfo.summaryEventPoints)")
//                    Text("Total Points: \(entryHistory.totalPoints)")
//                    Text("Overall Rank: \(entryHistory.overallRank)")
                List(viewModel.entryStore.entry?.leagues.classic ?? []) { league in
                    NavigationLink(destination: CompetitionDetailView(
                        leagueName: league.name,
                        leagueId: league.id,
                        viewModel: CompetitionDetailViewModel(apiService: apiService)
                    )) {
                        HStack {
                            Text(league.name)
                            Spacer()
                            Text(String(league.entryRank))
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    CompetitionsView()
        .environment(CompetitionsViewModel(entryStore: EntryStore(apiService: FPLAPIService())))
}
