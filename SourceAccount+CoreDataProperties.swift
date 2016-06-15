//
//  SourceAccount+CoreDataProperties.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 5/9/16.
//  Copyright © 2016 Coffey. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension SourceAccount {

    @NSManaged var howClearsTypeIndex: Int32
    @NSManaged var amountClearsTypeIndex: Int32
    @NSManaged var whenClearsTypeIndex: Int32
    @NSManaged var itemsClearedAfterDays: Int32
    @NSManaged var itemSendTypeIndex: Int32
    @NSManaged var balances: NSSet?
    @NSManaged var plannedSpending: NSSet?
    @NSManaged var transactionsAsDestination: NSSet?
    @NSManaged var transactionsAsSource: NSSet?

}
