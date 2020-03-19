//
//  TransactionsListPresenter.swift
//  SilvertoursChallenge
//
//  Created by Mario Sevilla Montoya on 14/03/2020.
//  Copyright © 2020 Mario Sevilla Montoya. All rights reserved.
//

import Foundation
import UIKit

protocol TransactionsListPresenterProtocol {
    var view: TransactionsListViewProtocol? { get set }
    var interactor: TransactionsListInteractorInputProtocol? { get set }
    var router: TransactionsListRouterProtocol? { get set }
    
    //VIEW -> PRESENTER
    func fetchTransactions()
    func showAddTransactionViewController()
}

protocol TransactionsListInteractorOutputProtocol {
    //INTERACTOR -> PRESENTER
    func accountsFetchSuccess(accounts: [Account])
    func accountsFetchFailed()
}

class TransactionsListPresenter: TransactionsListPresenterProtocol {
    var view: TransactionsListViewProtocol?
    var interactor: TransactionsListInteractorInputProtocol?
    var router: TransactionsListRouterProtocol?
    
    func fetchTransactions() {
        interactor?.fetchTransactions()
    }
    
    func showAddTransactionViewController() {
        guard let view = view else {
            return
        }
        
        router?.showAddTransactionViewController(view: view)
    }
}

extension TransactionsListPresenter: TransactionsListInteractorOutputProtocol {
    func accountsFetchSuccess(accounts: [Account]) {
        view?.showAccounts(accounts: accounts)
    }
    
    func accountsFetchFailed() {
        view?.showError()
    }
}

extension TransactionsListPresenter: AddTransactionDelegate {
    func didAddTransaction(transaction: Transaction, inAccount account: String) {
        view?.addTransaction(transaction: transaction, inAccount: account)
    }
}
