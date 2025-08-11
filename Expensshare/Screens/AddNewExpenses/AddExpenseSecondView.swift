//
//  AddExpenseSecondView.swift
//  Expensshare
//
//  Created by Gustavo Ferreira bassani on 08/08/25.
//

import SwiftUI

struct TextFieldWithTitle: View {
    
    @Binding var textFieldInput: String
    let labelTitle: String
    let placeHolder: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(labelTitle)
                .font(.body)
                .fontWeight(.medium)
            TextField(placeHolder, text: $textFieldInput)
                .foregroundStyle(.primary)
                .font(.body)
                .padding(.horizontal, 24)
                .padding(.vertical, 11)
                .background(RoundedRectangle(cornerRadius: 8) .fill(.white))
        }
    }
}

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
    
    var body: some View {

            VStack(spacing: 24) {

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
                
                TextFieldWithTitle(textFieldInput: $description, labelTitle: "Description", placeHolder: "e.g toilet paper, breeds, bills...")
                
                TextFieldWithTitle(textFieldInput: $amount, labelTitle: "Amount", placeHolder: "R$ e.g. 30,00")
                
                //Arrumar depois
                DatePicker("", selection: $selectedDate, displayedComponents: .date)
                    .datePickerStyle(.automatic)
                    .labelsHidden()
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                
                RegularButton(title: "Add Expense",
                              titleColor: isAllFieldsSelected() ? .white : .primary,
                              backgroundColor: isAllFieldsSelected() ? .greenAccent : .deselectedButton) {
                    //guardar dados
                    print("nao pegaaa")
                }
                    
                RegularButton(title: "Back",
                              titleColor: .greenAccent,
                              backgroundColor: .white) {
                    dismiss()
                    print("oiii")
                }
                
            }
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


//Modelo datepicker errado
//mudar cor do back pra verde
// botões nao funcionam

