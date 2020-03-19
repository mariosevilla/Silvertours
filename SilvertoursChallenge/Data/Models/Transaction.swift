//
//  Transaction.swift
//  SilvertoursChallenge
//
//  Created by Mario Sevilla Montoya on 19/03/2020.
//  Copyright © 2020 Mario Sevilla Montoya. All rights reserved.
//

import Foundation

struct Transaction {
    let id: UUID
    let date: Date
    let amount: Double
    let category: Category
}
