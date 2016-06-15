//
//  CashFlowMediator.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 4/7/16.
//  Copyright © 2016 Coffey. All rights reserved.
//

import Foundation
import CoreData


class CashFlowMediator: NSManagedObject,IsMediator {
    
    static var entityName="CashFlowMediator"

//    override init(entity: NSEntityDescription, insertIntoManagedObjectContext context: NSManagedObjectContext?) {
//        super.init(entity: entity, insertIntoManagedObjectContext: context)
//    }

    class func modelNamed(named:String, insertIntoContext context:NSManagedObjectContext) -> CashFlowMediator? {
        let fetch=NSFetchRequest(entityName: self.entityName)
        fetch.predicate=NSPredicate(format: "name == %@", named)
        do {
            let fetchData = try context.executeFetchRequest(fetch) as! [CashFlowMediator]
            if fetchData.count > 0 {
                return fetchData.first
            } else {
                let newOne=NSEntityDescription.insertNewObjectForEntityForName(entityName, inManagedObjectContext: context) as! CashFlowMediator
                newOne.name=named
                return newOne
            }
        } catch {
            return nil
        }
    }

    var modelContext:NSManagedObjectContext {
        return self.managedObjectContext!
    }
    
    var nameIs:String {
        get { return self.name! }
        set (aValue) { self.name=aValue }
    }
    
    var banksMutableSet:NSMutableSet {
        get { return (self.mutableSetValueForKey("banks")) }
        set (aValue) {
            self.banks=aValue
        }
    }
    
    var accountsMutableSet:NSMutableSet {
        get { return (self.mutableSetValueForKey("accounts")) }
        set (aValue) {
            self.accounts=aValue
        }
    }
    
    var categoriesMutableSet:NSMutableSet {
        get {
            return (self.mutableSetValueForKey("categories"))
        }
        set (aValue) {
            self.categories=aValue
        }
    }
    
    var merchantsMutableSet:NSMutableSet {
        get { return (self.mutableSetValueForKey("merchants")) }
        set (aValue) {
            self.merchants=aValue
        }
    }
    
    var plannedSpendingsMutableSet:NSMutableSet {
        get { return (self.mutableSetValueForKey("plannedSpending")) }
        set (aValue) {
            self.plannedSpending=aValue
        }
    }
    
    var spendingGeneratorsMutableSet:NSMutableSet {
        get { return (self.mutableSetValueForKey("spendingGenerators")) }
        set (aValue) {
            self.spendingGenerators = aValue
        }
    }
    
    var transactionsMutableSet:NSMutableSet {
        get { return (self.mutableSetValueForKey("transactions")) }
        set (aValue) {
            self.transactions = aValue
        }
    }
    
    var spendingOptionsIs:IsSpendingOptions {
        get { return self.spendingOptions as! IsSpendingOptions }
        set (aValue) {
            if self.spendingOptions != nil {
                self.modelContext.deleteObject(self.spendingOptions!)
            }
            self.spendingOptions = (aValue as! SpendingOptions)
        }
    }

    

    
}
