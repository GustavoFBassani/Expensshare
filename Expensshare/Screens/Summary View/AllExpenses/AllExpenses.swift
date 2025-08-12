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
    
    @Environment(\.modelContext) var modelContext
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
            List {
                ForEach(allExpenses) { expense in
                    ExpenseComponent(
                        date: expense.date,
                        payerName: expense.payerName,
                        expenseName: expense.expenseName,
                        amount: expense.amount
                    )
                    .contentShape(RoundedRectangle(cornerRadius: 16))
                    .background(Color.background)
                    .onTapGesture { editExpense = expense }
                    .swipeActions(edge: .trailing) {
                        Button("Delete", systemImage: "trash", role: .destructive) {
                            modelContext.delete(expense)
                            try? modelContext.save()
                        }
                    }
                    .listRowBackground(Color.clear)
                }
                .listRowSeparator(.hidden)
                .background(Color.background)

            }
            .listStyle(.plain)
            .scrollContentBackground(.hidden)
            .background(Color.background)
            .navigationDestination(item: $editExpense) { expense in
                EditExpenses(expense: expense)
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



