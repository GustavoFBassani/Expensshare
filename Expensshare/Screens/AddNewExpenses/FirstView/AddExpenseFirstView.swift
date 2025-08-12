import SwiftUI
import SwiftData

struct AddExpenseFirstView: View {
    
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var context
    
    @State var goToAddExpensesSecondView = false
    @State var selectedPayer: String? = nil
    @State var payerMember: Member? = nil
    
    var body: some View {
        NavigationStack {
            
            VStack {
                VStack(spacing: 24) {
                    Text("Select the participant you want to add the expense to:")
                        .padding(.top, 24)
                        .padding(.horizontal)
                        .font(.title3)
                        .fontWeight(.semibold)
                    
                    ScrollView() {
                        ForEach(mockedUser) { participant in
                            participantGroupButton(
                                name: participant.name,
                                image: Image(participant.name),
                                isSelected: selectedPayer == participant.name
                            ) {
                                payerMember = participant
                                print(payerMember?.name)
                                selectedPayer = participant.name
                                

                            }
                            .padding(.bottom, 16)
                        }
                    }
                }
                
                VStack(spacing: 20) {
                    NavigationLink {
                        if let payerMember {
                            AddExpenseSecondView(payer: payerMember)
                        }
                    } label: {
                            RegularButtonLabel(
                                title: "Next Step",
                                titleColor: payerMember != nil ? .white : .primary,
                                backgroundColor: payerMember != nil ? .greenAccent : .deselectedButton
                            )
                        }
                        .disabled(selectedPayer == nil)
                        .shadow(color: .shadow, radius: 10, x: 0, y: 4)
                    
                    Button {
                        dismiss()
                    } label: {
                        RegularButtonLabel(title: "Cancel", titleColor: .greenAccent, backgroundColor: .white)
                    }
                    
                    
                    .shadow(color: .shadow, radius: 10, x: 0, y: 4)
                }
                .padding(.horizontal)
                .padding(.bottom, 102)
                .background(Color.background)
                
            }
            .ignoresSafeArea(.all, edges: .bottom)
            .background(Color.background) // Adiciona a cor de fundo para toda a view
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
        }
        .tint(Color.greenAccent)
    }
}

#Preview {
//    AddExpenseFirstView()
}


