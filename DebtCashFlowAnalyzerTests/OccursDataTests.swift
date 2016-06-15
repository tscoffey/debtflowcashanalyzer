//
//  OccursDataTests.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 5/26/16.
//  Copyright © 2016 Coffey. All rights reserved.
//

import XCTest

@testable import DebtCashFlowAnalyzer

class OccursDataTests: XCTestCase,IsOccursContentDataSource {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testMonthly() {
        let occurs=OccursData(type:ReoccurranceType.Monthly,data:[(15,0,0)])
        let chooserData=occurs.occursChooserArray(self)

    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
    func dayOfMonth()->Int? {
        return 15
    }

}
