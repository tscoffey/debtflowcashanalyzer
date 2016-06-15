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
    
    private var acctType:AccountType = .Unknown
    
    class func datedBalanceOf(balance:NSDecimalNumber, dated:NSDate, insertIntoContext context:NSManagedObjectContext) -> DatedBalance {
 
        let newOne=NSEntityDescription.insertNewObjectForEntityForName(entityName, inManagedObjectContext: context) as! DatedBalance
        newOne.balance=balance
        newOne.date=dated
        return newOne
  
    }
    
    class func datedBalanceOf(balance:NSDecimalNumber, dated:NSDate, addToAccount account:SourceAccount) -> DatedBalance {
        let newOne=self.datedBalanceOf(balance, dated: dated, insertIntoContext:account.modelContext )
        newOne.account=account
        return newOne
    }
    
    var acctDatedBalanceIs:NSDecimalNumber
    {
        get {return self.balance! }
        set (aValue) { self.balance=aValue }
    }
    var acctDatedBalanceDateIs:NSDate {
        get {return self.date}
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
