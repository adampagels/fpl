//
//  RankMovement.swift
//  fpl
//
//  Created by Adam Pagels on 2025-09-28.
//

enum RankMovement {
    case up, down, same
}

func getRankMovement(previousRank: Int, currentRank: Int) -> RankMovement {
    if previousRank > currentRank {
        return .up
    } else if previousRank < currentRank {
        return .down
    } else {
        return .same
    }
}
