//
//  Transaction+CoreDataProperties.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 4/28/16.
//  Copyright © 2016 Coffey. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Transaction {

    @NSManaged var plannedAmount: NSDecimalNumber
    @NSManaged var dueDate: NSDate
    @NSManaged var merchantName: String?
    @NSManaged var actualAmount: NSDecimalNumber?
    @NSManaged var sendDate: NSDate
    @NSManaged var hasCleared: Bool
    @NSManaged var category: SpendCategory?
    @NSManaged var fundsSource: SourceAccount?
    @NSManaged var model: CashFlowMediator?
    @NSManaged var spending: PlannedSpending?

}
