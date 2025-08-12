//
//  ParticipantGroupButton.swift
//  Expensshare
//
//  Created by Gustavo Ferreira bassani on 12/08/25.
//

import SwiftUI

struct participantGroupButton: View {
    let name: String
    let image: Image
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 24, height: 24)
                Text(name)
            }
            .frame(maxWidth: .infinity)
        }
        .foregroundStyle(.primary)
        .padding(.vertical)
        .frame(maxWidth: .infinity)
        .background(RoundedRectangle(cornerRadius: 30).fill(isSelected ? Color.cardBackground : Color.white))
        .padding(.horizontal, 60)
        .shadow(color: .shadow, radius: 10, x: 0, y: 4)
        .fontWeight(.semibold)
    }
}
