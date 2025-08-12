//
//  ExpensshareApp.swift
//  Expensshare
//
//  Created by Gustavo Ferreira bassani on 06/08/25.
//

import SwiftUI
import SwiftData

@main
struct ExpensshareApp: App {
    var body: some Scene {
        WindowGroup {
            GroupsView()
            
        }
        .modelContainer(for: [Member.self, Expenses.self])
    }
}
