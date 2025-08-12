//
//  Extensions.swift
//  Expensshare
//
//  Created by Gustavo Ferreira bassani on 12/08/25.
//
import SwiftUI

extension View {
    @ViewBuilder
    func hidden(_ shouldHide: Bool) -> some View {
        if shouldHide {
            self.hidden()
        } else {
            self
        }
    }
}

extension NumberFormatter {
    static let brCurrency: NumberFormatter = {
        let f = NumberFormatter()
        f.numberStyle = .currency
        f.locale = Locale(identifier: "pt_BR")
        return f
    }()
}
