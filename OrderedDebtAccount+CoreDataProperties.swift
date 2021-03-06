//
//  OrderedDebtAccount+CoreDataProperties.swift
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

extension OrderedDebtAccount {

    @NSManaged var ordinal: Int16
    @NSManaged var debtAccount: DebtAccount?
    @NSManaged var payoffGenerator: DebtPayoffGenerator?

}
