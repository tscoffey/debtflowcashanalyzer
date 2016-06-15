//
//  CashFlowMediator+CoreDataProperties.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 4/16/16.
//  Copyright © 2016 Coffey. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension CashFlowMediator {

    @NSManaged var name: String?
    @NSManaged var accounts: NSSet?
    @NSManaged var banks: NSSet?
    @NSManaged var categories: NSSet?
    @NSManaged var merchants: NSSet?
    @NSManaged var plannedSpending: NSSet?
    @NSManaged var spendingGenerators: NSSet?
    @NSManaged var spendingOptions: SpendingOptions?
    @NSManaged var transactions: NSSet?

}
