//
//  TeamPlayer.swift
//  fpl
//
//  Created by Adam Pagels on 2025-09-21.
//

import Foundation

struct TeamPlayer: Identifiable {
    let pick: Pick
    let player: Player

    var id: Int { pick.element }
    var isOnBench: Bool { pick.position > 11 }
    var isCaptain: Bool { pick.isCaptain }
    var isViceCaptain: Bool { pick.isViceCaptain }
}
