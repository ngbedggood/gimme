//
//  RecipeViewModel.swift
//  Gimme
//
//  Created by Nathaniel Bedggood on 25/08/2025.
//

import SwiftUI
import SwiftData
import Combine

@MainActor
final class RecipeViewModel: ObservableObject {
    
    @Published var name: String = "test"
    @Published var quantity: Double = 0
    
    private let modelContext: ModelContext
    
    init(modelContext: ModelContext) {
        self.modelContext = modelContext
    }
    
    func addItem(name: String, quantity: Double, unit: UnitType, date: Date) {
        let newItem = Ingredient(name: name, quantity: quantity, unit: unit, expiryDate: date)
        modelContext.insert(newItem)
    }
    
    func deleteItems(offsets: IndexSet, from items: [Ingredient]) {
        for index in offsets {
            let itemToDelete = items[index]
            modelContext.delete(itemToDelete)
        }
    }
    
    func fetchRecipe() {
        print("Fetching a new recipe...")
    }
}
