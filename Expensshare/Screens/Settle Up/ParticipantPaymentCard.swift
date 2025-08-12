//
//  Untitled.swift
//  Expensshare
//
//  Created by Gustavo Ferreira bassani on 12/08/25.
//

import SwiftUI

struct ParticipantPaymentCard: View {
    let name: String
    let image: Image
    let isSelectedPayer: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack {
                image
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: 60, maxHeight: 60)
                Text(name)
                    .font(.title2)
                    .fontWeight(.regular)
                    .lineLimit(1)
                    .truncationMode(.tail)
            }
        }
        .foregroundStyle(.primary)
        .frame(width: 106, height: 106)
        .background(RoundedRectangle(cornerRadius: 16).fill(isSelectedPayer ? Color.cardBackground : Color.white))
        .shadow(color: .shadow, radius: 10, x: 0, y: 4)
        .fontWeight(.semibold)
    }
}
