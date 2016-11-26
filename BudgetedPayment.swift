//
//  BudgetedPayment.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 4/6/16.
//  Copyright © 2016 Coffey. All rights reserved.
//

import Foundation
import CoreData


class BudgetedPayment: Transaction {
    
    static var entityName="BudgetedPayment"
    
    class func paymentOf(_ amount:Double, dueOn:Date, sendOn:Date, insertIntoContext context:NSManagedObjectContext) -> BudgetedPayment {

        let newOne=NSEntityDescription.insertNewObject(forEntityName: entityName, into: context) as! BudgetedPayment
        newOne.plannedAmount=NSDecimalNumber(value: amount as Double)
        newOne.dueDate=dueOn
        newOne.sendDate=sendOn
        return newOne
 
    }
    
    class func paymentOf(_ amount:Double, dueOn:Date, sendOn:Date, insertIntoAccount account:SourceAccount) -> BudgetedPayment {
        let newOne=self.paymentOf(amount, dueOn: dueOn, sendOn: sendOn, insertIntoContext: account.modelContext)
        newOne.fundsSource=account
        newOne.model=account.model
        return newOne
    }
    
    class func paymentOf(_ amount:Double, dueOn:Date, sendOn:Date,
                         merchantName:String?,
                         category:IsSpendCategory, plannedSpending:IsPlannedSpending,
                         insertIntoAccount account:SourceAccount) -> BudgetedPayment {
        let newOne=self.paymentOf(amount, dueOn: dueOn, sendOn: sendOn, insertIntoAccount: account)
        newOne.categoryIs=category
        newOne.plannedSpendingIs=plannedSpending
        newOne.tranMerchantNameIs=merchantName
        return newOne
    }



}
