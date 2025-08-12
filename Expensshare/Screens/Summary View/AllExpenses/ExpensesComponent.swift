//
//  ExpensesComponent.swift
//  Expensshare
//
//  Created by Gustavo Ferreira bassani on 12/08/25.
//


import SwiftUI

struct ExpenseComponent: View {
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
                Text("         ")
                    .font(.callout)
                    .foregroundStyle(.secondary)
                
                HStack(spacing: 4){
                    Image("             ")
                    VStack(alignment: .leading, spacing: 0) {
                        Text("          ")
                            .font(.title2)
                            .fontWeight(.regular)
                        
                        Text("         ")
                            .font(.callout)
                            .foregroundStyle(.secondary)
                    }
                }
            }
            
            Spacer()
            
            VStack(spacing: 4) {
                Text("         ")
                    .font(.title2)
                    .foregroundStyle(.primary)
                
                HStack(spacing: 16){
                    Text("        ")
                    Text("        ")
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
                .fill(.white)
        )
        .shadow(color: .shadow, radius: 2, x: 0, y: 4)
        
        .overlay(content: {
            
            HStack(alignment: .bottom) {
                VStack(alignment: .leading, spacing: 4) {
                    Text(stringDate)
                        .font(.callout)
                        .foregroundStyle(.secondary)
                    
                    HStack(spacing: 4){
                        Image(payerWithoutAccent)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 24, height: 24)
                        VStack(alignment: .leading, spacing: 0) {
                            Text(payerName)
                                .font(.title2)
                                .fontWeight(.regular)
                                .foregroundStyle(.primary)

                            
                            Text(expenseName)
                                .font(.callout)
                                .foregroundStyle(.secondary)
                                .foregroundStyle(.primary)

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
                        Image(systemName: "chevron.right")
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
                    .fill(.cardbackgroundTwo))
        })
        .padding(.horizontal)

    }
}
