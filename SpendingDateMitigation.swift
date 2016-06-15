//
//  WeekendSpendingMitigation.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 5/3/16.
//  Copyright © 2016 Coffey. All rights reserved.
//

import Foundation

enum SpendingDateMitigation:Int32 {
    case ShiftForward, ShiftBackward, DoNotShift
    
    func mitigatedDate(date:NSDate) -> NSDate {
        if self == .DoNotShift { return date }
        
        let comps=NSDateComponents()
        let cal=NSCalendar.currentCalendar()
        
        var nextDate=date
        
        while isWeekendDate(nextDate) ||  isHolidayDate(nextDate) {
            var byDays=0
            switch self {
                case .ShiftForward: byDays = 1
                case .ShiftBackward: byDays = -1
                case .DoNotShift: byDays = 0
            }

            comps.day=byDays
            nextDate = cal.dateByAddingComponents(comps, toDate: nextDate, options:NSCalendarOptions())!
        }
        return nextDate
    }


    
}
