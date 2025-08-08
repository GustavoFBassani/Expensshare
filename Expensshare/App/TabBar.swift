//
//  TabBar.swift
//  Expensshare
//
//  Created by Gustavo Ferreira bassani on 08/08/25.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        
        TabView {
            
            Tab("My groups", systemImage: "person.3.fill") {
                NavigationStack {
                    GroupsView()
                }
            }
        }
        .tint(.greenAccent)
        .toolbarBackground(.ultraThinMaterial, for: .tabBar)
        .toolbarColorScheme(.dark, for: .tabBar)
        
        
    }
}

#Preview {
    TabBar()
}
