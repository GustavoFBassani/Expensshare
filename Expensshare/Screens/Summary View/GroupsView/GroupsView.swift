//
//  GroupsView.swift
//  Expensshare
//
//  Created by Gustavo Ferreira bassani on 06/08/25.
//

import SwiftUI
import SwiftData

struct GroupsView: View {
    @Environment(\.modelContext) var modelContext
    
    @State private var showAddExpenses = false
    @State private var showAllExpenses = false
    @State private var showSettleUp = false
    @Query private var mockedUser: [Member]
    
    func formatCurrency(_ value: Double) -> String {
        NumberFormatter.brCurrency.string(from: NSNumber(value: value)) ?? "\(value)"
    }
    
    func makeMockedDate( string: String) -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        formatter.locale = Locale(identifier: "pt_BR")
        return formatter.date(from: string) ?? Date()
    }

    
    func mediaOfExpenses() -> String {
        var sum: Double = 0
        var count: Double = 0
        
        for participant in mockedUser {
            sum += participant.totalExpenses
            count += 1
        }
        let media = sum/count
        return formatCurrency(media)
    }
    
    func totalOfExpenses() -> String {
        var sum: Double = 0
        
        for participant in mockedUser {
            sum += participant.totalExpenses
        }
        return formatCurrency(sum)
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing:16){
                    PieSliceWithChart()
                    participantGroupsView()
                    StatCard(title: "Média", value: mediaOfExpenses())
                    StatCard(title: "Total", value: totalOfExpenses())
                    Button {
                        showSettleUp = true
                        
                    } label: {
                        RegularButtonLabel(title: "Settle Up", titleColor: .white, backgroundColor: .greenAccent)
                    }
                    
                    Button {
                        showAllExpenses = true
                    } label: {
                        RegularButtonLabel(title: "Expenses", titleColor: .greenAccent, backgroundColor: .white)
                    }
                    
                    
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.top, 24)
                .frame(maxHeight: .infinity, alignment: .bottom)
                
            }
            .background(Color.background)
            .toolbarBackground(.white, for: .navigationBar)
            .toolbarBackgroundVisibility(.visible, for: .navigationBar)
            .sheet(isPresented: $showAddExpenses) {AddExpenseFirstView()}
            .sheet(isPresented: $showAllExpenses) {AllExpenses()}
            .sheet(isPresented: $showSettleUp) {SettleUp(amountInput: "")}
            .navigationTitle("Summary View")
            .overlay(alignment: .bottomTrailing) {
                Button {
                    showAddExpenses = true
                } label: {
                    Circle()
                        .fill(.white)
                        .frame(width: 62)
                    
                }
                .shadow(color: .shadow, radius: 2, x: 0, y: 4)
                .overlay {
                    Image(systemName: "plus")
                        .foregroundStyle(.blue)
                        .fontWeight(.semibold)
                }
                .padding()
            }
        }
        
        .onAppear{
            if mockedUser.isEmpty {
                let userToAdd = [
                    Member(name: "Carlos",expenses:  [ Expenses(expenseName: "Grocery", receiptPhoto: nil, expenseDescription: "complicado isso ai", amount: 45.00, date: makeMockedDate(string: "03/03/2025"), payerName: "Carlos"),
                                                       Expenses(expenseName: "Grocery", receiptPhoto: nil, expenseDescription: "complicado isso ai", amount: 15.00, date: makeMockedDate(string: "04/03/2025"), payerName: "Carlos"),
                                                       Expenses(expenseName: "Received", receiptPhoto: nil, expenseDescription: "complicado isso ai", amount: -20, date: makeMockedDate(string: "05/03/2025"), payerName: "Carlos")]),
                    
                    Member(name: "Emanuel",expenses: [Expenses(expenseName: "Ethernet", receiptPhoto: nil, expenseDescription: "complicado isso ai", amount: 45.00, date: makeMockedDate(string: "04/03/2025"), payerName: "Emanuel")]),
                    
                    Member(name: "Jose",expenses: [ Expenses(expenseName: "Paid to Carlos", receiptPhoto: nil, expenseDescription: "complicado isso ai", amount: 20.00, date: makeMockedDate(string: "05/03/2025"), payerName: "Jose"),
                                                    Expenses(expenseName: "Energy bill", receiptPhoto: nil, expenseDescription: "complicado isso ai", amount: 90.00, date: makeMockedDate(string: "06/03/2025"), payerName: "Jose"),
                                                    Expenses(expenseName: "Breeds", receiptPhoto: nil, expenseDescription: "complicado isso ai", amount: 15.00, date: makeMockedDate(string: "08/03/2025"), payerName: "Jose")])
                ]
                
                for member in userToAdd {
                    modelContext.insert(member)
                    
                    try? modelContext.save()
                }
            }
            
            
        }
    }
}

//#Preview {
//    GroupsView()
//}

