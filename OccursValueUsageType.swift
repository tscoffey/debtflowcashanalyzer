//
//  OccursValueUsageType.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 4/22/16.
//  Copyright © 2016 Coffey. All rights reserved.
//

import Foundation

enum OccursValueUsageType:Equatable {
    case Unused,
        DayOfWeek, DayOfMonth, DayOfQuarter, DayOfHalfYear, DayOfYear,
        WeekOfMonth, WeekOfQuarter, WeekOfHalfYear,WeekOfYear,
        MonthOfQuarter, MonthOfHalfYear, MonthOfYear,
        QuarterOfYear
    
}

