//
//  TextFieldWithTitle.swift
//  Expensshare
//
//  Created by Gustavo Ferreira bassani on 11/08/25.
//

import SwiftUI

struct TextFieldWithTitle: View {
    @Binding var textFieldInput: String
    let labelTitle: String
    let placeHolder: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(labelTitle)
                .font(.body)
                .fontWeight(.medium)
            TextField(placeHolder, text: $textFieldInput)
                .foregroundStyle(.primary)
                .font(.body)
                .padding(.horizontal, 24)
                .padding(.vertical, 11)
                .background(RoundedRectangle(cornerRadius: 8) .fill(.white))
        }
    }
}
