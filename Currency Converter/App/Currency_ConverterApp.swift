//
//  Currency_ConverterApp.swift
//  Currency Converter
//
//  Created by Filipe Ramos on 08/08/2024.
//

import SwiftUI
import SwiftData

@main
struct Currency_ConverterApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([Transaction.self])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ViewCoordinator()
        }
        .modelContainer(sharedModelContainer)
    }
}
