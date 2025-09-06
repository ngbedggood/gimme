//
//  UnitType.swift
//  Gimme
//
//  Created by Nathaniel Bedggood on 06/09/2025.
//

import Foundation

enum UnitType: String, CaseIterable, Codable, Identifiable {
    case grams = "g"
    case kilograms = "kg"
    case litres = "L"
    case pieces = "pcs"
    
    var id: String { self.rawValue }
}
