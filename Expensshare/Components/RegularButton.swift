//
//  RegularButton.swift
//  Expensshare
//
//  Created by Gustavo Ferreira bassani on 08/08/25.
//

import SwiftUI

struct RegularButton: View {
    let title: String
    let titleColor: Color
    let backgroundColor: Color
    let action: () -> Void
    
    var body: some View {
        Button(title, action: action)
            .fontWeight(.bold)
            .padding()
            .frame(maxWidth: .infinity)
            .foregroundStyle(titleColor)
            .background(RoundedRectangle(cornerRadius: 16).fill(backgroundColor))
            .shadow(color: .shadow, radius: 2, x: 0, y: 4)
    }
}
