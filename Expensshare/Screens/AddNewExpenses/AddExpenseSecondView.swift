//
//  AddExpenseSecondView.swift
//  Expensshare
//
//  Created by Gustavo Ferreira bassani on 08/08/25.
//

import SwiftUI

struct AddExpenseSecondView: View {
    
    @Environment(\.dismiss) var dismiss
    @State var expensesName = ""
    @State var description = ""
    @State var amount = ""
    @State var selectedDate = Date()
    var selectedPayer: String
    
    func isAllFieldsSelected() -> Bool {
        let expensesFilled = expensesName != ""
        let descriptionFilled = description != ""
        let amountFilled = amount != ""
        let dateFilled = selectedDate != Date()
        let isAllFilled = expensesFilled && descriptionFilled && amountFilled && dateFilled
        return isAllFilled
    }
    
    var dateString: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        return formatter.string(from: selectedDate)
    }
    
    var body: some View {

        VStack(alignment: .leading, spacing: 24) {

                HStack {
                    Text("Add expenses to")
                        .font(.body)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                    
                    Spacer()
                    
                    HStack {
                        Image(selectedPayer)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                        
                        Text(selectedPayer)
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
                
                TextFieldWithTitle(textFieldInput: $expensesName, labelTitle: "Expense name", placeHolder: "e.g. energy bill, grocery, etc.")
                
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
                .frame(maxWidth: .infinity)
                
                TextFieldWithTitle(textFieldInput: $description, labelTitle: "Description", placeHolder: "e.g toilet paper, breeds, bills...")
                
                TextFieldWithTitle(textFieldInput: $amount, labelTitle: "Amount", placeHolder: "R$ e.g. 30,00")
                
                DatePicker("", selection: $selectedDate, displayedComponents: .date)
                    .labelsHidden()
                    .frame(maxWidth: 190, alignment: .leading)
                    .environment(\.locale, Locale(identifier: "pt-BR"))
                    .overlay() {
                        HStack {
                            
                            Text(dateString)
                                .padding(.horizontal, 8)
                                .foregroundStyle(.greenAccent)
                                
                            
                            Spacer()
                            
                            Image(systemName: "chevron.up.chevron.down")
                                .frame(minWidth: 8, maxHeight: 8)
                                .padding(.horizontal, 8)
                                .foregroundStyle(.greenAccent)

                        }
                        
                        .frame(maxWidth: .infinity)
                        .frame(maxHeight: .infinity)
                        .background(
                            RoundedRectangle(cornerRadius: 16)
                                .fill(.backgroundFilsTertiary)
                        )
                            .allowsHitTesting(false)
                            
                    }
                    
                
                RegularButton(title: "Add Expense",
                              titleColor: isAllFieldsSelected() ? .white : .primary,
                              backgroundColor: isAllFieldsSelected() ? .greenAccent : .deselectedButton) {

                    print("nao pegaaa")
                }
                
                Button {
                    
                    dismiss()

                } label: {
                    RegularButtonLabel(title: "Back",
                                  titleColor: .greenAccent,
                                  backgroundColor: .white)
                }

                    
     
                
            }
            .toolbarBackgroundVisibility(.visible, for: .navigationBar)
            .navigationBarBackButtonHidden()
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
            .navigationTitle("Add Expenses")
            .navigationBarTitleDisplayMode(.inline)
            .padding(.top, 24)
            .padding(.horizontal, 16)
            .background(Color.background)
    }
}

#Preview {
    AddExpenseSecondView(selectedPayer: "qualquercoisa")
}


//mudar cor do back pra verde

