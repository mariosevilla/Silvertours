//
//  AccountDataRepository.swift
//  SilvertoursChallenge
//
//  Created by Mario Sevilla Montoya on 19/03/2020.
//  Copyright © 2020 Mario Sevilla Montoya. All rights reserved.
//

import Foundation

class AccountDataRepository: Repository {
    typealias T = Account
    
    func getAll(_ completion: @escaping ([Account]?) -> ()) {
        let transaction1 = Transaction(id: UUID(), date: Date(), amount: 1000.0, category: .salary)
        let transaction2 = Transaction(id: UUID(), date: Date(), amount: -60.0, category: .gym)
        let transaction3 = Transaction(id: UUID(), date: Date(), amount: -160.0, category: .tax)
        
        let account1 = Account(id: UUID(), name: "Cash", transactions: [transaction1, transaction2, transaction3])
        let account2 = Account(id: UUID(), name: "Credit Card", transactions: [transaction1, transaction3])
        let account3 = Account(id: UUID(), name: "Bank account", transactions: [transaction2, transaction3])
        
        completion([account1, account2, account3])
    }
}
