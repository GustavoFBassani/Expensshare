//
//  StatsCard.swift
//  Expensshare
//
//  Created by Gustavo Ferreira bassani on 12/08/25.
//

import SwiftUI

struct StatCard: View {
    let title: String
    let value: String
    
    var body: some View {
        HStack(spacing: 8) {
            Image(systemName: "chart.bar.fill")
                .foregroundStyle(.white)
            
            Text(title)
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text(value)
                .foregroundStyle(.white)
                .fontWeight(.bold)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(.cardBackground)
        )
    }
}
