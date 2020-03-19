//
//  TransactionHeaderView.swift
//  SilvertoursChallenge
//
//  Created by Mario Sevilla Montoya on 18/03/2020.
//  Copyright © 2020 Mario Sevilla Montoya. All rights reserved.
//

import UIKit

class TransactionHeaderView: UITableViewHeaderFooterView {

    private let titleLabel: UILabel = UILabel()
    private let amountLabel: UILabel = UILabel()
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        tintColor = UIColor.lightGray
    }

    func configureHeader(title: String, amount: Double) {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        amountLabel.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(titleLabel)
        addSubview(amountLabel)
        
        titleLabel.text = title
        amountLabel.text = "\(amount)€"
        
        addConstraints()
    }
    
    // MARK: - Private methods
    
    private func addConstraints() {
        let views = ["titleLabel": titleLabel,
                     "amountLabel": amountLabel]
           
        addConstraints(NSLayoutConstraint.constraints(
            withVisualFormat: "V:|-[titleLabel]-|",
            options: [],
            metrics: nil,
            views: views))
        
        addConstraints(NSLayoutConstraint.constraints(
            withVisualFormat: "V:|-[amountLabel]-|",
            options: [],
            metrics: nil,
        	views: views))
        
        addConstraints(NSLayoutConstraint.constraints(
            withVisualFormat: "H:|-(10)-[titleLabel]-(>=10)-[amountLabel]-(10)-|",
            options: [],
            metrics: nil,
            views: views))
    }
}
