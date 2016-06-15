//
//  SourceAccountTests.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 4/26/16.
//  Copyright © 2016 Coffey. All rights reserved.
//

import XCTest
@testable import DebtCashFlowAnalyzer

class SourceAccountTests: XCTestCase {
    
    var accounts:[(String, String, AccountType,Double)]=[
        ("Acc1","Bank1",.Checking,100)
       ,("Acc2","Bank1",.Savings,1000)
    ]
    

    var mediator:CashFlowMediator?
    
    
    override func setUp() {
        super.setUp()
        mediator=ModelBuilder(named:"test-source-accounts").modelSourceAccounts(self.accounts).mediator
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testAccountNames() {
        let names=mediator!.accountNamesAre
        XCTAssert((names.sort(){$0 < $1}) == ["Acc1","Acc2"])
    }
    
    func testAcc1() {
        guard let acc=SourceAccount.accountNamed("Acc1", findInContext: mediator!.modelContext)
            else { XCTFail("Acc1 not found")
                return
        }
        XCTAssert(acc.accountDatedBalancesAre.count == 1)
        let bal=acc.accountDatedBalancesAre[0].acctDatedBalanceIs
        let date=acc.accountDatedBalancesAre[0].acctDatedBalanceDateIs
        XCTAssert(bal == NSDecimalNumber(double:100))
        XCTAssert(acc.accountType == .Checking)
        
    }
    
    func testAcc2() {
        guard let acc=SourceAccount.accountNamed("Acc2", findInContext: mediator!.modelContext)
            else { XCTFail("Acc1 not found")
                return
        }
        XCTAssert(acc.accountDatedBalancesAre.count == 1)
        let bal=acc.accountDatedBalancesAre[0].acctDatedBalanceIs
        let date=acc.accountDatedBalancesAre[0].acctDatedBalanceDateIs
        XCTAssert(bal == NSDecimalNumber(double:1000))
        XCTAssert(acc.accountType == .Savings)

        
    }


    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }

}
