//
//  TransactionsListTableView.swift
//  SilvertoursChallenge
//
//  Created by Mario Sevilla Montoya on 19/03/2020.
//  Copyright © 2020 Mario Sevilla Montoya. All rights reserved.
//

import UIKit

class TransactionsListTableView: UITableView {
    
    var accounts: [Account]? {
        didSet {
            reloadData()
        }
    }
    
    func addSubviewWithConstraints(parentView: UIView) {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        parentView.insertSubview(self, aboveSubview: parentView)
        
        parentView.addConstraint(NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: parentView, attribute: .top, multiplier: 1.0, constant: 0.0))
        parentView.addConstraint(NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: parentView, attribute: .leading, multiplier: 1.0, constant: 0.0))
        parentView.addConstraint(NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: parentView, attribute: .trailing, multiplier: 1.0, constant: 0.0))
        parentView.addConstraint(NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: parentView, attribute: .bottom, multiplier: 1.0, constant: 0.0))
        
        configureTableView()
    }
    
    func addTransaction(transaction: Transaction, inAccount account: String) {
        guard let index = accounts?.firstIndex(where: { $0.name == account }) else {
            return
        }
        
        if var accountObj = accounts?.first(where: { $0.name == account }) {
            accountObj.transactions.append(transaction)
            
            accounts?[index] = accountObj
        }
    }
    
    // MARK: - Private methods
    
    private func configureTableView() {
        delegate = self
        dataSource = self
        
        registerCell(TransactionTableViewCell.self, withReuseIdentifier: "TransactionTableViewCell")
    }
    
    private func registerCell(_ cellClass: AnyClass,
                              withReuseIdentifier reuseIdentifier: String) {
        register(cellClass, forCellReuseIdentifier: reuseIdentifier)
    }
}

extension TransactionsListTableView: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return accounts?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        guard let accounts = accounts else {
            return 0
        }
        
        return accounts[section].transactions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TransactionTableViewCell = tableView.dequeueReusableCell(withIdentifier: "TransactionTableViewCell", for: indexPath) as! TransactionTableViewCell

        if let account = accounts?[indexPath.section] {
            let transaction = account.transactions[indexPath.row]
            cell.configureCell(name: transaction.category.rawValue, date: transaction.date, amount: transaction.amount)
        }

        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = TransactionHeaderView(frame: tableView.frame)
        
        guard let accounts = accounts else {
            return headerView
        }
        let amount = accounts[section].getAmount()
        headerView.configureHeader(title: accounts[section].name, amount: amount)
        
        return headerView
    }
}
