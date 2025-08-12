//
//  participantGroupsView.swift
//  Expensshare
//
//  Created by Gustavo Ferreira bassani on 12/08/25.
//
import SwiftUI
import SwiftData

struct participantGroupsView: View {
    
    @Query private var mockedUser: [Member]
    
    func formatCurrency(_ value: Double) -> String {
        NumberFormatter.brCurrency.string(from: NSNumber(value: value)) ?? "\(value)"
    }
    

    
    var body: some View {
        VStack {
            ForEach(mockedUser) { participant in
                HStack {
                    Image(participant.name)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24)
                    VStack {
                        HStack {
                            Text(participant.name)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            Text(formatCurrency(participant.totalExpenses))
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
