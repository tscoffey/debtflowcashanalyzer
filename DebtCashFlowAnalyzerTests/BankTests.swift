//
//  BankTests.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 4/26/16.
//  Copyright © 2016 Coffey. All rights reserved.
//

import XCTest
@testable import DebtCashFlowAnalyzer

class BankTests: XCTestCase {
    let bankNames=["Bank1", "Bank2", "Bank3", "Bank4"]
    
    
    var mediator:CashFlowMediator?
    
    
    override func setUp() {
        super.setUp()
        mediator=ModelBuilder(named:"test-banks").modelBanks(self.bankNames).mediator
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testBankNames() {
        XCTAssert(self.bankNames == mediator!.bankNamesAre.sort() {$0 < $1}  )
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }

}
