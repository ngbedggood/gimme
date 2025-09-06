//
//  Ingredient.swift
//  Gimme
//
//  Created by Nathaniel Bedggood on 25/08/2025.
//

import Foundation
import SwiftData

@Model
final class Ingredient: Identifiable {
    var name: String
    var quantity: Double
    var unit: UnitType
    var expiryDate: Date
    
    init(name: String, quantity: Double, unit: UnitType, expiryDate: Date) {
        self.name = name
        self.quantity = quantity
        self.unit = unit
        self.expiryDate = expiryDate
    }
}
