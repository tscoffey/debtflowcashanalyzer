//
//  SpendingOptions.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 4/12/16.
//  Copyright © 2016 Coffey. All rights reserved.
//

import Foundation
import CoreData


class SpendingOptions: NSManagedObject,IsSpendingOptions {
    
    static var entityName="SpendingOptions"

    class func defaultOptions(insertIntoContext context:NSManagedObjectContext) -> SpendingOptions {

        let newOne=NSEntityDescription.insertNewObject(forEntityName: entityName, into: context) as! SpendingOptions
        newOne.debtPaymentGranularity = NSDecimalNumber(value: 0.01 as Double)
        newOne.dipIntoGoalSavings = false
        newOne.optimizeTransfers = true
        newOne.weekendsAndHolidayMitigationIs = .doNotShift
        return newOne
    }
    
    class func defaultOptions(_ named:String, insertIntoModel model:CashFlowMediator) -> SpendingOptions {
        let newOne=self.defaultOptions(insertIntoContext: model.modelContext)
        model.spendingOptionsIs=newOne as IsSpendingOptions
        return newOne
    }
        
    var modelIs:IsMediator {
        get {return self.model! }
        set (aValue) { self.model=(aValue as! CashFlowMediator) }
    }
    
    var spendingMitigation:SpendingDateMitigation = .doNotShift
    
    var weekendsAndHolidayMitigationIs:SpendingDateMitigation {
        get {
            spendingMitigation=SpendingDateMitigation(rawValue:self.weekendsAndHolidayMitigationIndex)!
            return spendingMitigation
        }
        set (aValue) { spendingMitigation=aValue
                    self.weekendsAndHolidayMitigationIndex=aValue.rawValue
        }
    }

}
