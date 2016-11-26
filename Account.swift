//
//  Account.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 4/6/16.
//  Copyright © 2016 Coffey. All rights reserved.
//

import Foundation
import CoreData


class Account: NSManagedObject,IsAccount {
    
//    static var entityName="Account"
    
    fileprivate var acctType:AccountType = .unknown
    
    
    var accountType:AccountType {
        get { return acctType }
        set (aValue) { acctType=aValue
                       self.accountTypeIndex=aValue.rawValue
            }
    }

    
    var modelIs:IsMediator {
        get {return self.model! }
        set (aValue) { self.model=(aValue as! CashFlowMediator) }
    }
    
    var bankIs:IsBank {
        get { return self.bank! }
        set (aValue) { self.bank=(aValue as! Bank) }
    }
    
    
    var nameIs:String {
        get { return self.name! }
        set (aValue) { self.name=aValue }
    }
    
    var transactionsMutableSet: NSMutableSet {
        get { preconditionFailure("Must override this property") }
        set (aValue) { preconditionFailure("Must override this property") }
    }
    
    
}
