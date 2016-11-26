//
//  PlannedSpending.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 4/6/16.
//  Copyright © 2016 Coffey. All rights reserved.
//

import Foundation
import CoreData


class PlannedSpending: NSManagedObject,IsPlannedSpending {

// Insert code here to add functionality to your managed object subclass
    
    static var entityName="PlannedSpending"
    
    class func spendingNamed(_ named:String, insertIntoContext context:NSManagedObjectContext) -> PlannedSpending? {

        let fetch=NSFetchRequest<NSFetchRequestResult>(entityName:self.entityName)
        
        
        fetch.predicate=NSPredicate(format: "name == %@", named)
        do {
            let fetchData = try context.fetch(fetch) as! [PlannedSpending]
            if fetchData.count > 0 {
                return fetchData.first
            } else {
                let newOne=NSEntityDescription.insertNewObject(forEntityName: entityName, into: context) as! PlannedSpending
                newOne.name=named
                return newOne
            }
        } catch {
            return nil
        }
    }
    class func spendingNamed(_ named:String, findInContext context:NSManagedObjectContext) -> PlannedSpending? {
        let fetch=NSFetchRequest<NSFetchRequestResult>(entityName: self.entityName)
        fetch.predicate=NSPredicate(format: "name == %@", named)
        do {
            let fetchData = try context.fetch(fetch) as! [PlannedSpending]
            if fetchData.count > 0 {
                return fetchData.first
            } else {
                return nil
            }
        } catch {
            return nil
        }
    }

    
    class func spendingNamed(_ named:String, category:SpendCategory, sourceAccount:IsSourceAccount, insertIntoModel model:CashFlowMediator) -> PlannedSpending? {
        guard let newOne=self.spendingNamed(named, findInContext: model.managedObjectContext!)
            else { return nil }
        
        model.addPlannedSpending(newOne)
        newOne.categoryIs=category
        newOne.sourceAccountIs=sourceAccount
        return newOne
    }

    var modelIs:IsMediator {
        get {return self.model! }
        set (aValue) { self.model=(aValue as! CashFlowMediator) }
    }
    
    var nameIs:String {
        get { return self.name! }
        set (aValue) { self.name=aValue }
    }
    
    var categoryIs:IsSpendCategory {
        get { return self.category! }
        set (aValue) { self.category=(aValue as! SpendCategory)}
    }
    var sourceAccountIs:IsSourceAccount {
        get { return self.fundsSource as! IsSourceAccount }
        set (aValue) { self.fundsSource=(aValue as! SourceAccount)}
    }
    
    var leadDaysIs:Int32 {
        get { return self.leadDays }
        set (aValue) { self.leadDays = aValue }
    }
    var firstDateIs: Date? {
        get { return self.firstDate as Date? }
        set (aValue) { self.firstDate = aValue }
    }
    var lastDateIs: Date? {
        get { return self.lastDate as Date? }
        set (aValue) { self.lastDate = aValue }
    }
    var defaultMerchantIs:IsMerchant? {
        get { return (self.defaultMerchant as! IsMerchant) }
        set (aValue) { self.defaultMerchant=(aValue as! DefaultMerchant)}
    }
    var reoccurranceIs: Reoccurrance {
        get { return self.reoccurrance! }
        set (aValue) {
            let oldReoccurrance=self.reoccurrance
            if oldReoccurrance != nil {
                self.modelContext.delete(oldReoccurrance!)
            }
            self.reoccurrance = aValue
        }
    }

    var transactionsMutableSet: NSMutableSet {
        get { return (self.managedObjectContext?.mutableSetValue(forKey: "transactions"))! }
        set (aValue) {
            self.transactions = aValue
        }
    }
    
    var itemHowClearsIs:ClearsMethodType {
        get {
            var clears:ClearsMethodType=ClearsMethodType(rawValue:self.howClearsTypeIndex)!
            if clears == .accountDetermines {
                clears=self.sourceAccountIs.itemHowClearsIs
            } else if clears == .categoryDetermines {
                return self.categoryIs.itemHowClearsIs
            }
            return clears
        }
        set (aValue) { self.howClearsTypeIndex = aValue.rawValue }
    }
    
    var itemAmountClearsIs:ClearsAmountType{
        get {
            var clears:ClearsAmountType=ClearsAmountType(rawValue:self.amountClearsTypeIndex)!
            if clears == .accountDetermines {
                clears=self.sourceAccountIs.itemAmountClearsIs
            }  else if clears == .categoryDetermines {
                return self.categoryIs.itemAmountClearsIs
            }
            return clears
        }
        set (aValue) { self.amountClearsTypeIndex = aValue.rawValue }
    }

    var itemWhenClearsIs:ClearsDateType {
        get {
            var clears:ClearsDateType=ClearsDateType(rawValue:self.whenClearsTypeIndex)!
            if clears == .accountDetermines {
                clears=self.sourceAccountIs.itemWhenClearsIs
            }  else if clears == .categoryDetermines {
                return self.categoryIs.itemWhenClearsIs
            }
            return clears
        }
        set (aValue) { self.whenClearsTypeIndex = aValue.rawValue }
    }

    var clearsAfterDaysIs:NSNumber? {
        get {
            let days=self.clearedAfterDays
            var val:NSNumber?
            if days == nil {
                if self.itemWhenClearsIs == .accountDetermines {
                    val = self.sourceAccountIs.clearsAfterDaysIs
                } else if self.itemWhenClearsIs == .categoryDetermines {
                    val = self.categoryIs.clearsAfterDaysIs
                }
            }
            return val
        }
        set (aValue) {
            self.clearedAfterDays = aValue
        }
    }

    
    var itemSendMethodTypeIs:ItemSendMethodType{
        get {
            var send:ItemSendMethodType=ItemSendMethodType(rawValue:self.itemSendTypeIndex)!
            if send == .accountDetermines {
                send=self.sourceAccountIs.itemSendMethodTypeIs
            }  else if send == .categoryDetermines {
                return self.categoryIs.itemSendMethodTypeIs
            }
            return send
        }
        set (aValue) { self.itemSendTypeIndex = aValue.rawValue }
    }
    
    var amountIs:NSDecimalNumber {
        get { return NSDecimalNumber(value: 0.00 as Double) }
        set (aValue) {}
    }
    
    var spendingTypeIs:PlannedSpendingType {
        get { return .budgetedSpending }
    }



}
