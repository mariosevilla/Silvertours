//
//  TransactionTableViewCell.swift
//  SilvertoursChallenge
//
//  Created by Mario Sevilla Montoya on 14/03/2020.
//  Copyright © 2020 Mario Sevilla Montoya. All rights reserved.
//

import Foundation
import UIKit

class TransactionTableViewCell: UITableViewCell {

    private let nameLabel: UILabel = UILabel()
    private let dateLabel: UILabel = UILabel()
    private let amountLabel: UILabel = UILabel()
    
    func configureCell(name: String, date: Date, amount: Double) {
        createViewCell()
        
        nameLabel.text = name
        dateLabel.text = date.description
        configureAmountText(amountLabel: amountLabel, amount: amount)
    }

    // MARK: - Private methods
    
    private func configureAmountText(amountLabel: UILabel, amount: Double) {
        if amount > 0 {
            amountLabel.textColor = UIColor.systemGreen
        } else {
            amountLabel.textColor = UIColor.systemRed
        }
        
        amountLabel.text = "\(amount)€"
    }
    
    private func createViewCell() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        amountLabel.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(nameLabel)
        contentView.addSubview(dateLabel)
        contentView.addSubview(amountLabel)
        
        addConstraints()
    }
    
    private func addConstraints() {
        let views = ["nameLabel": nameLabel,
                     "dateLabel": dateLabel,
                     "amountLabel": amountLabel]
        
        contentView.addConstraints(NSLayoutConstraint.constraints(
            withVisualFormat: "V:|-[nameLabel]-[dateLabel]-|",
            options: [],
            metrics: nil,
            views: views))
        
        contentView.addConstraints(NSLayoutConstraint.constraints(
            withVisualFormat: "H:|-(10)-[nameLabel]-(>=10)-|",
            options: [],
            metrics: nil,
            views: views))
        
        contentView.addConstraints(NSLayoutConstraint.constraints(
            withVisualFormat: "H:|-(10)-[dateLabel]-(>=10)-|",
            options: [],
            metrics: nil,
            views: views))
        
        contentView.addConstraints(NSLayoutConstraint.constraints(
            withVisualFormat: "V:|-[amountLabel]-|",
            options: [],
            metrics: nil,
            views: views))
        
        contentView.addConstraints(NSLayoutConstraint.constraints(
            withVisualFormat: "H:[amountLabel]-(10)-|",
            options: [],
            metrics: nil,
            views: views))
    }
}
