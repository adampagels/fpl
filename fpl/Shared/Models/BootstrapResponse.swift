//
//  BootstrapResponse.swift
//  fpl
//
//  Created by Adam Pagels on 2025-09-21.
//

import Foundation

struct BootstrapResponse: Codable {
    let events: [Gameweek]
    let teams: [Team]
    let elements: [Player]
}
