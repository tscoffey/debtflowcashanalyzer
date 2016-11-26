//
//  ModelTests.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 4/17/16.
//  Copyright © 2016 Coffey. All rights reserved.
//

import XCTest
@testable import DebtCashFlowAnalyzer

class MediatorTests: XCTestCase {

    let modelName="test-model"
    
    
    var mediator:CashFlowMediator  {

        return ModelBuilder(named:self.modelName).mediator
    }
    
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        self.mediator.managedObjectContext?.delete(self.mediator)
    }
    


    func testModelName() {
        XCTAssert(self.mediator.name == self.modelName)
       
    }
    
    func shouldNotRun() {
        print("oops")
        
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    

}
