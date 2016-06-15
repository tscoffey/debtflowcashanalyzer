//
//  PlannedSpendingProtocols.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 4/14/16.
//  Copyright © 2016 Coffey. All rights reserved.
//

import Foundation
import CoreData

protocol IsPlannedSpending:HasModel,HasName,HasCategory,HasSourceAccount,HasReoccurrance, HasManyTransactions,HasItemClearsTypes,HasFirstLastDates  {
    var leadDaysIs:Int32 { get set }
    var defaultMerchantIs:IsMerchant? { get set }
    var amountIs:NSDecimalNumber { get set }
    var spendingTypeIs:PlannedSpendingType { get }
       
}

protocol HasPlannedSpending {
    var plannedSpendingIs:IsPlannedSpending { get set }
}

protocol HasManyPlannedSpendings {
    var plannedSpendingsMutableSet:NSMutableSet { get set }
    var plannedSpendingsAre:[IsPlannedSpending] { get }
    var plannedSpendingNamesAre:[String] { get }
    func addPlannedSpending(plannedSpending:IsPlannedSpending)->Void
    func removePlannedSpending(plannedSpending:IsPlannedSpending)->Void
    func findPlannedSpending(named:String)->IsPlannedSpending?
}

protocol HasFirstLastDates {
    var firstDateIs:NSDate? { get set }
    var lastDateIs:NSDate? { get set }
    
}
extension HasManyPlannedSpendings {
    
    var plannedSpendingsAre:[IsPlannedSpending] {
        return self.plannedSpendingsMutableSet.map(){ $0 as! IsPlannedSpending }
    }
    
    var plannedSpendingNamesAre:[String] {
        return self.plannedSpendingsAre.map(){ $0.nameIs }
    }
    
    func addPlannedSpending(plannedSpending:IsPlannedSpending) -> Void {
        self.plannedSpendingsMutableSet.addObject(plannedSpending as! AnyObject)
    }
    
    func removePlannedSpending(plannedSpending:IsPlannedSpending) -> Void {
        self.plannedSpendingsMutableSet.removeObject(plannedSpending as! AnyObject)
    }
    
    func findPlannedSpending(named:String) -> IsPlannedSpending? {
        for aPlannedSpending in self.plannedSpendingsAre {
            if aPlannedSpending.nameIs == named { return aPlannedSpending }
        }
        return nil
    }
}

