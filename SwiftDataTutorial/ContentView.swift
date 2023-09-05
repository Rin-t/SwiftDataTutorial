//
//  ContentView.swift
//  SwiftDataTutorial
//
//  Created by Rin on 2023/09/03.
//

import SwiftUI
import SwiftData

struct ContentView: View {

    @State private var currentTab: String = "Expenses"

    var body: some View {
        TabView(selection: $currentTab) {

            ExpenseView()
                .tag("Expenses")
                .tabItem {
                    Image(systemName: "creditcard.fill")
                    Text("Expenses")
                }

            CategoryView()
                .tag("Category")
                .tabItem {
                    Image(systemName: "list.clipboard.fill")
                    Text("Category")
                }
        }
    }
}

#Preview {
    ContentView()
}
