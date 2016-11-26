//
//  SourceAccount.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 4/6/16.
//  Copyright © 2016 Coffey. All rights reserved.
//

import Foundation
import CoreData


class SourceAccount: Account,IsSourceAccount {
    
    static var entityName="SourceAccount"
    
    
    class func accountNamed(_ named:String, insertIntoContext context:NSManagedObjectContext) -> SourceAccount? {
        let fetch=NSFetchRequest<NSFetchRequestResult>(entityName: self.entityName)
        fetch.predicate=NSPredicate(format: "name == %@", named)
        do {
            let fetchData = try context.fetch(fetch) as! [SourceAccount]
            if fetchData.count > 0 {
                return fetchData.first
            } else {
                let newOne=NSEntityDescription.insertNewObject(forEntityName: entityName, into: context) as! SourceAccount
                newOne.name=named
                return newOne
            }
        } catch {
            return nil
        }
    }
    class func accountNamed(_ named:String, findInContext context:NSManagedObjectContext) -> SourceAccount? {
        let fetch=NSFetchRequest<NSFetchRequestResult>(entityName: self.entityName)
        fetch.predicate=NSPredicate(format: "name == %@", named)
        do {
            let fetchData = try context.fetch(fetch) as! [SourceAccount]
            if fetchData.count > 0 {
                return fetchData.first
            } else {
                return nil
            }
        } catch {
            return nil
        }
    }
    
    
    class func accountNamed(_ named:String, inBank:Bank, type:AccountType, initialBalance:NSDecimalNumber, dated:Date, insertIntoModel model:CashFlowMediator) -> SourceAccount? {
        guard let newOne=self.accountNamed(named, insertIntoContext: model.managedObjectContext!)
            else { return nil }
        
        newOne.model=model
        newOne.bank=inBank
        newOne.accountType=type
        newOne.setInitialBalanceTo(initialBalance,dated:dated)
        return newOne
    }

    var accountDatedBalancesMutableSet:NSMutableSet {
        get { return self.mutableSetValue(forKey: "balances") }
        set (aValue) { self.balances = aValue }
    }

    func accountCurrentBalanceOnDateIs(_ date:Date) -> NSDecimalNumber {
        return 0
    }
    func accountCurrentBalanceIs() -> NSDecimalNumber {
        return 0
    }
    func setInitialBalanceTo(_ initialBalance:NSDecimalNumber, dated:Date) {
        for datedBalance in self.balances! {
            self.modelContext.delete(datedBalance as! NSManagedObject)
        }
        
        _ = DatedBalance.datedBalanceOf(initialBalance, dated: dated, addToAccount: self)
        
    }

    var itemHowClearsIs:ClearsMethodType {
        get { return ClearsMethodType(rawValue: self.howClearsTypeIndex)! }
        set (aValue) { self.howClearsTypeIndex = aValue.rawValue }
    }
    
    var itemAmountClearsIs:ClearsAmountType{
        get { return ClearsAmountType(rawValue: self.amountClearsTypeIndex)! }
        set (aValue) { self.amountClearsTypeIndex = aValue.rawValue }
    }
    
    var itemWhenClearsIs:ClearsDateType {
        get { return ClearsDateType(rawValue: self.whenClearsTypeIndex)! }
        set (aValue) { self.whenClearsTypeIndex = aValue.rawValue }
    }
    
    var clearsAfterDaysIs:NSNumber? {
        get { return Int(self.itemsClearedAfterDays) as NSNumber? }
        set (aValue) { self.itemsClearedAfterDays = (aValue?.int32Value)! }
    }
    
    
    var itemSendMethodTypeIs:ItemSendMethodType{
        get { return ItemSendMethodType(rawValue: self.itemSendTypeIndex)! }
        set (aValue) { self.itemSendTypeIndex = aValue.rawValue }
    }

}
