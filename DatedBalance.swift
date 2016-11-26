//
//  DatedBalance.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 4/6/16.
//  Copyright © 2016 Coffey. All rights reserved.
//

import Foundation
import CoreData


class DatedBalance: NSManagedObject, IsAccountDatedBalance {

    static var entityName="DatedBalance"
    
    fileprivate var acctType:AccountType = .unknown
    
    class func datedBalanceOf(_ balance:NSDecimalNumber, dated:Date, insertIntoContext context:NSManagedObjectContext) -> DatedBalance {
 
        let newOne=NSEntityDescription.insertNewObject(forEntityName: entityName, into: context) as! DatedBalance
        newOne.balance=balance
        newOne.date=dated
        return newOne
  
    }
    
    class func datedBalanceOf(_ balance:NSDecimalNumber, dated:Date, addToAccount account:SourceAccount) -> DatedBalance {
        let newOne=self.datedBalanceOf(balance, dated: dated, insertIntoContext:account.modelContext )
        newOne.account=account
        return newOne
    }
    
    var acctDatedBalanceIs:NSDecimalNumber
    {
        get {return self.balance! }
        set (aValue) { self.balance=aValue }
    }
    var acctDatedBalanceDateIs:Date {
        get {return self.date as Date}
        set (aValue) {self.date=aValue }
    }
    
    var accountIs:IsAccount {
        get { return self.account! }
        set (aValue) { self.account=(aValue as! SourceAccount) }
    }
    
    var sourceAccountIs:IsSourceAccount {
        get { return self.account! }
        set (aValue) { self.account=(aValue as! SourceAccount) }
    }

}
