//
//  OccursValues+CoreDataProperties.swift
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

extension OccursValues {

    @NSManaged var dataValue1: Int32
    @NSManaged var dataValue2: Int32
    @NSManaged var dataValue3: Int32
    @NSManaged var reoccurrance: Reoccurrance?

}
