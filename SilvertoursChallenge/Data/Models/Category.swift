//
//  Category.swift
//  SilvertoursChallenge
//
//  Created by Mario Sevilla Montoya on 19/03/2020.
//  Copyright © 2020 Mario Sevilla Montoya. All rights reserved.
//

import Foundation

enum TransactionType: CaseIterable {
    case expense
    case income
    
    public var category: [String] {
        switch self {
        case .expense:
            return [Category.tax.description, Category.grocery.description, Category.entertaiment.description, Category.gym.description, Category.health.description]
        case .income:
            return [Category.salary.description, Category.dividends.description]
        }
    }
}

enum Category: String, CustomStringConvertible {
    case tax
    case grocery
    case entertaiment
    case gym
    case health
    case salary
    case dividends
    
    public var description: String {
        switch self {
        case .tax:
            return "Tax"
        case .grocery:
            return "Grocery"
        case .entertaiment:
            return "Entertaiment"
        case .gym:
            return "Gym"
        case .health:
            return "Health"
        case .salary:
            return "Salary"
        case .dividends:
            return "Dividends"
        }
    }
}

extension Category {
    static func forCategory(for stringValue: String) -> Category {
        switch stringValue {
        case "Tax":
            return .tax
        case "Grocery":
            return .grocery
        case "Entertaiment":
            return .entertaiment
        case "Gym":
            return .gym
        case "Health":
            return .health
        case "Salary":
            return .salary
        case "Dividends":
            return .dividends
        default:
            return .tax
        }
    }
}
