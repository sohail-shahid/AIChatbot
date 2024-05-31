//
//  AIChatbotApp.swift
//  AIChatbot
//
//  Created by Sohail Khan on 30/05/2024.
//

import SwiftUI
import SwiftData

@main
struct AIChatbotApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
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
            AIChatbotView()
        }
        .modelContainer(sharedModelContainer)
    }
}
