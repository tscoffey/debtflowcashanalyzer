//
//  SpendingOptions+CoreDataProperties.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 5/6/16.
//  Copyright © 2016 Coffey. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension SpendingOptions {

    @NSManaged var weekendsAndHolidayMitigationIndex: Int32
    @NSManaged var debtPaymentGranularity: NSDecimalNumber?
    @NSManaged var dipIntoGoalSavings: Bool
    @NSManaged var optimizeTransfers: Bool
    @NSManaged var model: CashFlowMediator?

}
