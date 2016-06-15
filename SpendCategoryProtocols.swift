//
//  CategoryProtocols.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 4/12/16.
//  Copyright © 2016 Coffey. All rights reserved.
//

import Foundation
import CoreData

protocol IsSpendCategory:HasModel,HasName,HasItemClearsTypes {
    var parentIs:IsSpendCategory? { get set }
    var subCategoriesMutableSet:NSMutableSet { get set }
    var subCategoriesAre:[IsSpendCategory] {get}
    var subCategoryNamesAre:[String] {get}

}

extension IsSpendCategory {
    
    var subCategoriesAre:[IsSpendCategory] {
        return self.subCategoriesMutableSet.map(){ $0 as! IsSpendCategory }
    }
    var subCategoryNamesAre:[String] {
        return self.subCategoriesAre.map(){$0.nameIs}
    }
    
}

protocol HasCategory {
    var categoryIs:IsSpendCategory { get set }
}


protocol HasManySpendCategories {
    var categoriesMutableSet:NSMutableSet { get set }
    var categoriesAre:[IsSpendCategory] { get }
    var categoryNamesAre:[String] { get }
    func addCategory(category:IsSpendCategory)->Void
    func removeCategory(category:IsSpendCategory)->Void
    func findCategory(named:String)->IsSpendCategory?
}

extension HasManySpendCategories {
    
    var categoriesAre:[IsSpendCategory] {
        return self.categoriesMutableSet.map(){ $0 as! IsSpendCategory }
    }
    
    var categoryNamesAre:[String] {
        return self.categoriesAre.map(){ $0.nameIs }
    }
    
    func addCategory(category:IsSpendCategory) -> Void {
        self.categoriesMutableSet.addObject(category as! AnyObject)
    }
    
    func removeCategory(category:IsSpendCategory) -> Void {
        self.categoriesMutableSet.removeObject(category as! AnyObject)
    }
    
    func findCategory(named:String) -> IsSpendCategory? {
        print("find cat in \(self)")
        for aCategory in self.categoriesAre {
            let name=aCategory.nameIs
            if name == named { return aCategory }
        }
        return nil
    }
}







