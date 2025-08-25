//
//  Item.swift
//  Gimme
//
//  Created by Nathaniel Bedggood on 25/08/2025.
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
