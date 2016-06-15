//
//  Reoccurrance+CoreDataProperties.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 4/22/16.
//  Copyright © 2016 Coffey. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Reoccurrance {

    @NSManaged var reoccursTypeIndex: Int32
    @NSManaged var plannedSpending: PlannedSpending?
    @NSManaged var occursValues: NSSet?

}
