//
//  HomeView.swift
//  fpl
//
//  Created by Adam Pagels on 2025-09-21.
//

import SwiftUI

struct HomeView: View {
    @Environment(HomeViewModel.self) private var viewModel

    var body: some View {
        Group {
            switch viewModel.state {
            case .idle:
                Text("Welcome! Load your team.")
            case .loading:
                ProgressView("Loading team…")
            case let .error(message):
                Text("Error: \(message)").foregroundColor(.red)
            case let .loaded(entryHistory, teamPlayers):
                VStack(alignment: .leading) {
                    Text("Gameweek: \(viewModel.currentEvent)")
                    Text("GW Points: \(entryHistory.points)")
                    Text("Total Points: \(entryHistory.totalPoints)")
                    Text("Overall Rank: \(entryHistory.overallRank)")

                    List(teamPlayers) { tp in
                        HStack {
                            Text(tp.player.webName)
                            Spacer()
                            Text(String(tp.liveStats.stats.totalPoints))
                            Text(tp.isOnBench ? "Bench" : "Starter")
                        }
                    }
                }
            }
        }
        .task(id: viewModel.currentEvent) {
            await viewModel.loadTeam(teamId: 4_436_644)
        }
    }
}

#Preview {
    HomeView()
        .environment(HomeViewModel(apiService: FPLAPIService(), entryStore: EntryStore(apiService: FPLAPIService())))
}
