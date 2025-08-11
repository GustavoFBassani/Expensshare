//
//  AllExpenses.swift
//  Expensshare
//
//  Created by Gustavo Ferreira bassani on 09/08/25.
//

import SwiftUI

struct expenseComponent: View {
    let date: Date
    let payerName:String
    let expenseName: String
    let amount: Double
    
    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "d MMM"
        return formatter
    }()
    
    func formatCurrency(_ value: Double) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "pt_BR")
        return formatter.string(from: NSNumber(value: value)) ?? "\(value)"
    }
    
    //cant use stored property depending on property of instance..
    private var payerWithoutAccent: String {
        payerName.folding(options: .diacriticInsensitive, locale: .current)
    }

    var stringDate: String {
        Self.dateFormatter.string(from: date)
    }
    
    var body: some View {
        
        HStack(alignment: .bottom) {
            VStack(alignment: .leading, spacing: 4) {
                Text(stringDate)
                    .font(.callout)
                    .foregroundStyle(.secondary)
                
                HStack(spacing: 4){
                    Image(payerWithoutAccent)
                    VStack(spacing: 0) {
                        Text(payerName)
                            .font(.title2)
                            .fontWeight(.regular)
                        
                        Text(expenseName)
                            .font(.callout)
                            .foregroundStyle(.secondary)
                    }
                }
            }
            
            Spacer()
            
            VStack(spacing: 4) {
                Text(formatCurrency(amount))
                    .font(.title2)
                    .foregroundStyle(.primary)
                
                HStack(spacing: 16){
                    Text("Detail")
                    Text(">")
                }
                .font(.body)
                .foregroundStyle(.secondary)
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 8)
        .padding(.horizontal)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(.cardbackgroundTwo)
        )
//        .shadow(color: .shadow, radius: 2, x: 0, y: 4)
        .padding(.horizontal)

    }
}

struct AllExpenses: View {
    var body: some View {
        let allExpenses: [Expenses] = joseExpenses + emanuelExpenses + carlosExpenses

        ScrollView {
            VStack {
                ForEach(allExpenses.sorted(by: {$0.date < $1.date})) { expense in
                    expenseComponent(
                        date: expense.date,
                        payerName: expense.payerName,
                        expenseName: expense.expenseName,
                        amount: expense.amount
                    )
                }
            }
        }
        .toolbarVisibility(.visible, for: .navigationBar)
        .navigationTitle("Expenses")
    }
}

#Preview {
    AllExpenses()
}



//Shadow pega em tudo
//paddings não estão certinhos
// pqqqq josé ta estranhOOOOOo assim ? ???? ?

