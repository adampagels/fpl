//
//  Item.swift
//  fpl
//
//  Created by Adam Pagels on 2025-09-11.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
