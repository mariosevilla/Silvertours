//
//  TransactionsListRouter.swift
//  SilvertoursChallenge
//
//  Created by Mario Sevilla Montoya on 14/03/2020.
//  Copyright © 2020 Mario Sevilla Montoya. All rights reserved.
//

import Foundation
import UIKit

protocol TransactionsListRouterProtocol{
    static func createTransactionsListModule() -> UIViewController
    func showAddTransactionViewController(view: TransactionsListViewProtocol)
    
    //PRESENTER -> ROUTER
}


class TransactionsListRouter: TransactionsListRouterProtocol {
    static func createTransactionsListModule() -> UIViewController {
        let transactionsListViewController = TransactionsListViewController()

        var presenter: TransactionsListPresenterProtocol & TransactionsListInteractorOutputProtocol = TransactionsListPresenter()
        var interactor: TransactionsListInteractorInputProtocol = TransactionsListInteractor(accountDataRepository: AccountDataRepository())
        let router = TransactionsListRouter()

        transactionsListViewController.presenter = presenter
        presenter.view = transactionsListViewController
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter

        let tableView = TransactionsListTableView()
        transactionsListViewController.tableView = tableView

        return transactionsListViewController
    }
    
    func showAddTransactionViewController(view: TransactionsListViewProtocol) {
        guard let delegate = view.presenter as? AddTransactionDelegate else {
            return
        }
       
        let addTransactionRouter = AddTransactionRouter.createAddTransactionModule(delegate: delegate)
        if let sourceView = view as? UIViewController {
            sourceView.present(addTransactionRouter, animated: true, completion: nil)
        }
    }
}
