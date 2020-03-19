//
//  TransactionsListViewController.swift
//  SilvertoursChallenge
//
//  Created by Mario Sevilla Montoya on 14/03/2020.
//  Copyright © 2020 Mario Sevilla Montoya. All rights reserved.
//

import UIKit

struct Element {
    let name: String
    let date: Date
    let amount: Double
}

protocol TransactionsListViewProtocol {
    var presenter: TransactionsListPresenterProtocol? { get set }
    
    //PRESENTER -> VIEW
    func addTransaction(transaction: Transaction, inAccount account: String)
    func showAccounts(accounts: [Account])
    func showError()
}

class TransactionsListViewController: UIViewController {
    var presenter: TransactionsListPresenterProtocol?
    var tableView: TransactionsListTableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Dashboard"
        
        let rightButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewItem))
        navigationItem.setRightBarButton(rightButton, animated: false)
        
        presenter?.fetchTransactions()
        
        tableView?.addSubviewWithConstraints(parentView: self.view)
    }
    
    // MARK: - Private methods
    
    @objc
    private func addNewItem() {
        presenter?.showAddTransactionViewController()
    }
}

extension TransactionsListViewController: TransactionsListViewProtocol {
    func addTransaction(transaction: Transaction, inAccount account: String) {
        tableView?.addTransaction(transaction: transaction, inAccount: account)
    }
    
    func showAccounts(accounts: [Account]) {
        tableView?.accounts = accounts
    }
    
    func showError() {
        let alert = UIAlertController(title: "Load error", message: "We have a problem loading the list", preferredStyle: .alert)
        let okAlertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAlertAction)
        view.window?.rootViewController?.present(alert, animated: true, completion: nil)
    }
}
