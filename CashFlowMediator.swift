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

    class func modelNamed(_ named:String, insertIntoContext context:NSManagedObjectContext) -> CashFlowMediator? {
        let fetch=NSFetchRequest<NSFetchRequestResult>(entityName: self.entityName)
        fetch.predicate=NSPredicate(format: "name == %@", named)
        do {
            let fetchData = try context.fetch(fetch) as! [CashFlowMediator]
            if fetchData.count > 0 {
                return fetchData.first
            } else {
                let newOne=NSEntityDescription.insertNewObject(forEntityName: entityName, into: context) as! CashFlowMediator
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
        get { return (self.mutableSetValue(forKey: "banks")) }
        set (aValue) {
            self.banks=aValue
        }
    }
    
    var accountsMutableSet:NSMutableSet {
        get { return (self.mutableSetValue(forKey: "accounts")) }
        set (aValue) {
            self.accounts=aValue
        }
    }
    
    var categoriesMutableSet:NSMutableSet {
        get {
            return (self.mutableSetValue(forKey: "categories"))
        }
        set (aValue) {
            self.categories=aValue
        }
    }
    
    var merchantsMutableSet:NSMutableSet {
        get { return (self.mutableSetValue(forKey: "merchants")) }
        set (aValue) {
            self.merchants=aValue
        }
    }
    
    var plannedSpendingsMutableSet:NSMutableSet {
        get { return (self.mutableSetValue(forKey: "plannedSpending")) }
        set (aValue) {
            self.plannedSpending=aValue
        }
    }
    
    var spendingGeneratorsMutableSet:NSMutableSet {
        get { return (self.mutableSetValue(forKey: "spendingGenerators")) }
        set (aValue) {
            self.spendingGenerators = aValue
        }
    }
    
    var transactionsMutableSet:NSMutableSet {
        get { return (self.mutableSetValue(forKey: "transactions")) }
        set (aValue) {
            self.transactions = aValue
        }
    }
    
    var spendingOptionsIs:IsSpendingOptions {
        get { return self.spendingOptions as! IsSpendingOptions }
        set (aValue) {
            if self.spendingOptions != nil {
                self.modelContext.delete(self.spendingOptions!)
            }
            self.spendingOptions = (aValue as! SpendingOptions)
        }
    }

    

    
}
