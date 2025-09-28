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
                            switch league.rankMovement {
                            case .up:
                                Image(systemName: "arrow.up.circle.fill")
                                    .foregroundStyle(.green)
                            case .down:
                                Image(systemName: "arrow.down.circle.fill")
                                    .foregroundStyle(.red)
                            case .same:
                                Image(systemName: "minus.circle.fill")
                                    .foregroundStyle(.gray)
                            }
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
