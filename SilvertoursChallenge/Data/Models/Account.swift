//
//  Account.swift
//  SilvertoursChallenge
//
//  Created by Mario Sevilla Montoya on 19/03/2020.
//  Copyright © 2020 Mario Sevilla Montoya. All rights reserved.
//

import Foundation

struct Account {
    let id: UUID
    let name: String
    var transactions: [Transaction]
    
    func getAmount() -> Double {
        return transactions.map({ $0.amount }).reduce(0, +)
    }
}

