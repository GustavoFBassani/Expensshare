//
//  Untitled.swift
//  Expensshare
//
//  Created by Gustavo Ferreira bassani on 07/08/25.
//

import Foundation

public struct ParticipantShare: Identifiable {
    public let id = UUID()
    let name: String
    let value: Double
}

//MARK: MOCKED DATA
public let participantExpenses = [
    ParticipantShare(name: "Carlos", value: 40.00),
    ParticipantShare(name: "Emanuel", value: 45.00),
    ParticipantShare(name: "José", value: 125.00),
    ParticipantShare(name: "ADROALDO", value: 124.00)
]
