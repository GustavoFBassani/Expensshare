//
//  GroupsView.swift
//  Expensshare
//
//  Created by Gustavo Ferreira bassani on 06/08/25.
//

import SwiftUI


struct GroupsView: View {
    
    @State private var showAddExpenses = false
    @State private var showAllExpenses = false
    @State private var showSettleUp = false
    
    func formatCurrency(_ value: Double) -> String {
        NumberFormatter.brCurrency.string(from: NSNumber(value: value)) ?? "\(value)"
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
    }
}

#Preview {
    GroupsView()
}

//botoes nao funcionam???
// mudar os botoes pra label, dentro de um botao
