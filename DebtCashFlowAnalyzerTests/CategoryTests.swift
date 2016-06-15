//
//  CategoryTests.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 4/25/16.
//  Copyright © 2016 Coffey. All rights reserved.
//

import XCTest
@testable import DebtCashFlowAnalyzer

class CategoryTests: XCTestCase {

    let categoryNames=[("p1",""),("p2",""),("p3",""),
                       ("c1.1","p1"),("c1.2","p1"),
                       ("c2.1","p2"),
                       ("c3.1","p3"),("c3.2","p3"),("c3.3","p3")
        ]
    
    
    var mediator:CashFlowMediator?
    
    
    override func setUp() {
        super.setUp()
        mediator=ModelBuilder(named:"test-categories").modelCategories(self.categoryNames).mediator
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        mediator!.managedObjectContext?.deleteObject(mediator!)
    }
    func testCategoryCount() {
        let c=mediator!.categoriesAre.count
        if c != 9 {
            let names=mediator!.categoryNamesAre
            for name in names {
                print(name)
            }
            XCTFail("Category count incorrect. Actual count is \(c)")
        }

    }
    
    func testP1SubcategoryCount() {
        if let p=mediator!.findCategory("p1") {
            print("subCategory names are \(p.subCategoryNamesAre)")
            XCTAssert(p.subCategoriesAre.count == 2)
            
        } else {
            XCTFail("p1 not found")
        }
    }
    func testP2SubcategoryCount() {
        if let p=mediator!.findCategory("p2") {
            XCTAssert(p.subCategoriesAre.count == 1)
            
        } else {
            XCTFail("p2 not found")
        }
    }
    func testP3SubcategoryCount() {
        if let p=mediator!.findCategory("p3") {
            XCTAssert(p.subCategoriesAre.count == 3)
            
        } else {
            XCTFail("p3 not found")
        }
    }

    func testP1SubcategoryNames() {
        let names=mediator!.findCategory("p1")?.subCategoryNamesAre.sort(){$0 < $1}
        XCTAssert(names! == ["c1.1","c1.2"])
    }
    
    func testP2SubcategoryNames() {
        let names=mediator!.findCategory("p2")?.subCategoryNamesAre.sort(){$0 < $1}
        XCTAssert(names! == ["c2.1"])
    }
    func testP3SubcategoryNames() {
        let names=mediator!.findCategory("p3")?.subCategoryNamesAre.sort(){$0 < $1}
        XCTAssert(names! == ["c3.1","c3.2","c3.3"])
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }

}
