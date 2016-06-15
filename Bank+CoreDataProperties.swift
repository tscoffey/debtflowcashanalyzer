//
//  Bank+CoreDataProperties.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 4/15/16.
//  Copyright © 2016 Coffey. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Bank {

    @NSManaged var lateFee: NSDecimalNumber?
    @NSManaged var minimumPaymentAmount: NSDecimalNumber?
    @NSManaged var minimumPaymentPct: NSDecimalNumber?
    @NSManaged var name: String?
    @NSManaged var accounts: NSSet?
    @NSManaged var model: CashFlowMediator?

}
