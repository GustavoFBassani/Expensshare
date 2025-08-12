//
//  Untitled.swift
//  Expensshare
//
//  Created by Gustavo Ferreira bassani on 07/08/25.
//

import Foundation
import SwiftData

//Como fazer @Relationship

public struct Expenses: Identifiable {
    public let id = UUID()
    let expenseName: String
    let receiptPhoto: Data?
    let description: String
    let amount: Double
    let date: Date
    let payerName: String
}

public struct GroupMembers: Identifiable {
    public let id = UUID()
    let name: String
    /*@Relationship*/ let expenses: [Expenses]
    var totalExpenses: Double {
        expenses.reduce(0) { $0 + $1.amount} //reduce take a array and a single type with the sum of all elements
    }
}

//MARK: MOCKED DATA
public let mockedUser = [
    GroupMembers(name: "Carlos",expenses: carlosExpenses),
    GroupMembers(name: "Emanuel",expenses: emanuelExpenses),
    GroupMembers(name: "Jose",expenses: joseExpenses),
]

func makeMockedDate( string: String) -> Date {
    let formatter = DateFormatter()
    formatter.dateFormat = "dd/MM/yyyy"
    formatter.locale = Locale(identifier: "pt_BR")
    return formatter.date(from: string) ?? Date()
}

public let joseExpenses = [
    Expenses(expenseName: "Paid to Carlos", receiptPhoto: nil, description: "complicado isso ai", amount: 20.00, date: makeMockedDate(string: "05/03/2025"), payerName: "Jose"),
    Expenses(expenseName: "Energy bill", receiptPhoto: nil, description: "complicado isso ai", amount: 90.00, date: makeMockedDate(string: "06/03/2025"), payerName: "Jose"),
    Expenses(expenseName: "Breeds", receiptPhoto: nil, description: "complicado isso ai", amount: 15.00, date: makeMockedDate(string: "08/03/2025"), payerName: "Jose")
]

public let emanuelExpenses = [
    Expenses(expenseName: "Ethernet", receiptPhoto: nil, description: "complicado isso ai", amount: 45.00, date: makeMockedDate(string: "04/03/2025"), payerName: "Emanuel")
]

public let carlosExpenses = [
    Expenses(expenseName: "Grocery", receiptPhoto: nil, description: "complicado isso ai", amount: 45.00, date: makeMockedDate(string: "03/03/2025"), payerName: "Carlos"),
    Expenses(expenseName: "Grocery", receiptPhoto: nil, description: "complicado isso ai", amount: 15.00, date: makeMockedDate(string: "04/03/2025"), payerName: "Carlos"),
    Expenses(expenseName: "recebidos", receiptPhoto: nil, description: "complicado isso ai", amount: -20, date: makeMockedDate(string: "05/03/2025"), payerName: "Carlos") //isso aqui vai me ferra
]
