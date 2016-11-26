//
//  ProposedSourceAccountTests.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 5/11/16.
//  Copyright © 2016 Coffey. All rights reserved.
//

import XCTest
@testable import DebtCashFlowAnalyzer

class ProposedSourceAccountTests: XCTestCase,HasManyAccounts,HasManyBanks {

    

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testAccountNameExistsTrue() {
        let proposed=ProposedSourceAccount(accountsLookup: self, banksLookup: self)
        proposed.name="Account1"
        let r=proposed.nameAlreadyExists()
        XCTAssertTrue(r)
    }
    func testAccountNameExistsFalse() {
        let proposed=ProposedSourceAccount(accountsLookup: self, banksLookup: self)
        proposed.name="Unknown"
        let r=proposed.nameAlreadyExists()
        XCTAssertFalse(r)
    }
    func testNameIsValidTrueEditNew() {
        let proposed=ProposedSourceAccount(accountsLookup: self, banksLookup: self)
        proposed.name="NewName"
        let r=proposed.nameIsValid()
        XCTAssertTrue(r)
    }
    func testNameIsValidFalseEditNew() {
        let proposed=ProposedSourceAccount(accountsLookup: self, banksLookup: self)
        proposed.name="Account1"
        let r=proposed.nameIsValid()
        XCTAssertFalse(r)
    }
    func testNameIsValidTrueEditOld() {
        let proposed=ProposedSourceAccount(accountsLookup: self, banksLookup: self)
        proposed.name="NewName"
        let r=proposed.nameIsValid()
        XCTAssertTrue(r)
    }
    func testNameIsValidFalseEditOld() {
        let proposed=ProposedSourceAccount(accountsLookup: self, banksLookup: self)
        proposed.name="Account1"
        let r=proposed.nameIsValid()
        XCTAssertFalse(r)
    }

 
    
    
    
    
    var accountNamesAre:[String] {
        return ["Account1","Account2"]
    }
    
    var accountsMutableSet:NSMutableSet {
        get {return NSMutableSet() }
        set (aValue) { }
    }
    
    var accountsAre:[IsAccount] {
        return [IsAccount]()
    }
    
    
    func addAccount(_ account:IsAccount) -> Void {
        
    }
    
    func removeAccount(_ account:IsAccount) -> Void {
        
    }
    
    func findAccount(_ named:String) -> IsAccount? {
        return nil
    }
    
    var banksMutableSet:NSMutableSet {
        get {return NSMutableSet() }
        set (aValue) { }
    }

    var banksAre:[IsBank] {
        return [IsBank]()
    }
    
    var bankNamesAre:[String] {
        return ["Bank1","Bank2","Bank3"]
    }
    
    func addBank(_ bank:IsBank) -> Void {
        
    }
    
    func removeBank(_ bank:IsBank) -> Void {
        
    }
    
    func findBank(_ named:String) -> IsBank? {
        return nil
    }



    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
