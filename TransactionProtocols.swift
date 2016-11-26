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

    var tranDueDateIs:Date { get set }
    var tranSendDateIs:Date { get }
    
    var tranMerchantNameIs: String? { get set }
    var tranHasClearedIs: Bool { get set }

}

protocol HasTransaction {
    var transactionIs:IsTransaction { get set }
}

protocol HasManyTransactions {
    var transactionsMutableSet:NSMutableSet { get set }
    var transactionsAre:[IsTransaction] { get }
    func addTransaction(_ transaction:IsTransaction)->Void
    func removeTransaction(_ transaction:IsTransaction)->Void
    func findTransactions(_ dated:Date, isDueDate:Bool)->[IsTransaction]
    func findTransactions(_ amountOf:NSDecimalNumber)->[IsTransaction]
    func findTransactions(_ categoryOf:IsSpendCategory)->[IsTransaction]
    func findTransactions(_ onAccount:IsSourceAccount)->[IsTransaction]
}

extension HasManyTransactions {
    
    var transactionsAre:[IsTransaction] {
        return self.transactionsMutableSet.map(){ $0 as! IsTransaction }
    }
    
    func addTransaction(_ transaction:IsTransaction) -> Void {
        self.transactionsMutableSet.add(transaction as AnyObject)
    }
    
    func removeTransaction(_ transaction:IsTransaction) -> Void {
        self.transactionsMutableSet.remove(transaction as AnyObject)
    }
    func findTransactions(_ dated:Date, isDueDate:Bool)->[IsTransaction] {
        return self.transactionsAre.filter( )
            {
                var temp:Date
                if isDueDate { temp = $0.tranDueDateIs } else { temp = $0.tranSendDateIs }
                return temp == dated
        }
    }
    func findTransactions(_ amountOf:NSDecimalNumber)->[IsTransaction] {
        return self.transactionsAre.filter(){$0.tranAmountIs == amountOf }
    }
    func findTransactions(_ categoryOf:IsSpendCategory)->[IsTransaction] {
        return self.transactionsAre.filter(){$0.categoryIs.nameIs == categoryOf.nameIs }
    }
    func findTransactions(_ onAccount:IsSourceAccount)->[IsTransaction] {
        return self.transactionsAre.filter(){$0.sourceAccountIs.nameIs == onAccount.nameIs}
    }    
}



