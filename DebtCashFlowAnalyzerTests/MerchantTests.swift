//
//  MerchantTests.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 4/25/16.
//  Copyright © 2016 Coffey. All rights reserved.
//

import XCTest
@testable import DebtCashFlowAnalyzer

class MerchantTests: XCTestCase {

    let merchantNames=["Merchant-A","Merchant-B", "Merchant-C"]
    
    
    var mediator:CashFlowMediator?

    
    override func setUp() {
        super.setUp()
        mediator=ModelBuilder(named:"test-merchants").modelMerchants(self.merchantNames).mediator
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        mediator!.managedObjectContext?.delete(mediator!)
    }

    func testMerchantInitialCount() {
        if mediator!.merchantsAre.count != merchantNames.count { XCTFail("Merchant count incorrect after addition") }

    }
    
    func testMerchantNames() {
        let sorted=(mediator as! IsMediator).merchantNamesAre.sorted(){$0 < $1}
        for i in (1...sorted.count) {
            if sorted[i-1] != self.merchantNames[i-1] { XCTFail("Merchant name mismatch") }
        }
    }
    
    func testMerchantRemoval() {
        let merchants=mediator!.merchantsAre
        for merchant in merchants {
            mediator!.removeMerchant(merchant)
        }
        if mediator!.merchantsAre.count != 0 { XCTFail("Merchant count incorrect after removal") }
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
