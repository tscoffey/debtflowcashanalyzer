//
//  Merchant.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 4/6/16.
//  Copyright © 2016 Coffey. All rights reserved.
//

import Foundation
import CoreData
import UIKit


class Merchant: NSManagedObject, IsMerchant {
    
    static var entityName="Merchant"
    
    class func merchantNamed(named:String, insertIntoContext context:NSManagedObjectContext) -> Merchant? {
        let fetch=NSFetchRequest(entityName: self.entityName)
        fetch.predicate=NSPredicate(format: "name == %@", named)
        do {
            let fetchData = try context.executeFetchRequest(fetch) as! [Merchant]
            if fetchData.count > 0 {
                return fetchData.first
            } else {
                let newOne=NSEntityDescription.insertNewObjectForEntityForName(entityName, inManagedObjectContext: context) as! Merchant
                newOne.name=named
                return newOne
            }
        } catch {
            return nil
        }
    }
    class func merchantNamed(named:String, findInContext context:NSManagedObjectContext) -> Merchant? {
        let fetch=NSFetchRequest(entityName: self.entityName)
        fetch.predicate=NSPredicate(format: "name == %@", named)
        do {
            let fetchData = try context.executeFetchRequest(fetch) as! [Merchant]
            if fetchData.count > 0 {
                return fetchData.first
            } else {
                return nil
            }
        } catch {
            return nil
        }
    }
    class func merchantNamed(named:String, insertIntoModel model:CashFlowMediator) -> Merchant? {
        guard let newOne=self.merchantNamed(named, insertIntoContext: model.managedObjectContext!)
            else { return nil }
        
        model.addMerchant(newOne)
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

}
