//
//  CompetitionDetailView.swift
//  fpl
//
//  Created by Adam Pagels on 2025-09-23.
//

import SwiftUI

struct CompetitionDetailView: View {
    let leagueName: String
    let leagueId: Int

    let viewModel: CompetitionDetailViewModel

    init(leagueName: String, leagueId: Int, viewModel: CompetitionDetailViewModel) {
        self.leagueName = leagueName
        self.leagueId = leagueId
        self.viewModel = viewModel
    }

    var body: some View {
        Group {
            switch viewModel.state {
            case .idle:
                Text("Welcome! Load your entry info.")
            case .loading:
                ProgressView("Loading entry info…")
            case let .error(message):
                Text("Error: \(message)").foregroundColor(.red)
            case let .loaded(leagueInfo):
                VStack(alignment: .leading) {
                    List(leagueInfo.standings?.results ?? []) { team in
                        HStack {
                            Text(String(team.rank))
                            Text(team.entryName)
                            Spacer()
                            Text(String(team.eventTotal))
                            Text(String(team.total))
                        }
                    }
                }
            }
        }
        .task {
            await viewModel.loadCompetitionDetails(leagueId: leagueId)
        }
        .navigationTitle(leagueName)
    }
}

#Preview {
    CompetitionDetailView(
        leagueName: "League name",
        leagueId:
        828_227,
        viewModel: CompetitionDetailViewModel(apiService: FPLAPIService())
    )
}
