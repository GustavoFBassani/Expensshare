//
//  GroupsView.swift
//  Expensshare
//
//  Created by Gustavo Ferreira bassani on 06/08/25.
//

import SwiftUI

struct participantGroupsView: View {
    
    var body: some View {
        VStack {
            ForEach(participantExpenses) { participant in
                HStack {
                    Image(participant.name)
                    VStack {
                        HStack {
                            Text(participant.name)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            Text(formatCurrency(participant.value))
                        }
                        
                        Divider()
                    }
                }
                
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .foregroundStyle(.white)
        )
    }
    
}

struct StatCard: View {
    let title: String
    let value: String

    var body: some View {
        HStack(spacing: 8) {
            Image(systemName: "chart.bar.fill")
                .foregroundStyle(.white)

            Text(title)
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity, alignment: .leading)

            Text(value)
                .foregroundStyle(.white)
                .fontWeight(.bold)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(.cardBackground)
        )
    }
}

struct FilledButton: View {
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
    }
}

func formatCurrency(_ value: Double) -> String {
    let formatter = NumberFormatter()
    formatter.numberStyle = .currency
    formatter.locale = Locale(identifier: "pt_BR")
    return formatter.string(from: NSNumber(value: value)) ?? "\(value)"
}

func mediaOfExpenses() -> String {
    var sum: Double = 0
    var count: Double = 0
    
    for participant in participantExpenses {
        sum += participant.value
        count += 1
    }
    let media = sum/count
    return formatCurrency(media)
}

func totalOfExpenses() -> String {
    var sum: Double = 0
    
    for participant in participantExpenses {
        sum += participant.value
    }
    return formatCurrency(sum)
}

struct GroupsView: View {
    
    var body: some View {
        NavigationStack {
    
            ScrollView {
                VStack(spacing:16){
                    PieSliceWithChart()
                    participantGroupsView()
                    StatCard(title: "Média", value: mediaOfExpenses())
                    StatCard(title: "Total", value: totalOfExpenses())
                    FilledButton(title: "Settle Up", titleColor: .white, backgroundColor: .greenAccent) { }
                    FilledButton(title: "Expenses", titleColor: .greenAccent, backgroundColor: .white) { }
                                        
                }
            }
            .padding(.horizontal)
            .padding(.top, 24)
            .frame(maxHeight: .infinity, alignment: .top)
            .background(Color.background)
            .navigationTitle("Roommates")
            .toolbarBackground(.white, for: .navigationBar)
            .toolbarBackgroundVisibility(.visible, for: .navigationBar)
        }
    }
}

#Preview {
    GroupsView()
}
