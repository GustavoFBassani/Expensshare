//
//  SettleUp.swift
//  Expensshare
//
//  Created by Gustavo Ferreira bassani on 09/08/25.
//

//TODO: resolver padding placeholder....
import SwiftUI

struct SettleUp: View {
    
    @Environment(\.dismiss) var dismiss
    @State var selectedPayer: String? = nil
    @State var selectedReceiver: String? = nil
    @State var amountInput: String = ""
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 117) {
                VStack(alignment: .center, spacing: 24){
                    VStack(alignment: .leading, spacing: 16){
                        Text("Payer")
                            .font(.body)
                            .fontWeight(.semibold)
                        
                        HStack(spacing: 16) {
                            ForEach(mockedUser) {participant in
                                ParticipantPaymentCard(name: participant.name, image: Image(participant.name), isSelectedPayer: selectedPayer == participant.name) {
                                    selectedPayer = participant.name
                                }
                            }
                        }
                    }
                    
                    VStack(alignment: .leading, spacing: 16){
                        Text("Receiver")
                            .font(.body)
                            .fontWeight(.semibold)
                        HStack(spacing: 16) {
                            ForEach(mockedUser) {participant in
                                ParticipantPaymentCard(name: participant.name, image: Image(participant.name), isSelectedPayer: selectedReceiver == participant.name) {
                                    selectedReceiver = participant.name
                                }
                            }
                        }
                    }
                    
                    TextFieldWithTitle(textFieldInput: $amountInput, labelTitle: "Enter the transfer amount.", placeHolder: "E.g R$30,00")
                        
                }
                
                VStack(alignment: .leading) {
                    Text("This action won't transfer real money. \n It only updates your balance in the app.")
                        .font(.footnote)
                    
                    let paidAndReceiverSelected = selectedPayer != nil && selectedReceiver != nil && amountInput != ""

                    Button {
                        
                    } label: {
                        RegularButtonLabel(title: "Settle up now",
                                           titleColor: paidAndReceiverSelected ? .white : .primary,
                                           backgroundColor: paidAndReceiverSelected ? .greenAccent : .deselectedButton
                        )
                    }
                }
                
            }
            .padding()
            .frame(maxHeight: .infinity)
            .background(Color.background)
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
            .navigationTitle("Settle Up")
            .navigationBarTitleDisplayMode(.inline)
            
        }
    }
    
}

#Preview {
    SettleUp()
}
