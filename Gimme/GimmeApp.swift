//
//  GimmeApp.swift
//  Gimme
//
//  Created by Nathaniel Bedggood on 25/08/2025.
//

import SwiftUI
import SwiftData

@main
struct GimmeApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Ingredient.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: RecipeViewModel(modelContext: sharedModelContainer.mainContext))
                .preferredColorScheme(.light)
        }
        .modelContainer(sharedModelContainer)
    }
}
