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
    func addPlannedSpending(_ plannedSpending:IsPlannedSpending)->Void
    func removePlannedSpending(_ plannedSpending:IsPlannedSpending)->Void
    func findPlannedSpending(_ named:String)->IsPlannedSpending?
}

protocol HasFirstLastDates {
    var firstDateIs:Date? { get set }
    var lastDateIs:Date? { get set }
    
}
extension HasManyPlannedSpendings {
    
    var plannedSpendingsAre:[IsPlannedSpending] {
        return self.plannedSpendingsMutableSet.map(){ $0 as! IsPlannedSpending }
    }
    
    var plannedSpendingNamesAre:[String] {
        return self.plannedSpendingsAre.map(){ $0.nameIs }
    }
    
    func addPlannedSpending(_ plannedSpending:IsPlannedSpending) -> Void {
        self.plannedSpendingsMutableSet.add(plannedSpending as AnyObject)
    }
    
    func removePlannedSpending(_ plannedSpending:IsPlannedSpending) -> Void {
        self.plannedSpendingsMutableSet.remove(plannedSpending as AnyObject)
    }
    
    func findPlannedSpending(_ named:String) -> IsPlannedSpending? {
        for aPlannedSpending in self.plannedSpendingsAre {
            if aPlannedSpending.nameIs == named { return aPlannedSpending }
        }
        return nil
    }
}

