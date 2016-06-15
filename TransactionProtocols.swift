//
//  TransactionProtocols.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 4/16/16.
//  Copyright © 2016 Coffey. All rights reserved.
//

import Foundation
import CoreData

protocol IsTransaction:HasModel,HasSourceAccount,HasPlannedSpending,HasCategory {
    var tranPlannedAmountIs:NSDecimalNumber { get set }
    var tranActualAmountIs:NSDecimalNumber? { get set }
    var tranAmountIs:NSDecimalNumber { get }

    var tranDueDateIs:NSDate { get set }
    var tranSendDateIs:NSDate { get }
    
    var tranMerchantNameIs: String? { get set }
    var tranHasClearedIs: Bool { get set }

}

protocol HasTransaction {
    var transactionIs:IsTransaction { get set }
}

protocol HasManyTransactions {
    var transactionsMutableSet:NSMutableSet { get set }
    var transactionsAre:[IsTransaction] { get }
    func addTransaction(transaction:IsTransaction)->Void
    func removeTransaction(transaction:IsTransaction)->Void
    func findTransactions(dated:NSDate, isDueDate:Bool)->[IsTransaction]
    func findTransactions(amountOf:NSDecimalNumber)->[IsTransaction]
    func findTransactions(categoryOf:IsSpendCategory)->[IsTransaction]
    func findTransactions(onAccount:IsSourceAccount)->[IsTransaction]
}

extension HasManyTransactions {
    
    var transactionsAre:[IsTransaction] {
        return self.transactionsMutableSet.map(){ $0 as! IsTransaction }
    }
    
    func addTransaction(transaction:IsTransaction) -> Void {
        self.transactionsMutableSet.addObject(transaction as! AnyObject)
    }
    
    func removeTransaction(transaction:IsTransaction) -> Void {
        self.transactionsMutableSet.removeObject(transaction as! AnyObject)
    }
    func findTransactions(dated:NSDate, isDueDate:Bool)->[IsTransaction] {
        return self.transactionsAre.filter( )
            {
                var temp:NSDate
                if isDueDate { temp = $0.tranDueDateIs } else { temp = $0.tranSendDateIs }
                return temp == dated
        }
    }
    func findTransactions(amountOf:NSDecimalNumber)->[IsTransaction] {
        return self.transactionsAre.filter(){$0.tranAmountIs == amountOf }
    }
    func findTransactions(categoryOf:IsSpendCategory)->[IsTransaction] {
        return self.transactionsAre.filter(){$0.categoryIs.nameIs == categoryOf.nameIs }
    }
    func findTransactions(onAccount:IsSourceAccount)->[IsTransaction] {
        return self.transactionsAre.filter(){$0.sourceAccountIs.nameIs == onAccount.nameIs}
    }    
}



