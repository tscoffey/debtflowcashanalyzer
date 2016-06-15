//
//  WeeksInMonthDateCalculatorTests.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 5/10/16.
//  Copyright © 2016 Coffey. All rights reserved.
//

import XCTest
@testable import DebtCashFlowAnalyzer

class WeeksInMonthDateCalculatorTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func checkDaysUntil1( occursWeek weekInMonth:Int, dayOfWeek:Int, fromDate:String, expected:Int) -> Bool {
        let calc=WeeksInMonthDateCalculator.dateCalculatorInstance([(Int32(weekInMonth), Int32(dayOfWeek))],
                                                             firstDate: nil, lastDate: nil,dateMitigation: .DoNotShift)
        var baseDate=NSDate(dateString: fromDate)
        var num=calc.daysUntilNextDateAfter(baseDate)
        return num == expected
    }
    
    func test1Day() {
        if self.checkDaysUntil1(occursWeek: 1, dayOfWeek:2,fromDate:"2016-05-01",expected:1) != true { XCTFail() }
        if self.checkDaysUntil1(occursWeek: 2, dayOfWeek:1,fromDate:"2016-05-01",expected:7) != true { XCTFail() }
        if self.checkDaysUntil1(occursWeek: 3, dayOfWeek:7,fromDate:"2016-05-01",expected:20) != true { XCTFail() }
        
        if self.checkDaysUntil1(occursWeek: 1, dayOfWeek:7,fromDate:"2016-06-01",expected:3) != true { XCTFail() }
        
        if self.checkDaysUntil1(occursWeek: 1, dayOfWeek:1,fromDate:"2016-06-01",expected:32) != true { XCTFail() }
        
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }

}
