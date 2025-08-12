//
//  AddExpenseSecondView.swift
//  Expensshare
//
//  Created by Gustavo Ferreira bassani on 08/08/25.
//


import SwiftUI

struct EditExpenses: View {
    
    var expense: Expenses
    
    @Environment(\.dismiss) var dismiss
    
    @State var expensesName: String = ""
    @State var description: String = ""
    @State var amount: String = ""
    @State var payerName: String = ""
    @State var selectedDate: Date = Date()
    @State var imageData: Data? = nil
    
    @State private var isEditingExpensesName = false
    @State private var isEditingDescription = false
    @State private var isEditingAmount = false
    @State private var selectedPayer: String = ""
    
    var body: some View {
        
        VStack( spacing: 24) {
            
            HStack {
                Text("Add expenses to")
                    .font(.body)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                
                Spacer()
                
                HStack {
                    Image(payerName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                    
                    
                    Text(payerName)
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
                    
                    if let imageData, let uiImage = UIImage(data: imageData) {
                        Image(uiImage: uiImage)
                            .frame(width: 90)
                        
                    } else {
                        
                        Image("camera")
                            .frame(width: 90)
                        
                    }
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
        .toolbar {
            ToolbarItem(placement: .cancellationAction) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                }
            }
        }
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
        .navigationTitle("Edit Expenses")
        .navigationBarBackButtonHidden()
        .padding(.top, 24)
        .padding(.horizontal, 16)
        .frame(maxHeight: .infinity)
        .background(Color.background)
        .onAppear {
            expensesName = expense.expenseName
            description = expense.expenseDescription
            amount = String(expense.amount)
            selectedDate = expense.date
            payerName = expense.payerName
            imageData = expense.receiptPhoto
            
        }
    }
}

#Preview {
    
    EditExpenses(expense: Expenses(expenseName: "aaa", receiptPhoto: nil, expenseDescription: "aa", amount: 43, date: Date(), payerName: "uu"))
    
}



//componentizar se sobrar tempo
