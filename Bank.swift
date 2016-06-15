//
//  Bank.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 4/6/16.
//  Copyright © 2016 Coffey. All rights reserved.
//

import Foundation
import CoreData


class Bank: NSManagedObject,IsBank {
    
    static var entityName="Bank"

    class func bankNamed(named:String, findInContext context:NSManagedObjectContext) -> Bank? {
        let fetch=NSFetchRequest(entityName: self.entityName)
        fetch.predicate=NSPredicate(format: "name == %@", named)
        do {
            let fetchData = try context.executeFetchRequest(fetch) as! [Bank]
            if fetchData.count > 0 {
                return fetchData.first
            } else {
                return nil
            }
        } catch {
            return nil
        }
    }

    class func bankNamed(named:String, insertIntoContext context:NSManagedObjectContext) -> Bank? {
        let fetch=NSFetchRequest(entityName: self.entityName)
        fetch.predicate=NSPredicate(format: "name == %@", named)
        do {
            let fetchData = try context.executeFetchRequest(fetch) as! [Bank]
            if fetchData.count > 0 {
                return fetchData.first
            } else {
                let newOne=NSEntityDescription.insertNewObjectForEntityForName(entityName, inManagedObjectContext: context) as! Bank
                newOne.name=named
                return newOne
            }
        } catch {
            return nil
        }
    }
    class func bankNamed(named:String, insertIntoModel model:CashFlowMediator) -> Bank? {
        guard let newOne=self.bankNamed(named, insertIntoContext: model.managedObjectContext!)
            else { return nil }
        
        model.addBank(newOne)
        return newOne
    }

    var bankLateFeeIs:NSDecimalNumber {
        get { return self.lateFee! }
        set (aValue) { self.lateFee = aValue }
    }
    var bankMinimumPaymentAmountIs:NSDecimalNumber {
        get {return self.minimumPaymentAmount! }
        set (aValue) {self.minimumPaymentAmount = aValue }
    }
    
    var bankMinimumPaymentPercentIs:NSDecimalNumber {
        get {return self.minimumPaymentPct! }
        set (aValue) {self.minimumPaymentPct = aValue}
    }
    
        


    
    var modelIs:IsMediator {
        get {return self.model! }
        set (aValue) { self.model=(aValue as! CashFlowMediator) }
    }
    
    var nameIs:String {
        get { return self.name! }
        set (aValue) { self.name=aValue }
    }
    
    var accountsMutableSet:NSMutableSet {
        get { return (self.managedObjectContext?.mutableSetValueForKey("accounts"))! }
        set (aValue) {
            self.accounts=aValue
        }
    }
    
}