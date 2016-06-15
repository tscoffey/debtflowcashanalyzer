//
//  DebtAccount+CoreDataProperties.swift
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

extension DebtAccount {

    @NSManaged var debtTypeIndex: Int32
    @NSManaged var includeInPayoff: Bool
    @NSManaged var debtBalances: NSSet?
    @NSManaged var debtServicings: NSSet?
    @NSManaged var paymentCalculator: DebtPaymentCalculator?
    @NSManaged var payments: NSSet?
    @NSManaged var payoffOrdinal: OrderedDebtAccount?

}
