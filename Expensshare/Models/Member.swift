//
//  Untitled.swift
//  Expensshare
//
//  Created by Gustavo Ferreira bassani on 07/08/25.
//

import Foundation
import SwiftData

@Model
public class Expenses: Identifiable {
    
    public var id = UUID()
    var expenseName: String
    var receiptPhoto: Data?
    var expenseDescription: String
    var amount: Double
    var date: Date
    var payerName: String

    @Relationship var payer: Member?
    
    init(expenseName: String, receiptPhoto: Data?, expenseDescription: String, amount: Double, date: Date, payerName: String) {
        self.expenseName = expenseName
        self.receiptPhoto = receiptPhoto
        self.expenseDescription = expenseDescription
        self.amount = amount
        self.date = date
        self.payerName = payerName
    }
}

@Model
public class Member: Identifiable {
    public var id = UUID()
    var name: String
    
    @Relationship(deleteRule: .cascade, inverse: \Expenses.payer)
    var expenses: [Expenses] 
    
    var totalExpenses: Double {
        expenses.reduce(0) { $0 + $1.amount} //reduce take a array and a single type with the sum of all elements
    }
    
    init(name: String, expenses: [Expenses]) {
        self.name = name
        self.expenses = expenses
    }
}

//MARK: MOCKED DATA
public let mockedUser = [
    Member(name: "Carlos",expenses: carlosExpenses),
    Member(name: "Emanuel",expenses: emanuelExpenses),
    Member(name: "Jose",expenses: joseExpenses),
]

func makeMockedDate( string: String) -> Date {
    let formatter = DateFormatter()
    formatter.dateFormat = "dd/MM/yyyy"
    formatter.locale = Locale(identifier: "pt_BR")
    return formatter.date(from: string) ?? Date()
}

public let joseExpenses = [
    Expenses(expenseName: "Paid to Carlos", receiptPhoto: nil, expenseDescription: "complicado isso ai", amount: 20.00, date: makeMockedDate(string: "05/03/2025"), payerName: "Jose"),
    Expenses(expenseName: "Energy bill", receiptPhoto: nil, expenseDescription: "complicado isso ai", amount: 90.00, date: makeMockedDate(string: "06/03/2025"), payerName: "Jose"),
    Expenses(expenseName: "Breeds", receiptPhoto: nil, expenseDescription: "complicado isso ai", amount: 15.00, date: makeMockedDate(string: "08/03/2025"), payerName: "Jose")
]

public let emanuelExpenses = [
    Expenses(expenseName: "Ethernet", receiptPhoto: nil, expenseDescription: "complicado isso ai", amount: 45.00, date: makeMockedDate(string: "04/03/2025"), payerName: "Emanuel")
]

public let carlosExpenses = [
    Expenses(expenseName: "Grocery", receiptPhoto: nil, expenseDescription: "complicado isso ai", amount: 45.00, date: makeMockedDate(string: "03/03/2025"), payerName: "Carlos"),
    Expenses(expenseName: "Grocery", receiptPhoto: nil, expenseDescription: "complicado isso ai", amount: 15.00, date: makeMockedDate(string: "04/03/2025"), payerName: "Carlos"),
    Expenses(expenseName: "recebidos", receiptPhoto: nil, expenseDescription: "complicado isso ai", amount: -20, date: makeMockedDate(string: "05/03/2025"), payerName: "Carlos") //isso aqui vai me ferra
]
