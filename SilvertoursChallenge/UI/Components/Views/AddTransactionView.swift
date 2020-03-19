//
//  AddTransactionView.swift
//  SilvertoursChallenge
//
//  Created by Mario Sevilla Montoya on 18/03/2020.
//  Copyright © 2020 Mario Sevilla Montoya. All rights reserved.
//

import UIKit

class AddTransactionView: UIView {
    
    let incomeCategorySegmentedControl = UISegmentedControl(items: ["Income", "Expence"])
    let accountTextField = UITextField()
    let categoryTextField = UITextField()
    let amountTextField = UITextField()
    
    private let accountPickerView = TransactionsPickerView()
    private let categoryPickerView = TransactionsPickerView()
    
    private let accounts = ["Cash", "Credit Card", "Bank Account"]
    
    func addSubviewWithConstraints(parentView: UIView) {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        parentView.insertSubview(self, aboveSubview: parentView)
        
        parentView.addConstraint(NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: parentView, attribute: .top, multiplier: 1.0, constant: 0.0))
        parentView.addConstraint(NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: parentView, attribute: .leading, multiplier: 1.0, constant: 0.0))
        parentView.addConstraint(NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: parentView, attribute: .trailing, multiplier: 1.0, constant: 0.0))
        parentView.addConstraint(NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: parentView, attribute: .bottom, multiplier: 1.0, constant: 0.0))
        
        configureView()
    }
    
    // MARK: - Private methods
    
    private func configureView() {
        incomeCategorySegmentedControl.selectedSegmentIndex = 0
        incomeCategorySegmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged(segment:)), for: .valueChanged)
        
        addComponentsInView()
        setPlaceHolderText()
    }
    
    private func addComponentsInView() {
        incomeCategorySegmentedControl.translatesAutoresizingMaskIntoConstraints = false
        accountTextField.translatesAutoresizingMaskIntoConstraints = false
        categoryTextField.translatesAutoresizingMaskIntoConstraints = false
        amountTextField.translatesAutoresizingMaskIntoConstraints = false
        
        accountTextField.borderStyle = .roundedRect
        categoryTextField.borderStyle = .roundedRect
        amountTextField.borderStyle = .roundedRect
        
        addSubview(incomeCategorySegmentedControl)
        addSubview(accountTextField)
        addSubview(categoryTextField)
        addSubview(amountTextField)
        
        accountPickerView.configurePickerView(items: accounts, pickerViewDelegate: self)
        categoryPickerView.configurePickerView(items: TransactionType.expense.category, pickerViewDelegate: self)
        accountTextField.inputView = accountPickerView
        categoryTextField.inputView = categoryPickerView
        
        addConstraints()
    }
    
    private func setPlaceHolderText() {
        accountTextField.placeholder = "Select Account"
        categoryTextField.placeholder = "Select Category"
        amountTextField.placeholder = "Amount"
    }
    
    private func addConstraints() {
        let views = ["incomeCategorySegmentedControl": incomeCategorySegmentedControl,
                     "accountTextField": accountTextField,
                     "categoryTextField": categoryTextField,
                     "amountTextField": amountTextField]
           
        addConstraints(NSLayoutConstraint.constraints(
            withVisualFormat: "V:|-(30)-[incomeCategorySegmentedControl]-(30)-[accountTextField]-(30)-[categoryTextField]-(30)-[amountTextField]-(>=10)-|",
            options: [],
            metrics: nil,
            views: views))
        
        addConstraints(NSLayoutConstraint.constraints(
            withVisualFormat: "H:|-(20)-[incomeCategorySegmentedControl]-(20)-|",
            options: [],
            metrics: nil,
            views: views))
        
        addConstraints(NSLayoutConstraint.constraints(
            withVisualFormat: "H:|-(40)-[accountTextField]-(40)-|",
            options: [],
            metrics: nil,
            views: views))
        
        addConstraints(NSLayoutConstraint.constraints(
            withVisualFormat: "H:|-(40)-[categoryTextField]-(40)-|",
            options: [],
            metrics: nil,
            views: views))
        
        addConstraints(NSLayoutConstraint.constraints(
            withVisualFormat: "H:|-(40)-[amountTextField]-(40)-|",
            options: [],
            metrics: nil,
            views: views))
    }
    
    @objc
    private func segmentedControlValueChanged(segment: UISegmentedControl) {
        if incomeCategorySegmentedControl.selectedSegmentIndex == 0 {
            categoryPickerView.configurePickerView(items: TransactionType.expense.category, pickerViewDelegate: self)
        } else {
            categoryPickerView.configurePickerView(items: TransactionType.income.category, pickerViewDelegate: self)
        }
    }
}

extension AddTransactionView: TransactionsPickerViewDelegate {
    func didSelectRowInPickerView(_ pickerView: UIPickerView, didSelectRow row: Int) {
        if pickerView == accountPickerView {
            accountTextField.text = accounts[row]
            accountTextField.resignFirstResponder()
        } else {
            if incomeCategorySegmentedControl.selectedSegmentIndex == 0 {
                categoryTextField.text = TransactionType.expense.category[row]
            } else {
                categoryTextField.text = TransactionType.income.category[row]
            }
            
            categoryTextField.resignFirstResponder()
        }
    }
}
