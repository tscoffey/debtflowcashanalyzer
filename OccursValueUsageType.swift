//
//  OccursValueUsageType.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 4/22/16.
//  Copyright © 2016 Coffey. All rights reserved.
//

import Foundation

enum OccursValueUsageType:Equatable {
    case unused,
        dayOfWeek, dayOfMonth, dayOfQuarter, dayOfHalfYear, dayOfYear,
        weekOfMonth, weekOfQuarter, weekOfHalfYear,weekOfYear,
        monthOfQuarter, monthOfHalfYear, monthOfYear,
        quarterOfYear
    
}

