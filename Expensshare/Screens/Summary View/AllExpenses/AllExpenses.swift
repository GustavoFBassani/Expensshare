//
//  AllExpenses.swift
//  Expensshare
//
//  Created by Gustavo Ferreira bassani on 09/08/25.
//


//TODO:

import SwiftUI
import SwiftData

struct AllExpenses: View {
    
    @Environment(\.dismiss) var dismiss
    @Query private var mockedUser: [Member]
    
    @State var editExpense: Expenses?

    
    var body: some View {
        
        var allExpenses: [Expenses] {
            var expenses: [Expenses] = []
            for member in mockedUser {
                expenses += member.expenses
            }
            return expenses
        }

        NavigationStack {
            ScrollView {
                VStack {
                    ForEach(allExpenses.sorted(by: {$0.date < $1.date})) { expense in
                        
                        NavigationLink {
                            EditExpenses(expense: expense)
                        } label: {
                            
                            ExpenseComponent(
                                date: expense.date,
                                payerName: expense.payerName,
                                expenseName: expense.expenseName,
                                amount: expense.amount
                            )
                            
                        }
                        
                        .foregroundStyle(.primary)
                        .padding(.bottom, 8)
                    }
                    .swipeActions {

                    }
                }
            }
            .padding(.top, 24)
            .background(Color.background)
            .toolbarBackgroundVisibility(.visible, for: .navigationBar)
            .toolbar(content: {
                ToolbarItem(placement:.automatic) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundStyle(.greenAccent)
                            .frame(width: 21)
                    }
                }
            })
            .navigationTitle("All Expenses")
            .navigationBarTitleDisplayMode(.inline)
        }
        .tint(Color.greenAccent)
        
    }
}

#Preview {
    AllExpenses()
}



//Shadow pega em tudo
//paddings não estão certinhos

