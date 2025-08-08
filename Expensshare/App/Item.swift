//
//  Item.swift
//  Expensshare
//
//  Created by Gustavo Ferreira bassani on 06/08/25.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
