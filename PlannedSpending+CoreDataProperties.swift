//
//  PlannedSpending+CoreDataProperties.swift
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

extension PlannedSpending {

    @NSManaged var firstDate: Date?
    @NSManaged var lastDate: Date?
    @NSManaged var leadDays: Int32
    @NSManaged var name: String?
    @NSManaged var amountClearsTypeIndex: Int32
    @NSManaged var howClearsTypeIndex: Int32
    @NSManaged var whenClearsTypeIndex: Int32
    @NSManaged var clearedAfterDays: NSNumber?
    @NSManaged var itemSendTypeIndex: Int32
    @NSManaged var category: SpendCategory?
    @NSManaged var defaultMerchant: DefaultMerchant?
    @NSManaged var fundsSource: SourceAccount?
    @NSManaged var model: CashFlowMediator?
    @NSManaged var reoccurrance: Reoccurrance?
    @NSManaged var transactions: NSSet?

}
