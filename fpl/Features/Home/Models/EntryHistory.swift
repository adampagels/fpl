//
//  EntryHistory.swift
//  fpl
//
//  Created by Adam Pagels on 2025-09-21.
//

struct EntryHistory: Codable {
    let event: Int
    let points: Int
    let totalPoints: Int
    let rank: Int
    let rankSort: Int
    let overallRank: Int
    let percentileRank: Int
    let bank: Int
    let value: Int
    let eventTransfers: Int
    let eventTransfersCost: Int
    let pointsOnBench: Int

    enum CodingKeys: String, CodingKey {
        case event, points
        case totalPoints = "total_points"
        case rank
        case rankSort = "rank_sort"
        case overallRank = "overall_rank"
        case percentileRank = "percentile_rank"
        case bank, value
        case eventTransfers = "event_transfers"
        case eventTransfersCost = "event_transfers_cost"
        case pointsOnBench = "points_on_bench"
    }
}
