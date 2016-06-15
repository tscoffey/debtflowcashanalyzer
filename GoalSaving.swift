//
//  GoalSaving.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 4/6/16.
//  Copyright © 2016 Coffey. All rights reserved.
//

import Foundation
import CoreData


class GoalSaving: PlannedSpending {

// Insert code here to add functionality to your managed object subclass
    
    override var amountIs:NSDecimalNumber {
        get { return self.saveAmount! }
        set (aValue) { self.saveAmount = aValue }
    }
    override var spendingTypeIs:PlannedSpendingType {
        get { return .GoalSaving }
    }

}
