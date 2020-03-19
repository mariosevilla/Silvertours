//
//  AddTransactionViewController.swift
//  SilvertoursChallenge
//
//  Created by Mario Sevilla Montoya on 18/03/2020.
//  Copyright © 2020 Mario Sevilla Montoya. All rights reserved.
//

import UIKit

protocol AddTransactionViewProtocol {
    var presenter: AddTransactionPresenterProtocol? { get set }
    
    //PRESENTER -> VIEW
}

class AddTransactionViewController: UIViewController {
    var presenter: AddTransactionPresenterProtocol?
    
    let addTransactionView: AddTransactionView = AddTransactionView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        addButtonsInNavigationBar()
        addTransactionView.addSubviewWithConstraints(parentView: self.view)
    }
    
    // MARK: - Private methods
    
    private func addButtonsInNavigationBar() {
        let closeButton = UIBarButtonItem(title: "Close", style: .plain, target: self, action: #selector(closeView))
        self.navigationItem.setLeftBarButton(closeButton, animated: false)
        
        let saveButton = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(saveElement))
        self.navigationItem.setRightBarButton(saveButton, animated: false)
    }
    
    // MARK: - Actions
    
    @objc
    private func saveElement() {
        guard let amountString = addTransactionView.amountTextField.text, let categoryString = addTransactionView.categoryTextField.text else {
            return
        }
        
        let amount = Double(amountString) ?? 0.0
        let transaction = Transaction(id: UUID(), date: Date(), amount: amount, category: Category.forCategory(for: categoryString))
        presenter?.addTransaction(transaction, inAccount: addTransactionView.accountTextField.text ?? "Cash")
        presenter?.dismissViewController()
    }
    
    @objc
    private func closeView() {
        presenter?.dismissViewController()
    }
}

extension AddTransactionViewController: AddTransactionViewProtocol {
    
}
