//
//  SwiftDataTutorialApp.swift
//  SwiftDataTutorial
//
//  Created by Rin on 2023/09/03.
//

import SwiftUI
import SwiftData

@main
struct SwiftDataTutorialApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: [Expense.self, Category.self])
        }
    }
}
