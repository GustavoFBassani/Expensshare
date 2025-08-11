//
//  ExpensshareApp.swift
//  Expensshare
//
//  Created by Gustavo Ferreira bassani on 06/08/25.
//

import SwiftUI

@main
struct ExpensshareApp: App {
    var body: some Scene {
        WindowGroup {
            EditExpenses(selectedPayer: "José")
        }
    }
}
