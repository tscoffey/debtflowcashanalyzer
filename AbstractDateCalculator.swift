//
//  AbstractDateCalculator.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 4/23/16.
//  Copyright © 2016 Coffey. All rights reserved.
//

extension NSDate
{
    convenience
    init(dateString:String) {
        let dateStringFormatter = NSDateFormatter()
        dateStringFormatter.dateFormat = "yyyy-MM-dd"
        dateStringFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX")
        let d = dateStringFormatter.dateFromString(dateString)!
        self.init(timeInterval:0, sinceDate:d)
    }
}

import Foundation

func isHolidayDate(date:NSDate) -> Bool {
    return AbstractDateCalculator.holidayDates.contains(date)
}

func isWeekendDate(date:NSDate) -> Bool {
    let calendar = NSCalendar.currentCalendar()
    let weekday=calendar.components([.Weekday], fromDate: date).weekday
    return (2...6).contains(weekday) == false
}

func datesAreAscending(date1:NSDate, date2:NSDate) -> Bool {
    return date1.compare(date2) == NSComparisonResult.OrderedAscending
}

func datesAreDescending(date1:NSDate, date2:NSDate) -> Bool {
    return date1.compare(date2) == NSComparisonResult.OrderedDescending
}

func datesAreSame(date1:NSDate, date2:NSDate) -> Bool {
    return date1.compare(date2) == NSComparisonResult.OrderedSame
}

func dayInMonthFor(date:NSDate) -> Int {
    let calendar = NSCalendar.currentCalendar()
    return calendar.components([.Day], fromDate: date).day
}
func monthFor(date:NSDate) -> Int {
    let calendar = NSCalendar.currentCalendar()
    return calendar.components([.Month], fromDate: date).month
}
func yearFor(date:NSDate) -> Int {
    let calendar = NSCalendar.currentCalendar()
    return calendar.components([.Year], fromDate: date).year
}
func firstDateInMonthFor(date:NSDate) -> NSDate {
    return buildDate(yearFor(date), month: monthFor((date)), day: 1)
}
func firstDateInNextMonthFor(date:NSDate) -> NSDate {
    var month=monthFor(date)
    var year=yearFor(date)
    if month == 12 {
        month=1
        year=year+1
    } else {
        month=month+1
    }
    return buildDate(year, month: month, day: 1)
}
func weekdayBiasOfMonthFor(date:NSDate) -> Int {
    return weekdayFor(firstDateInMonthFor(date)) - 1
}
func weekdayFor(date:NSDate) -> Int {
    let calendar = NSCalendar.currentCalendar()
    return calendar.components([.Weekday], fromDate: date).weekday
}
func weekOfMonthFor(date:NSDate) -> Int {
    let calendar = NSCalendar.currentCalendar()
    return calendar.components([.WeekOfMonth], fromDate: date).weekOfMonth
}
func weekdayOccurrenceInMonthFor(date:NSDate) -> Int {
    let weekday=weekdayFor(date)
    let weekInMonth=weekOfMonthFor(date)
    let bias=weekdayBiasOfMonthFor(date)
    if weekday >= bias {
        return weekInMonth
    } else {
        return weekInMonth - 1
    }
}

func dateForWeekdayAndCountIn(month:Int, year:Int, weekday:Int, count:Int) -> NSDate {
    let firstOfMonth=buildDate(year, month: month, day: 1)
    let bias=weekdayBiasOfMonthFor(firstOfMonth)
    var dayOfMonth:Int
    if weekday >= bias {
        dayOfMonth=weekday - bias  + (7 * (count - 1))
    } else {
        dayOfMonth=weekday + 7 - bias  + (7*(count - 1))
    }
    return buildDate(year, month: month, day: dayOfMonth)

}
func daysInMonthFor(date:NSDate) -> Int {
    let calendar = NSCalendar.currentCalendar()
    return calendar.rangeOfUnit(.Day, inUnit: .Month, forDate: date).length
}

func buildDate(year:Int, month:Int, day:Int) -> NSDate {
    let comp=NSDateComponents()
    comp.calendar=NSCalendar.currentCalendar()
    comp.year=year
    comp.month=month
    comp.day=day
    return comp.date!
}

func addDaysToDate(days:Int, date:NSDate) -> NSDate {
    let next=NSCalendar.currentCalendar().dateByAddingUnit([.Day], value: days, toDate: date, options: [])
    return next!
}

func subtractDaysFromDate(days:Int, date:NSDate) -> NSDate {
    return addDaysToDate(0 - days, date: date)
}

func daysBetween(fromDate:NSDate, toDate:NSDate) -> Int {
    let calendar=NSCalendar.currentCalendar()
    let date1 = calendar.startOfDayForDate(fromDate)
    let date2 = calendar.startOfDayForDate(toDate)
    let flags = NSCalendarUnit.Day
    let components = calendar.components(flags, fromDate: date1, toDate: date2, options: [])
    return components.day
}


class AbstractDateCalculator:IsReoccurringDateCalculator {
    
    static var holidayDates:[NSDate] = ["2016-01-01"].map(){NSDate(dateString: $0)}
    
    var firstDate:NSDate?
    var lastDate:NSDate?
    var spendingDateMitigation:SpendingDateMitigation
    
    init (firstDate fDate:NSDate?, lastDate lDate:NSDate?, dateMitigation:SpendingDateMitigation) {
        firstDate=fDate
        lastDate=lDate
        spendingDateMitigation=dateMitigation
    }
    
    func nextDateAfter(date:NSDate)->NSDate? {
        let days=self.daysUntilNextDateAfter(date)
        let comps=NSDateComponents()
        comps.day=days
        if let next=NSCalendar.currentCalendar().dateByAddingComponents(comps, toDate: date, options:NSCalendarOptions()) {
            if self.dateIsInRange(next) {
                return next
            } else {
                return nil
            }
        } else {
            return nil
        }
    }
    func nextDateOnOrAfter(date:NSDate)->NSDate? {
        return NSDate()
    }
    
    func prevDateBefore(date:NSDate)->NSDate? {
        return NSDate()
    }
    
    func prevDateOnOrBefore(date:NSDate)->NSDate? {
        return NSDate()
    }
    
    func datesAfter(date:NSDate)->[NSDate] {
        var all=[NSDate]()
        
        var next=self.nextDateAfter(date)
        while next != nil {
            all.append(next!)
            next=self.nextDateAfter(next!)
        }
        return all
    }
    
    func datesOnOrAfter(date:NSDate)->[NSDate] {
        return []
    }
    func datesBefore(date:NSDate)->[NSDate] {
        return []
    }
    func datesOnOrBefore(date:NSDate)->[NSDate] {
        return []
    }
    
    func daysUntilNextDateOnOrAfter(date:NSDate)->Int { return 0 }
    func daysUntilNextDateAfter(date:NSDate)->Int { return 0 }
    func daysSincePrevDateOnOrBefore(date:NSDate)->Int { return 0 }
    func daysSincePrevDateBefore(date:NSDate)->Int { return 0 }

    
    func nextDateBetween(startDate:NSDate, toDate:NSDate)->NSDate? {
        return NSDate()
    }
    
    func nextDatesBetween(startDate:NSDate, toDate:NSDate)->[NSDate] {
        return []
    }
    
    func dateIsInRange(date:NSDate)->Bool {
        if let fDate=firstDate {
            if fDate.compare(date) == NSComparisonResult.OrderedDescending { return false }
        }
        if let lDate=lastDate {
            if lDate.compare(date) == NSComparisonResult.OrderedAscending { return false }
        }
        return true
    }
    
}
