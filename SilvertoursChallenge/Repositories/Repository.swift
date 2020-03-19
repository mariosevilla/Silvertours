//
//  Repository.swift
//  SilvertoursChallenge
//
//  Created by Mario Sevilla Montoya on 19/03/2020.
//  Copyright © 2020 Mario Sevilla Montoya. All rights reserved.
//

import Foundation

protocol Repository {
    associatedtype T
    
    func getAll(_ completion: @escaping ([T]?) -> ())
}
