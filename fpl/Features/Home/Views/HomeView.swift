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
            case let .loaded(loaded):
                VStack(alignment: .leading) {
                    Text("Gameweek: \(viewModel.currentEvent)")
                    Text("GW Points: \(loaded.entryHistory.points)")
                    Text("Total Points: \(loaded.entryHistory.totalPoints)")
                    Text("Overall Rank: \(loaded.entryHistory.overallRank)")

                    List(loaded.teamPlayers) { tp in
                        HStack {
                            Text(tp.player.webName)
                            Spacer()
                            Text(String(tp.liveStats.stats.totalPoints))
                            Text(tp.isOnBench ? "Bench" : "Starter")
                        }
                    }
                    .refreshable {
                        await viewModel.loadTeam(teamId: 4_436_644, isRefreshing: true)
                    }
                }
            }
        }
        .task(id: viewModel.currentEvent) {
            await viewModel.loadTeam(teamId: 4_436_644, isRefreshing: false)
        }
    }
}

#Preview {
    HomeView()
        .environment(HomeViewModel(apiService: FPLAPIService(), entryStore: EntryStore(apiService: FPLAPIService())))
}
