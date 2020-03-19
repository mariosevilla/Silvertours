//
//  TransactionsPickerView.swift
//  SilvertoursChallenge
//
//  Created by Mario Sevilla Montoya on 19/03/2020.
//  Copyright © 2020 Mario Sevilla Montoya. All rights reserved.
//

import UIKit

protocol TransactionsPickerViewDelegate {
    func didSelectRowInPickerView(_ pickerView: UIPickerView, didSelectRow row: Int)
}

class TransactionsPickerView: UIPickerView {

    var pickerViewDelegate: TransactionsPickerViewDelegate?
    
    var items: [String]?
    
    func configurePickerView(items: [String], pickerViewDelegate: TransactionsPickerViewDelegate) {
        delegate = self
        dataSource = self
        
        self.pickerViewDelegate = pickerViewDelegate
        self.items = items
    }
}

extension TransactionsPickerView: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return items?.count ?? 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return items?[row] ?? ""
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerViewDelegate?.didSelectRowInPickerView(pickerView, didSelectRow: row)
    }
}
