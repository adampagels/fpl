//
//  Pick.swift
//  fpl
//
//  Created by Adam Pagels on 2025-09-21.
//

import Foundation

struct Pick: Codable, Identifiable {
    var id: Int { element }
    let element: Int
    let position: Int
    let multiplier: Int
    let isCaptain: Bool
    let isViceCaptain: Bool
    let elementType: Int

    enum CodingKeys: String, CodingKey {
        case element, position, multiplier
        case isCaptain = "is_captain"
        case isViceCaptain = "is_vice_captain"
        case elementType = "element_type"
    }
}
