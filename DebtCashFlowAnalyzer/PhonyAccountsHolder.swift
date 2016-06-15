//
//  ViewController.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 4/4/16.
//  Copyright © 2016 Coffey. All rights reserved.
//

import UIKit
import CoreData

private class PhonyAccount:NSObject,IsSourceAccount {
    var type:AccountType
    var name:String
    var howClears:ClearsMethodType
    
    var nameIs:String {
        get {
            return name }
        set (aValue) { name=aValue } }
    
    init (name:String, type:AccountType, how:ClearsMethodType) {

        self.name=name
        self.type=type
        self.howClears=how
    }
    var modelIs:IsMediator {
        get { return appDelegate().currentMediator }
        set (aValue) {}
    }
    var modelContext:NSManagedObjectContext {return NSManagedObjectContext() }
    
    var transactionsMutableSet:NSMutableSet {
        get { return NSMutableSet() }
        set (aValue) {}
    }

    
    var accountType:AccountType {
        get {
            return type }
        set (aValue) {}
    }
    
    var accountDatedBalancesMutableSet:NSMutableSet {
        get { return NSMutableSet()}
        set (aValue) {}
    }
    
    var accountDatedBalancesAre:[IsAccountDatedBalance] { return [IsAccountDatedBalance]()}
    func accountCurrentBalanceOnDateIs(date:NSDate) -> NSDecimalNumber {
        return 0
    }
    func accountCurrentBalanceIs() -> NSDecimalNumber {
        return 0
    }
    func setInitialBalanceTo(initialBalance:NSDecimalNumber, dated:NSDate)
    {
        
    }
    
    var itemHowClearsIs:ClearsMethodType {
        get { return howClears }
        set (aValue) {howClears=aValue}
    }
    
    var itemAmountClearsIs:ClearsAmountType {
        get { return ClearsAmountType.ClearsForExactAmount }
        set (aValue) {}
    }
    
    var itemWhenClearsIs:ClearsDateType {
        get { return ClearsDateType.ClearsOnSendDate}
        set (aValue) {}
    }
    var clearsAfterDaysIs:NSNumber? {
        get { return nil}
        set (aValue) {}
    }

    var itemSendMethodTypeIs:ItemSendMethodType {
        get { return ItemSendMethodType.SentByBillPay }
        set (aValue) {}
    }
    
    var bankIs:IsBank { get { return Bank() } set (aValue) {} }
    
    
}

class PhonyAccountHolder: HasManyAccounts {

    var testAccounts:[IsAccount]?
    
    init() {
        testAccounts=[IsAccount]()
        testAccounts?.append((PhonyAccount(name:"Account1",type:.Checking,how:ClearsMethodType.ClearsAutomatically)))
        testAccounts?.append((PhonyAccount(name:"Account2",type:.Savings,how:ClearsMethodType.ClearsManually)))

    }
    
    var accountsMutableSet:NSMutableSet {
         get { return NSMutableSet() }
        set (aValue) { }
    }

    var accountsAre:[IsAccount] {
        return testAccounts!
    }
    
    var accountNamesAre:[String] {
        return self.accountsAre.map(){ $0.nameIs }
    }
    
    func addAccount(account:IsAccount) -> Void {
        
    }
    
    func removeAccount(account:IsAccount) -> Void {
        
    }
    
    func findAccount(named:String) -> IsAccount? {
        return nil
    }

}

