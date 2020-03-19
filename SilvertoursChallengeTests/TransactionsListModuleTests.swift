//
//  SilvertoursChallengeTests.swift
//  SilvertoursChallengeTests
//
//  Created by Mario Sevilla Montoya on 14/03/2020.
//  Copyright © 2020 Mario Sevilla Montoya. All rights reserved.
//

import XCTest
@testable import SilvertoursChallenge

class TransactionsListModuleTests: XCTestCase {
    
    func testModuleRelationshipsNotNil() {
        let transactionListModule = TransactionsListRouter.createTransactionsListModule() as! TransactionsListViewController
        
        XCTAssertNotNil(transactionListModule.presenter)
        XCTAssertNotNil(transactionListModule.presenter?.interactor)
        XCTAssertNotNil(transactionListModule.presenter?.router)
        XCTAssertNotNil(transactionListModule.presenter?.view)
        XCTAssertNotNil(transactionListModule.presenter?.interactor?.presenter)
    }
}
