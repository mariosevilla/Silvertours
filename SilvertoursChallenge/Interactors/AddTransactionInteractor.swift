//
//  AddTransactionInteractor.swift
//  SilvertoursChallenge
//
//  Created by Mario Sevilla Montoya on 18/03/2020.
//  Copyright © 2020 Mario Sevilla Montoya. All rights reserved.
//

import Foundation
import UIKit

protocol AddTransactionInteractorInputProtocol {
    var presenter: AddTransactionInteractorOutputProtocol? { get set }
    
    //PRESENTER -> INTERACTOR
    func fetchTransactions()
    
}

class AddTransactionInteractor: AddTransactionInteractorInputProtocol {
    var presenter: AddTransactionInteractorOutputProtocol?
    
    func fetchTransactions() {
        
    }
}
