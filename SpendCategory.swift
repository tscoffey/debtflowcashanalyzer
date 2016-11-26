//
//  Category.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 4/6/16.
//  Copyright © 2016 Coffey. All rights reserved.
//

import Foundation
import CoreData


class SpendCategory: NSManagedObject,IsSpendCategory {
    
    static var entityName="SpendCategory"

    class func categoryNamed(_ named:String, parentCategory parent:SpendCategory?, insertIntoContext context:NSManagedObjectContext) -> SpendCategory? {
        let fetch=NSFetchRequest<NSFetchRequestResult>(entityName: self.entityName)
        fetch.predicate=NSPredicate(format: "name == %@", named)
        do {
            let fetchData = try context.fetch(fetch) as! [SpendCategory]
            if fetchData.count > 0 {
                return fetchData.first
            } else {
                let newOne=NSEntityDescription.insertNewObject(forEntityName: entityName, into: context) as! SpendCategory
                newOne.name=named
                newOne.parent=parent
                return newOne
            }
        } catch {
            return nil
        }
    }
    class func categoryNamed(_ named:String,  findInContext context:NSManagedObjectContext) -> SpendCategory? {
        let fetch=NSFetchRequest<NSFetchRequestResult>(entityName: self.entityName)
        fetch.predicate=NSPredicate(format: "name == %@", named)
        do {
            let fetchData = try context.fetch(fetch) as! [SpendCategory]
            if fetchData.count > 0 {
                return fetchData.first
            } else {
                return nil
            }
        } catch {
            return nil
        }
    }

    class func categoryNamed(_ named:String, parentCategory parent:SpendCategory?, insertIntoModel model:CashFlowMediator) -> SpendCategory? {
        guard let newOne=self.categoryNamed(named, parentCategory: parent, insertIntoContext: model.managedObjectContext!)
            else { return nil }
        
        newOne.model=model
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
    var parentIs:IsSpendCategory? {
        get { return self.parent }
        set (aValue) { self.parent = (aValue as! SpendCategory) }
    }

    var subCategoriesMutableSet:NSMutableSet {
        get {
            return (self.mutableSetValue(forKey: "subCategories"))
        }
        set (aValue) {
            self.subCategories=aValue
        }
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
        get { return self.clearedAfterDays }
        set (aValue) { self.clearedAfterDays = aValue }
    }
    
    
    var itemSendMethodTypeIs:ItemSendMethodType{
        get { return ItemSendMethodType(rawValue: self.itemSendTypeIndex)! }
        set (aValue) { self.itemSendTypeIndex = aValue.rawValue }
    }


}
