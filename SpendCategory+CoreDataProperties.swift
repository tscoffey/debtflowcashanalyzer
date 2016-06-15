//
//  SpendCategory+CoreDataProperties.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 5/16/16.
//  Copyright © 2016 Coffey. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension SpendCategory {

    @NSManaged var name: String?
    @NSManaged var amountClearsTypeIndex: Int32
    @NSManaged var howClearsTypeIndex: Int32
    @NSManaged var whenClearsTypeIndex: Int32
    @NSManaged var itemSendTypeIndex: Int32
    @NSManaged var clearedAfterDays: NSNumber?
    @NSManaged var model: CashFlowMediator?
    @NSManaged var parent: SpendCategory?
    @NSManaged var plannedSpending: NSSet?
    @NSManaged var shadowAccount: CategoryShadowAccount?
    @NSManaged var subCategories: NSSet?
    @NSManaged var transactions: NSSet?

}
