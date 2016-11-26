//
//  AbstractDateCalculator.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 4/23/16.
//  Copyright © 2016 Coffey. All rights reserved.
//


import Foundation

extension Date {
    
    func isHolidayDate() -> Bool {
        return AbstractDateCalculator.holidayDates.contains(self)
    }
}


class AbstractDateCalculator:IsReoccurringDateCalculator {
    
    static var holidayDates:[Date] = ["2016-01-01"].map(){Date(dateString: $0)}
    
    var firstDate:Date?
    var lastDate:Date?
    var spendingDateMitigation:SpendingDateMitigation
    
    init (firstDate fDate:Date?, lastDate lDate:Date?, dateMitigation:SpendingDateMitigation) {
        firstDate=fDate
        lastDate=lDate
        spendingDateMitigation=dateMitigation
    }
    
    func nextDateAfter(_ date:Date)->Date? {
        let days=self.daysUntilNextDateAfter(date)
        var comps=DateComponents()
        comps.day=days
        if let next=(Calendar.current as NSCalendar).date(byAdding: comps, to: date, options:NSCalendar.Options()) {
            if self.dateIsInRange(next) {
                return next
            } else {
                return nil
            }
        } else {
            return nil
        }
    }
    func nextDateOnOrAfter(_ date:Date)->Date? {
        return Date()
    }
    
    func prevDateBefore(_ date:Date)->Date? {
        return Date()
    }
    
    func prevDateOnOrBefore(_ date:Date)->Date? {
        return Date()
    }
    
    func datesAfter(_ date:Date)->[Date] {
        var all=[Date]()
        
        var next=self.nextDateAfter(date)
        while next != nil {
            all.append(next!)
            next=self.nextDateAfter(next!)
        }
        return all
    }
    
    func datesOnOrAfter(_ date:Date)->[Date] {
        return []
    }
    func datesBefore(_ date:Date)->[Date] {
        return []
    }
    func datesOnOrBefore(_ date:Date)->[Date] {
        return []
    }
    
    func daysUntilNextDateOnOrAfter(_ date:Date)->Int { return 0 }
    func daysUntilNextDateAfter(_ date:Date)->Int { return 0 }
    func daysSincePrevDateOnOrBefore(_ date:Date)->Int { return 0 }
    func daysSincePrevDateBefore(_ date:Date)->Int { return 0 }

    
    func nextDateBetween(_ startDate:Date, toDate:Date)->Date? {
        return Date()
    }
    
    func nextDatesBetween(_ startDate:Date, toDate:Date)->[Date] {
        return []
    }
    
    func dateIsInRange(_ date:Date)->Bool {
        if let fDate=firstDate {
            if fDate.compare(date) == ComparisonResult.orderedDescending { return false }
        }
        if let lDate=lastDate {
            if lDate.compare(date) == ComparisonResult.orderedAscending { return false }
        }
        return true
    }
    
}
