//
//  DebtServicing.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 4/6/16.
//  Copyright © 2016 Coffey. All rights reserved.
//

import Foundation
import CoreData


class DebtServicing: PlannedSpending {

// Insert code here to add functionality to your managed object subclass
    
    override var spendingTypeIs:PlannedSpendingType {
        get { return .debtServicing }
    }

}
