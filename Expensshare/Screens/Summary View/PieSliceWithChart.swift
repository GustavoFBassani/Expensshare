//
//  PieSliceWithChart.swift
//  Expensshare
//
//  Created by Gustavo Ferreira bassani on 07/08/25.
//

import SwiftUI
import Charts

struct PieSliceWithChart: View {
    
    let uniqueNames: [String] = mockedUser.map(\.name)
    
    var body: some View {
        HStack(spacing: 51) {
            Chart(mockedUser) { participant in
                SectorMark(
                    angle: .value("value", participant.totalExpenses),
                    angularInset: 1
                )
                .foregroundStyle(participantColor(participant.name))
            }
            .frame(width: 100, height: 100)
            .chartLegend(.hidden)

            VStack(alignment: .leading, spacing: 12) {
                ForEach(mockedUser) { participant in
                    HStack(spacing: 8) {
                        Circle()
                            .fill(participantColor(participant.name))
                            .frame(width: 12, height: 12)
                        Text(participant.name)
                            .foregroundStyle(.primary)
                            .font(.headline)
                    }
                }
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 40)
        .padding(.vertical, 14)
        .background(Color.cardbackgroundTwo)
        .border(.gray, width: 0.5)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }

    let paleta: [Color] = [.blue, .orange, .green, .pink, .purple, .red, .yellow, .mint, .cyan]

    func participantColor(_ name: String) -> Color {
        
        if let index = uniqueNames.firstIndex(of: name) {
            return paleta[index]
        }
        return .gray
    }
}

#Preview {
    PieSliceWithChart()
        .padding()
}
