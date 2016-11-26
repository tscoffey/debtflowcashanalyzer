//
//  WeeklyDateCalculatorTests.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 5/2/16.
//  Copyright © 2016 Coffey. All rights reserved.
//

import XCTest
@testable import DebtCashFlowAnalyzer

class WeeklyDateCalculatorTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func checkDaysUntil1(_ dayOfWeek:Int, fromDate:String, expected:Int) -> Bool {
        let calc=WeeklyDateCalculator.dateCalculatorInstance([(Int32(dayOfWeek),0)],
                                                             firstDate: nil, lastDate: nil,dateMitigation: .doNotShift)
        var baseDate=Date(dateString: fromDate)
        var num=calc.daysUntilNextDateAfter(baseDate)
        return num == expected
    }
    
    func test1Day() {
        if self.checkDaysUntil1(2,fromDate:"2016-05-01",expected:1) != true { XCTFail() }
        if self.checkDaysUntil1(2,fromDate:"2016-05-02",expected:7) != true { XCTFail() }

    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
