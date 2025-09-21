//
//  Gameweek.swift
//  fpl
//
//  Created by Adam Pagels on 2025-09-21.
//

import Foundation

struct Gameweek: Codable, Identifiable {
    let id: Int
    let name: String
    let deadlineTime: String
    let finished: Bool
    let dataChecked: Bool
    let isNext: Bool
    let isCurrent: Bool
    let isPrevious: Bool

    enum CodingKeys: String, CodingKey {
        case id, name
        case deadlineTime = "deadline_time"
        case finished
        case dataChecked = "data_checked"
        case isNext = "is_next"
        case isCurrent = "is_current"
        case isPrevious = "is_previous"
    }
}
