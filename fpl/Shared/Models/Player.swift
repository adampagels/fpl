//
//  Player.swift
//  fpl
//
//  Created by Adam Pagels on 2025-09-21.
//

import Foundation

struct Player: Codable, Identifiable {
    let id: Int
    let webName: String
    let team: Int
    let elementType: Int
    let nowCost: Int
    let selectedByPercent: String
    let totalPoints: Int

    enum CodingKeys: String, CodingKey {
        case id
        case webName = "web_name"
        case team
        case elementType = "element_type"
        case nowCost = "now_cost"
        case selectedByPercent = "selected_by_percent"
        case totalPoints = "total_points"
    }
}
