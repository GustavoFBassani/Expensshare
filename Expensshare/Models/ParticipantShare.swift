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
}

public struct ParticipantShare: Identifiable {
    public let id = UUID()
    let name: String
    /*@Relationship*/ let expenses: [Expenses]
    var totalExpenses: Double {
        expenses.reduce(0) { $0 + $1.amount} //reduce take a array and a single type
    }
}

//MARK: MOCKED DATA
public let participantExpenses = [
    ParticipantShare(name: "Carlos",expenses: carlosExpenses),
    ParticipantShare(name: "Emanuel",expenses: emanuelExpenses),
    ParticipantShare(name: "Jose",expenses: joseExpenses),
]

public let joseExpenses = [
    Expenses(expenseName: "Paid to Carlos", receiptPhoto: nil, description: "complicado isso ai", amount: 20.00, date: Date()),
    Expenses(expenseName: "Energy bill", receiptPhoto: nil, description: "complicado isso ai", amount: 90.00, date: Date()),
    Expenses(expenseName: "Breeds", receiptPhoto: nil, description: "complicado isso ai", amount: 15.00, date: Date())
]

public let emanuelExpenses = [
    Expenses(expenseName: "Ethernet", receiptPhoto: nil, description: "complicado isso ai", amount: 45.00, date: Date())
]

public let carlosExpenses = [
    Expenses(expenseName: "Grocery", receiptPhoto: nil, description: "complicado isso ai", amount: 45.00, date: Date()),
    Expenses(expenseName: "Grocery", receiptPhoto: nil, description: "complicado isso ai", amount: 15.00, date: Date())
]
