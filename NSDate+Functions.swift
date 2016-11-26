//
//  NSDate+Functions.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 7/7/16.
//  Copyright © 2016 Coffey. All rights reserved.
//

import Foundation

extension Date {
    
    
    init(dateString:String) {
        let dateStringFormatter = DateFormatter()
        dateStringFormatter.dateFormat = "yyyy-MM-dd"
        dateStringFormatter.locale = Locale(identifier: "en_US_POSIX")
        let d = dateStringFormatter.date(from: dateString)!
        self.init(timeInterval:0, since:d)
    }
    
    func isWeekendDate() -> Bool {
        let calendar = Calendar.current
        let weekday=(calendar as NSCalendar).components([.weekday], from: self).weekday
        if weekday! < 2 { return true }
        if weekday! > 6 { return true }
        return false
        
    }
    
    static func buildDate(_ year:Int, month:Int, day:Int)-> Date {
        var c = DateComponents()
        c.year = year
        c.month = month
        c.day = day
        return (Calendar(identifier: Calendar.Identifier.gregorian).date(from: c))!
        
    
    }
    static func datesAreAscending(_ date1:Date, date2:Date) -> Bool {
        return date1.compare(date2) == ComparisonResult.orderedAscending
    }
    
    static func datesAreDescending(_ date1:Date, date2:Date) -> Bool {
        return date1.compare(date2) == ComparisonResult.orderedDescending
    }
    
    static func datesAreSame(_ date1:Date, date2:Date) -> Bool {
        return date1.compare(date2) == ComparisonResult.orderedSame
    }
    
    func dayInMonthFor() -> Int {
        let calendar = Calendar.current
        return (calendar as NSCalendar).components([.day], from: self).day!
    }
    
    func monthFor() -> Int {
        let calendar = Calendar.current
        return (calendar as NSCalendar).components([.month], from: self).month!
    }
    
    func monthInQuarterFor()->Int {
        return ((self.monthFor() - 1) % 3) + 1
    }
    
    func quarterFor()->Int {
        let month=self.monthFor()
        let quarters=[1,1,1,2,2,2,3,3,3,4,4,4]
        return quarters[month - 1]
    }
    
    func yearFor() -> Int {
        let calendar = Calendar.current
        return (calendar as NSCalendar).components([.year], from: self).year!
    }
    
    func firstDateInMonthFor() -> Date {
        return Date.buildDate(self.yearFor(), month: self.monthFor(), day: 1)
    }
    
    func firstDateInNextMonthFor() -> Date {
        var month=self.monthFor()
        var year=self.yearFor()
        if month == 12 {
            month=1
            year=year+1
        } else {
            month=month+1
        }
        return Date.buildDate(year, month: month, day: 1)
    }
    
    func weekdayBiasOfMonthFor() -> Int {
        return self.firstDateInMonthFor().weekdayFor() - 1
    }
    
    func weekdayFor() -> Int {
        let calendar = Calendar.current
        return (calendar as NSCalendar).components([.weekday], from: self).weekday!
    }
    
    func weekOfMonthFor() -> Int {
        let calendar = Calendar.current
        return (calendar as NSCalendar).components([.weekOfMonth], from: self).weekOfMonth!
    }
    
    func weekdayOccurrenceInMonthFor() -> Int {
        let weekday=self.weekdayFor()
        let weekInMonth=self.weekOfMonthFor()
        let bias=self.weekdayBiasOfMonthFor()
        if weekday >= bias {
            return weekInMonth
        } else {
            return weekInMonth - 1
        }
    }
    
    static func dateForWeekdayAndCountIn(_ month:Int, year:Int, weekday:Int, count:Int) -> Date {
        let firstOfMonth=Date.buildDate(year, month: month, day: 1)
        let bias=firstOfMonth.weekdayBiasOfMonthFor()
        var dayOfMonth:Int
        if weekday >= bias {
            dayOfMonth=weekday - bias  + (7 * (count - 1))
        } else {
            dayOfMonth=weekday + 7 - bias  + (7*(count - 1))
        }
        return Date.buildDate(year, month: month, day: dayOfMonth)
        
    }
    
    func daysInMonthFor() -> Int {
        let calendar = Calendar.current
        return (calendar as NSCalendar).range(of: .day, in: .month, for: self).length
    }
    
    func addDaysToDate(_ days:Int) -> Date {
        let next=(Calendar.current as NSCalendar).date(byAdding: [.day], value: days, to: self, options: [])
        return next!
    }
    
    func subtractDaysFromDate(_ days:Int) -> Date {
        return self.addDaysToDate(0 - days)
    }
    
    func daysBetween(_ toDate:Date) -> Int {
        let calendar=Calendar.current
        let date1 = calendar.startOfDay(for: self)
        let date2 = calendar.startOfDay(for: toDate)
        let flags = NSCalendar.Unit.day
        let components = (calendar as NSCalendar).components(flags, from: date1, to: date2, options: [])
        return components.day!
    }


    
}
