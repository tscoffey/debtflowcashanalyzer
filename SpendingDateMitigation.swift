//
//  WeekendSpendingMitigation.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 5/3/16.
//  Copyright © 2016 Coffey. All rights reserved.
//

import Foundation

enum SpendingDateMitigation:Int32 {
    case shiftForward, shiftBackward, doNotShift
    
    func mitigatedDate(_ date:Date) -> Date {
        if self == .doNotShift { return date }
        
        var comps=DateComponents()
        let cal=Calendar.current
        
        var nextDate=date
        
        while nextDate.isWeekendDate() ||  nextDate.isHolidayDate() {
            var byDays=0
            switch self {
                case .shiftForward: byDays = 1
                case .shiftBackward: byDays = -1
                case .doNotShift: byDays = 0
            }

            comps.day=byDays
            nextDate = (cal as NSCalendar).date(byAdding: comps, to: nextDate, options:NSCalendar.Options())!
        }
        return nextDate
    }


    
}
