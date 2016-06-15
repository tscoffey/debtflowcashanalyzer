//
//  MonthlyDateCalculatorTests.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 4/29/16.
//  Copyright © 2016 Coffey. All rights reserved.
//

extension NSDate
{
    convenience
    init(dateString:String) {
        let dateStringFormatter = NSDateFormatter()
        dateStringFormatter.dateFormat = "yyyy-MM-dd"
        dateStringFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX")
        let d = dateStringFormatter.dateFromString(dateString)!
        self.init(timeInterval:0, sinceDate:d)
    }
}

import XCTest
import CoreData
@testable import DebtCashFlowAnalyzer

class MonthlyDateCalculatorTests: XCTestCase {
//    var ctxt:NSManagedObjectContext
    

    override func setUp() {
        super.setUp()
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func checkDaysUntil1(dayOfMonth:Int, fromDate:String, expected:Int) -> Bool {
        let calc=MonthlyDateCalculator.dateCalculatorInstance([(Int32(dayOfMonth),0)], firstDate: nil, lastDate: nil,dateMitigation: .DoNotShift)
        var baseDate=NSDate(dateString: fromDate)
        var num=calc.daysUntilNextDateAfter(baseDate)
        return num == expected
    }
    func checkDaysUntil2(daysOfMonth:(Int,Int), fromDate:String, expected:Int) -> Bool {
        let calc=DaysOfMonthDateCalculator.dateCalculatorInstance([(Int32(daysOfMonth.0),0),(Int32(daysOfMonth.1),1)],
                    firstDate: nil, lastDate: nil,dateMitigation: .DoNotShift)
        var baseDate=NSDate(dateString: fromDate)
        var num=calc.daysUntilNextDateAfter(baseDate)
        return num == expected
    }


    func test1Day() {
        if  self.checkDaysUntil1(10, fromDate: "2016-01-01", expected: 9) != true { XCTFail("1/1/2016 to 1/10/2016 ") }
        if  self.checkDaysUntil1(10, fromDate: "2016-01-09", expected: 1) != true { XCTFail("1/9/2016 to 1/10/2016 ") }
        if  self.checkDaysUntil1(10, fromDate: "2016-01-10", expected: 31) != true { XCTFail("1/10/2016 to 2/10/2016 ") }
        
        if  self.checkDaysUntil1(10, fromDate: "2016-02-01", expected: 9) != true { XCTFail("2/1/2016 to 2/10/2016 ") }
        if  self.checkDaysUntil1(10, fromDate: "2016-02-09", expected: 1) != true { XCTFail("2/9/2016 to 2/10/2016 ") }
        if  self.checkDaysUntil1(10, fromDate: "2016-02-10", expected: 29) != true { XCTFail("2/10/2016 to 3/10/2016 ") }
       

        
    }
    
    func test2Days() {
        if self.checkDaysUntil2((10,20), fromDate: "2016-01-01", expected: 9) != true {XCTFail("2-1/1/2016 to 1/10/2016 ") }
        if self.checkDaysUntil2((10,20), fromDate: "2016-01-10", expected: 10) != true {XCTFail("2-1/10/2016 to 1/20/2016 ") }
        if self.checkDaysUntil2((10,20), fromDate: "2016-01-11", expected: 9) != true {XCTFail("2-1/11/2016 to 1/20/2016 ") }
        if self.checkDaysUntil2((10,20), fromDate: "2016-01-20", expected: 21) != true {XCTFail("2-1/21/2016 to 2/10/2016 ") }



        
    }
    
    func testMany01() {
        let calc=MonthlyDateCalculator.dateCalculatorInstance([(Int32(1),0)],
                                                            firstDate: NSDate(dateString: "2016-01-01"),
                                                            lastDate: NSDate(dateString: "2016-12-31"),dateMitigation: .DoNotShift)
        var baseDate=NSDate(dateString: "2015-12-31")
        let all=calc.datesAfter(baseDate)
        if all.count != 12 { XCTFail("count wrong, is \(all.count)") }
    }
    func testMany29() {
        let calc=MonthlyDateCalculator.dateCalculatorInstance([(Int32(29),0)],
                                                              firstDate: NSDate(dateString: "2016-01-01"),
                                                              lastDate: NSDate(dateString: "2016-12-31"),dateMitigation: .DoNotShift)
        var baseDate=NSDate(dateString: "2015-12-31")
        let all=calc.datesAfter(baseDate)
        if all.count != 12 { XCTFail("count wrong, is \(all.count)") }
    }
    func testMany30() {
        let calc=MonthlyDateCalculator.dateCalculatorInstance([(Int32(30),0)],
                                                              firstDate: NSDate(dateString: "2016-01-01"),
                                                              lastDate: NSDate(dateString: "2016-12-31"),dateMitigation: .DoNotShift)
        var baseDate=NSDate(dateString: "2015-12-31")
        let all=calc.datesAfter(baseDate)
        if all.count != 12 { XCTFail("count wrong, is \(all.count)") }
    }
    func testMany31() {
        let calc=MonthlyDateCalculator.dateCalculatorInstance([(Int32(31),0)],
                                                              firstDate: NSDate(dateString: "2016-01-01"),
                                                              lastDate: NSDate(dateString: "2016-12-31"),dateMitigation: .DoNotShift)
        var baseDate=NSDate(dateString: "2015-12-31")
        let all=calc.datesAfter(baseDate)
        if all.count != 12 { XCTFail("count wrong, is \(all.count)") }
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }

}
