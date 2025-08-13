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
        expenses.reduce(0) {$0 + $1.amount} //reduce take a array and a single type with the sum of all elements
    }
    
    init(name: String, expenses: [Expenses]) {
        self.name = name
        self.expenses = expenses
    }
}


