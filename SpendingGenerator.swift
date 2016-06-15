//
//  SpendingGenerator.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 4/6/16.
//  Copyright © 2016 Coffey. All rights reserved.
//

import Foundation
import CoreData


class SpendingGenerator: NSManagedObject,IsSpendingGenerator {

// Insert code here to add functionality to your managed object subclass

    var modelIs:IsMediator {
        get {return self.model! }
        set (aValue) { self.model=(aValue as! CashFlowMediator) }
    }

}
