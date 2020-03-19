//
//  AddTransactionPresenter.swift
//  SilvertoursChallenge
//
//  Created by Mario Sevilla Montoya on 18/03/2020.
//  Copyright © 2020 Mario Sevilla Montoya. All rights reserved.
//

import Foundation
import UIKit

protocol AddTransactionDelegate {
    func didAddTransaction(transaction: Transaction, inAccount account: String)
}

protocol AddTransactionPresenterProtocol {
    var view: AddTransactionViewProtocol? { get set }
    var interactor: AddTransactionInteractorInputProtocol? { get set }
    var router: AddTransactionRouterProtocol? { get set }
    
    var delegate: AddTransactionDelegate? { get set }
    
    //VIEW -> PRESENTER
    func addTransaction(_ transaction: Transaction, inAccount account: String)
    func dismissViewController()
}

protocol AddTransactionInteractorOutputProtocol {
    //INTERACTOR -> PRESENTER
//    func transactionsFetchSuccess(transactions:[Element])
//    func transactionsFetchFailed()
}

class AddTransactionPresenter: AddTransactionPresenterProtocol {
    
    var view: AddTransactionViewProtocol?
    var interactor: AddTransactionInteractorInputProtocol?
    var router: AddTransactionRouterProtocol?
    
    var delegate: AddTransactionDelegate?
    
    func dismissViewController() {
        guard let view = view else {
            return
        }
        
        router?.dismissViewController(view: view)
    }
    
    func addTransaction(_ transaction: Transaction, inAccount account: String) {
        delegate?.didAddTransaction(transaction: transaction, inAccount: account)
    }
}

extension AddTransactionPresenter: AddTransactionInteractorOutputProtocol {
//    func transactionsFetchSuccess(transactions: [Element]) {
//
//    }
//
//    func transactionsFetchFailed() {
//        
//    }
    
    
}
