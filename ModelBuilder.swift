//
//  ModelBuilder.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 4/21/16.
//  Copyright © 2016 Coffey. All rights reserved.
//

import Foundation
import CoreData
import UIKit

open class ModelBuilder {
    
    
    class func empty()->ModelBuilder {
        return ModelBuilder(named:"")
    }
    
    var ctxt:NSManagedObjectContext
    var mediator:CashFlowMediator
    
    var context:NSManagedObjectContext {
        get {return ctxt }
        set (aValue) {ctxt=aValue }
    }
    var model:CashFlowMediator { return mediator }
    
    
    init (named:String) {
       ctxt=(UIApplication.shared.delegate as! AppDelegate ).managedObjectContext
        mediator=CashFlowMediator.modelNamed(named, insertIntoContext: ctxt)!
    }
    
    open func modelName(_ named:String) -> ModelBuilder {
        mediator.nameIs=named
        return self
    }
    
    open func modelMerchants(_ names:[String])-> ModelBuilder {
        for name in names {
            mediator.addMerchant(Merchant.merchantNamed(name,insertIntoModel: mediator)!)
        }
        return self
    }
    
    open func modelBanks(_ names:[String])-> ModelBuilder {
        for name in names {
            mediator.addBank(Bank.bankNamed(name,insertIntoModel: mediator)!)
        }
        return self
    }
    
    open func modelSourceAccounts(_ accounts:[(String, String, AccountType, Double)]) -> ModelBuilder {
        for (aName, bName, aType, initialBalance) in accounts {
            var bank=Bank.bankNamed(bName,findInContext: ctxt)
            if bank == nil {
                bank=Bank.bankNamed(bName,insertIntoModel: mediator)
            }
            mediator.addAccount(SourceAccount.accountNamed(aName, inBank: bank!, type: aType, initialBalance:NSDecimalNumber(value: initialBalance as Double), dated:Date(), insertIntoModel: mediator)!)
            
        }
        return self
    }
    
    open func modelCategories(_ categories:[(String, String)]) -> ModelBuilder {
        for (cname,pname) in categories {
            var pCat:SpendCategory?=nil
            if pname.characters.count > 0 {
                pCat=SpendCategory.categoryNamed(pname, parentCategory: nil, insertIntoModel: mediator)
            }
            _ = SpendCategory.categoryNamed(cname, parentCategory: pCat, insertIntoModel: mediator)
            
        }
        return self
    }
    
    open func buildWith(_ banks:[String],
                          accounts:[(String,String,AccountType,Double)],
                          categories:[(String,String)],
                          merchants:[String]) -> Void
    {
        self.modelBanks(banks).modelSourceAccounts(accounts).modelCategories(categories).modelMerchants(merchants)
    }
    
}
