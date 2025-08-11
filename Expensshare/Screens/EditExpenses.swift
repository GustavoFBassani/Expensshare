//
//  AddExpenseSecondView.swift
//  Expensshare
//
//  Created by Gustavo Ferreira bassani on 08/08/25.
//


import SwiftUI

extension View {
    @ViewBuilder
    func hidden(_ shouldHide: Bool) -> some View {
        if shouldHide {
            self.hidden()
        } else {
            self
        }
    }
}

struct EditExpenses: View {
    
    @State var expensesName = "Grocery"
    @State var description = "toilet paper + breed"
    @State var amount = "R$ 30,00"
    @State var selectedDate = Date()
    
    @State private var isEditingExpensesName = false
    @State private var isEditingDescription = false
    @State private var isEditingAmount = false
    var selectedPayer: String
    
    var body: some View {
        
        VStack( spacing: 24) {
            
            HStack {
                Text("Add expenses to")
                    .font(.body)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                
                Spacer()
                
                HStack {
                    Image(.carlos)
                        .frame(width: 24, height: 24)
                    
                    Text("Carlos")
                }
                .foregroundStyle(.primary)
                .font(.system(size: 17, weight: .medium))
                .padding(.horizontal, 8)
                .padding(.vertical, 5)
                .background(RoundedRectangle(cornerRadius: 16) .fill(.white))
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical,13)
            .padding(.horizontal,16)
            .background(RoundedRectangle(cornerRadius: 32) .fill(.cardBackground))
            
            HStack(alignment: .bottom) {
                VStack(alignment: .leading){
                    Text("Expense name")
                        .font(.headline)
                    
                    if isEditingExpensesName {
                        TextField("Expenses Name", text: $expensesName)
                            .frame(maxWidth: .infinity)
                            .padding(.horizontal, 24)
                            .padding(.vertical, 11)
                            .background(RoundedRectangle(cornerRadius: 8) .fill(.white))
                            .onSubmit {
                                isEditingExpensesName = false
                            }
                        
                    } else {
                        
                        Text(expensesName)
                            .font(.subheadline)
                    }
                    
                }
                .frame(alignment: .leading)
                
                HStack(spacing: 2){
                    Image(systemName: "pencil")
                    Text("Edit")
                        .onTapGesture {
                            isEditingExpensesName = true
                            
                        }
                }
                .frame(maxWidth: isEditingExpensesName ? 0 : .infinity, alignment: .leading)
                .foregroundStyle(.greenAccent)
                .hidden(isEditingExpensesName)
                
            }
            
            VStack{
                Text("Attach a receipt photo (optional)")
                    .font(.body)
                    .fontWeight(.medium)
                
                Button {
                    //action
                } label: {
                    Image("camera")
                        .frame(width: 90)
                }
            }
            
            HStack(alignment: .bottom) {
                VStack(alignment: .leading){
                    Text("Description")
                        .font(.headline)
                    
                    if isEditingDescription {
                        TextField("Description", text: $description)
                            .frame(maxWidth: .infinity)
                            .padding(.horizontal, 24)
                            .padding(.vertical, 11)
                            .background(RoundedRectangle(cornerRadius: 8) .fill(.white))
                            .onSubmit {
                                isEditingDescription = false
                            }
                    } else {
                        Text(description)
                            .font(.subheadline)
                    }
                    
                }
                .frame(alignment: .leading)
                
                HStack(spacing: 2){
                    Image(systemName: "pencil")
                    Text("Edit")
                }
                .onTapGesture {
                    isEditingDescription = true
                    
                }
                .frame(maxWidth: isEditingDescription ? 0 : .infinity, alignment: .leading)
                .foregroundStyle(.greenAccent)
                .hidden(isEditingDescription)
            }
            
            HStack(alignment: .bottom) {
                VStack(alignment: .leading){
                    Text("Amount")
                        .font(.headline)
                    
                    if isEditingAmount {
                        TextField("Amount", text: $amount)
                            .frame(maxWidth: .infinity)
                            .padding(.horizontal, 24)
                            .padding(.vertical, 11)
                            .background(RoundedRectangle(cornerRadius: 8) .fill(.white))
                            .onSubmit {
                                isEditingAmount = false
                            }
                        
                    } else {
                        Text(amount)
                            .font(.subheadline)
                    }
                }
                .frame(alignment: .leading)
                
                HStack(spacing: 2){
                    Image(systemName: "pencil")
                    Text("Edit")
                }
                .onTapGesture {
                    isEditingAmount = true
                    
                }
                .frame(maxWidth: isEditingAmount ? 0 : .infinity, alignment: .leading)
                .foregroundStyle(.greenAccent)
                .hidden(isEditingAmount)
            }
            //Arrumar depois
            DatePicker("", selection: $selectedDate, displayedComponents: .date)
                .datePickerStyle(.automatic)
                .labelsHidden()
                .frame(maxWidth: .infinity, alignment: .leading)
            
            
            RegularButton(title: "Update Expenses", titleColor: .white, backgroundColor: .greenAccent) { }
            
            RegularButton(title: "Discard change", titleColor: .greenAccent, backgroundColor: .white) { }
            
        }
        .toolbarBackgroundVisibility(.visible, for: .navigationBar)
        .navigationTitle("Add Expenses")
        .navigationBarTitleDisplayMode(.inline)
        .padding(.top, 24)
        .padding(.horizontal, 16)
        .background(Color.background)
    }
}

#Preview {
    EditExpenses(selectedPayer: "qualquercoisa")
}



//componentizar se sobrar tempo
