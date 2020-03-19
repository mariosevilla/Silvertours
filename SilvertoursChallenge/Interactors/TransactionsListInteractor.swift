//
//  TransactionsListInteractor.swift
//  SilvertoursChallenge
//
//  Created by Mario Sevilla Montoya on 14/03/2020.
//  Copyright © 2020 Mario Sevilla Montoya. All rights reserved.
//

import Foundation
import UIKit

protocol TransactionsListInteractorInputProtocol {
    var presenter: TransactionsListInteractorOutputProtocol? { get set }
    
    //PRESENTER -> INTERACTOR
    func fetchTransactions()
}

class TransactionsListInteractor: TransactionsListInteractorInputProtocol {
    var presenter: TransactionsListInteractorOutputProtocol?
    
    var accountDataRepository: AccountDataRepository?
    
    init(accountDataRepository: AccountDataRepository) {
        self.accountDataRepository = accountDataRepository
    }
    
    func fetchTransactions() {
        accountDataRepository?.getAll({ (accounts) in
            guard let accounts = accounts, !accounts.isEmpty else {
                self.presenter?.accountsFetchFailed()
                return
            }
            
            self.presenter?.accountsFetchSuccess(accounts: accounts)
        })
    }
}
