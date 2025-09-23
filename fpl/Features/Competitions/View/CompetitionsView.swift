//
//  CompetitionsView.swift
//  fpl
//
//  Created by Adam Pagels on 2025-09-22.
//

import SwiftUI

struct CompetitionsView: View {
    @Environment(CompetitionsViewModel.self) private var viewModel

    var body: some View {
        Group {
            switch viewModel.state {
            case .idle:
                Text("Welcome! Load your entry info.")
            case .loading:
                ProgressView("Loading entry info…")
            case let .error(message):
                Text("Error: \(message)").foregroundColor(.red)
            case let .loaded(entryInfo):
                VStack(alignment: .leading) {
                    Text("GW Points: \(entryInfo.summaryEventPoints)")
//                    Text("Total Points: \(entryHistory.totalPoints)")
//                    Text("Overall Rank: \(entryHistory.overallRank)")

                    List(entryInfo.leagues.classic) { league in
                        HStack {
                            Text(league.name)
                            Spacer()
                            Text(String(league.entryRank))
                        }
                    }
                }
            }
        }
        .task {
            await viewModel.loadEntryInfo(teamId: 4_436_644)
        }
    }
}

#Preview {
    CompetitionsView()
        .environment(CompetitionsViewModel(apiService: FPLAPIService()))
}
