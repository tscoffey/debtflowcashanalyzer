//
//  DefaultMerchant+CoreDataProperties.swift
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

extension DefaultMerchant {

    @NSManaged var merchant: Merchant?
    @NSManaged var plannedSpending: PlannedSpending?

}
