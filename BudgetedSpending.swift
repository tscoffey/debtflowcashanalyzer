//
//  BudgetedSpending.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 4/6/16.
//  Copyright © 2016 Coffey. All rights reserved.
//

import Foundation
import CoreData


class BudgetedSpending: PlannedSpending {

    override var amountIs:NSDecimalNumber {
        get { return self.scheduledAmount! }
        set (aValue) { self.scheduledAmount = aValue }
    }
    
    override var spendingTypeIs:PlannedSpendingType {
        get { return .budgetedSpending }
    }


}
