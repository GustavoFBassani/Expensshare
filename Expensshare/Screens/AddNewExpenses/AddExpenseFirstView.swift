//
//  AddExpenseFirstView.swift
//  Expensshare
//
//  Created by Gustavo Ferreira bassani on 08/08/25.
//

import SwiftUI

struct participantGroupButton: View {
    let name: String
    let image: Image
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                image
                    .frame(width: 24, height: 24)
                Text(name)
            }
        }
        .foregroundStyle(.primary)
        .padding()
        .frame(maxWidth: .infinity)
        .background(RoundedRectangle(cornerRadius: 30).fill(.white))
        .padding(.horizontal, 60)
        .shadow(color: .shadow, radius: 10, x: 0, y: 4)
        .fontWeight(.semibold)
    }
}

struct AddExpenseFirstView: View {
    var body: some View {
        VStack(spacing: 24) {
            Text("Select the participant you want to add the expense to:")
                .padding(.top, 24)
                .font(.title3)
                .fontWeight(.semibold)
            
            ForEach(participantExpenses) { participant in
                participantGroupButton(name: participant.name, image: Image(participant.name) ) {
                    
                }
            }
                        
            Spacer()
            
            RegularButton(title: "Next Step", titleColor: .white, backgroundColor: .greenAccent) { }
                .shadow(color: .shadow, radius: 10, x: 0, y: 4)
                
            RegularButton(title: "Next Step", titleColor: .greenAccent, backgroundColor: .white) { }
                .shadow(color: .shadow, radius: 10, x: 0, y: 4)
                .padding(.bottom, 102)
            
        }
        .padding()
    }
}

#Preview {
    AddExpenseFirstView()
}
