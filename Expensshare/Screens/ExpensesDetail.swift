//
//  ExpensesDetail.swift
//  Expensshare
//
//  Created by Gustavo Ferreira bassani on 09/08/25.
//
// essa tela nao faz sentido se eu posso editar todas as despesas... só fiz pelo esporte mesmo.

import SwiftUI

struct ExpensesDetail: View {
    var body: some View {
        VStack(spacing: 24){
        
            VStack(spacing: 16) {
                HStack(alignment: .center, spacing: 4) {
                    Image(systemName: "cart")
                        .frame(width: 24)
                    VStack(spacing: 6) {
                        Text("Grocery")
                            .font(.title2)
                        
                        Text("03/03/2025")
                            .font(.callout)
                            .foregroundStyle(.secondary)
                    }
                    
                    Spacer()
                    
                    HStack {
                        Text("by:")
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        Text("Carlos")
                    }
                    
                }
                
                Image("notinha exemplo")
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 16) .fill(.cardbackgroundTwo))
                
            }
            
            VStack(spacing: 16){
                
                Text("Description")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("toilet paper + breed ")
                    .font(.title2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading)
                    .padding(.vertical)
                    .background(RoundedRectangle(cornerRadius: 16) .fill(.cardbackgroundTwo))
                
                HStack {
                    Image(systemName: "chart.bar.horizontal.page")
                        .foregroundStyle(.white)
                    
                    Text("Total:")
                        .font(.body)
                        .foregroundStyle(.white)
                    
                    Spacer()
                    
                    Text("R$ 45,00")
                        .font(.body)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 16) .fill(.cardBackground))
                
                
            }
            
            RegularButton(title: "Edit Expense", titleColor: .white, backgroundColor: .greenAccent) {
                
            }
        }
        .padding(.horizontal, 16)
    }
}

#Preview {
    ExpensesDetail()
}
