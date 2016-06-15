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
    
    class func paymentOf(amount:Double, dueOn:NSDate, sendOn:NSDate, insertIntoContext context:NSManagedObjectContext) -> BudgetedPayment {

        let newOne=NSEntityDescription.insertNewObjectForEntityForName(entityName, inManagedObjectContext: context) as! BudgetedPayment
        newOne.plannedAmount=NSDecimalNumber(double:amount)
        newOne.dueDate=dueOn
        newOne.sendDate=sendOn
        return newOne
 
    }
    
    class func paymentOf(amount:Double, dueOn:NSDate, sendOn:NSDate, insertIntoAccount account:SourceAccount) -> BudgetedPayment {
        let newOne=self.paymentOf(amount, dueOn: dueOn, sendOn: sendOn, insertIntoContext: account.modelContext)
        newOne.fundsSource=account
        newOne.model=account.model
        return newOne
    }
    
    class func paymentOf(amount:Double, dueOn:NSDate, sendOn:NSDate,
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
