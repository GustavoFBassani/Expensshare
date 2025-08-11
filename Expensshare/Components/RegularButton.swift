//
//  RegularButton.swift
//  Expensshare
//
//  Created by Gustavo Ferreira bassani on 08/08/25.
//

import SwiftUI
//for buttons with action
struct RegularButton: View {
    let title: String
    let titleColor: Color
    let backgroundColor: Color
    let action: () -> Void
    
    var body: some View {
        Button("", action: action)
            .padding()
            .frame(maxWidth: .infinity)
            .background(RoundedRectangle(cornerRadius: 16).fill(backgroundColor))
            .shadow(color: .shadow, radius: 2, x: 0, y: 4)
            .overlay {
                Text(title)
                    .fontWeight(.bold)
                    .foregroundStyle(titleColor)
                    .foregroundStyle(.blue)
                    .fontWeight(.semibold)
            }
    }
}
// for navigations with regular layout
struct RegularButtonLabel: View {
    let title: String
    let titleColor: Color
    let backgroundColor: Color

    var body: some View {
        Text(title)
            .fontWeight(.bold)
            .foregroundStyle(titleColor)
            .frame(maxWidth: .infinity)
            .padding()
            .background(RoundedRectangle(cornerRadius: 16).fill(backgroundColor))
            .shadow(color: .shadow, radius: 2, x: 0, y: 4)

    }
}

#Preview {
    RegularButtonLabel(title: "button", titleColor: .white, backgroundColor: .greenAccent)
        .padding()
}
