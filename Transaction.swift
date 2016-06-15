//
//  Transaction.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 4/6/16.
//  Copyright © 2016 Coffey. All rights reserved.
//

import Foundation
import CoreData


class Transaction: NSManagedObject,IsTransaction {

// Insert code here to add functionality to your managed object subclass
    
    var modelIs:IsMediator {
        get {return self.model! }
        set (aValue) { self.model=(aValue as! CashFlowMediator) }
    }
    
    var tranActualAmountIs:NSDecimalNumber? {
        get { return self.actualAmount! }
        set (aValue) { self.actualAmount=aValue }
    }
    var tranPlannedAmountIs:NSDecimalNumber {
        get { return self.plannedAmount}
        set (aValue) { self.plannedAmount=aValue }
    }
    var tranAmountIs:NSDecimalNumber {
        if self.tranActualAmountIs != nil {
            return self.tranActualAmountIs!
        } else {
            return self.tranPlannedAmountIs
        }
    }
    var tranDueDateIs:NSDate {
        get { return self.dueDate }
        set (aValue) { self.dueDate=aValue}
    }
    var tranSendDateIs:NSDate {
        let today = self.tranDueDateIs
        let next = NSCalendar.currentCalendar().dateByAddingUnit(
            .Day,
            value: (0 - self.plannedSpendingIs.leadDaysIs),
            toDate: today,
            options: NSCalendarOptions(rawValue: 0))
        return next!
    }
    var sourceAccountIs:IsSourceAccount {
        get { return self.fundsSource as! IsSourceAccount }
        set (aValue) { self.fundsSource = (aValue as! SourceAccount) }
    }
    var plannedSpendingIs:IsPlannedSpending {
        get { return self.spending as! IsPlannedSpending }
        set (aValue) { self.spending = (aValue as! PlannedSpending) }
    }
    var categoryIs:IsSpendCategory {
        get { return self.category as! IsSpendCategory }
        set (aValue) { self.category = (aValue as! SpendCategory) }
    }
    
    var tranMerchantNameIs: String? {
        get {
            if self.merchantName == nil {
                if self.plannedSpendingIs.defaultMerchantIs?.nameIs == nil {
                    return nil
                }
                return self.plannedSpendingIs.defaultMerchantIs?.nameIs
            }
            return self.merchantName
        }
        
        set (aValue) { self.merchantName=aValue}
    }
    var tranHasClearedIs: Bool {
        get {return self.hasCleared }
        set (aValue) { self.hasCleared=aValue }
    }

}
