//
//  Team.swift
//  fpl
//
//  Created by Adam Pagels on 2025-09-21.
//

import Foundation

struct Team: Codable, Identifiable {
    let id: Int
    let name: String
    let shortName: String
    let strength: Int

    enum CodingKeys: String, CodingKey {
        case id, name
        case shortName = "short_name"
        case strength
    }
}
