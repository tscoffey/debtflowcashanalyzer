//
//  ProposedReoccurrance.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 5/10/16.
//  Copyright © 2016 Coffey. All rights reserved.
//

import Foundation

class ProposedReoccurrance {
    var original:IsOccursContentDataSource
    
    var _reoccurranceType:ReoccurranceType?
    var _dayOfMonth:Int?
    var _dayOfQuarter:Int?
    var _dayOfHalfYear:Int?
    var _dayOfYear:Int?
    
    var _firstDayOfMonth:Int?
    var _secondDayOfMonth:Int?
    
    var _weekday:Int?
    var _weekOfMonth:Int?
    var _weekOfQuarter:Int?
    var _weekOfHalfYear:Int?
    var _weekOfYear:Int?
    
    var _monthOfQuarter:Int?
    var _monthOfHalfYear:Int?
    var _monthOfYear:Int?

    var _quarterOfYear:Int?
    var _intervalSize:Int?
    
    var _year:Int?
    
    var _daysOfMonth:[Int]?
    var _daysOfQuarter:[Int]?
    var _weekdays:[Int]?
    var _weeksOfMonth:[Int]?
    var _weeksOfQuarter:[Int]?
    var _weeksOfHalfYear:[Int]?
    var _weeksOfYear:[Int]?
    var _monthsOfQuarter:[Int]?
    var _monthsOfHalfYear:[Int]?
    var _monthsOfYear:[Int]?
    var _quartersOfYear:[Int]?
    
    var _firstUsedDate:NSDate?
    var _lastUsedDate:NSDate?


    
    init (from:IsOccursContentDataSource) {
        original=from
        self.reoccurranceType=from.reoccurranceType
        self.dayOfMonth=from.dayOfMonth
        self.dayOfQuarter=from.dayOfQuarter
        self.dayOfHalfYear=from.dayOfHalfYear
        self.dayOfYear=from.dayOfYear
        self.firstDayOfMonth=from.firstDayOfMonth
        self.secondDayOfMonth=from.secondDayOfMonth
        self.weekday=from.weekday
        self.weekOfMonth=from.weekOfMonth
        self.weekOfQuarter=from.weekOfQuarter
        self.weekOfHalfYear=from.weekOfHalfYear
        self.weekOfYear=from.weekOfYear
        self.monthOfQuarter=from.monthOfQuarter
        self.monthOfHalfYear=from.monthOfHalfYear
        self.monthOfYear=from.monthOfYear
        self.intervalSize=from.intervalSize
        self.quarterOfYear=from.quarterOfYear
        
        self.daysOfMonth=from.daysOfMonth
        self.daysOfQuarter=from.daysOfQuarter
        self.weekdays=from.weekdays
        self.weeksOfMonth=from.weeksOfMonth
        self.weeksOfQuarter=from.weeksOfQuarter
        self.weeksOfHalfYear=from.weeksOfHalfYear
        self.weeksOfYear=from.weeksOfYear
        self.monthsOfQuarter=from.monthsOfQuarter
        self.monthsOfHalfYear=from.monthsOfHalfYear
        self.monthsOfYear=from.monthsOfYear
        
        self.firstUsedDate=from.firstUsedDate
        self.lastUsedDate=from.lastUsedDate
    }
    
    
}

extension ProposedReoccurrance:IsOccursContentDataSource {
    
    var reoccurranceType:ReoccurranceType? { get { return _reoccurranceType } set (aValue) { _reoccurranceType=aValue}}
    
    var dayOfMonth:Int? {
        get {
            var value:Int?
            if let v=_dayOfMonth {
                value=v
            } else {
                value=self.original.dayOfMonth
            }
            return value
        }
        set (aValue) {_dayOfMonth=aValue} }
    
    var dayOfQuarter:Int? {
        get {
            var value:Int?
            if let v=_dayOfQuarter {
                value=v
            } else {
                value=self.original.dayOfQuarter
            }
            return value
        } set (aValue) {_dayOfQuarter=aValue} }
    
    var dayOfHalfYear:Int? {
        get {
            var value:Int?
            if let v=_dayOfHalfYear {
                value=v
            } else {
                value=self.original.dayOfHalfYear
            }
            return value
        } set (aValue) {_dayOfHalfYear=aValue} }
    
    var dayOfYear:Int? {
        get {
            var value:Int?
            if let v=_dayOfYear {
                value=v
            } else {
                value=self.original.dayOfYear
            }
            return value
        } set (aValue) {_dayOfYear=aValue} }
    
    var firstDayOfMonth:Int? {
        get {
            var value:Int?
            if let v=_firstDayOfMonth {
                value=v
            } else {
                value=self.original.firstDayOfMonth
            }
            return value
        } set (aValue) {_firstDayOfMonth=aValue} }
    
    var secondDayOfMonth:Int? {
        get {
            var value:Int?
            if let v=_secondDayOfMonth {
                value=v
            } else {
                value=self.original.secondDayOfMonth
            }
            return value
        }
        set (aValue) {_secondDayOfMonth=aValue} }
    
    var weekday:Int? {
        get {
            var value:Int?
            if let v=_weekday {
                value=v
            } else {
                value=self.original.weekday
            }
            return value
        }
        set (aValue) {_weekday=aValue}
    }
    
    var weekOfMonth:Int?{
        get {
            var value:Int?
            if let v=_weekOfMonth {
                value=v
            } else {
                value=self.original.weekOfMonth
            }
            return value
        }
        
        set (aValue) {_weekOfMonth=aValue} }
    
    var weekOfQuarter:Int? {
        get {
            var value:Int?
            if let v=_weekOfQuarter {
                value=v
            } else {
                value=self.original.weekOfQuarter
            }
            return value
        }
        
        set (aValue) {_weekOfQuarter=aValue} }
    
    var weekOfHalfYear:Int? {
        get {
            var value:Int?
            if let v=_weekOfHalfYear {
                value=v
            } else {
                value=self.original.weekOfHalfYear
            }
            return value
        }
        
        set (aValue) {_weekOfHalfYear=aValue} }
    
    var weekOfYear:Int? {
        get {
            var value:Int?
            if let v=_weekOfYear {
                value=v
            } else {
                value=self.original.weekOfYear
            }
            return value
        }
        
        
        set (aValue) {_weekOfYear=aValue} }
    
    var monthOfQuarter:Int? {
        get {
            var value:Int?
            if let v=_monthOfQuarter {
                value=v
            } else {
                value=self.original.monthOfQuarter
            }
            return value
        }
        
        
        set (aValue) {_monthOfQuarter=aValue} }
    
    var monthOfHalfYear:Int? {
        get {
            var value:Int?
            if let v=_monthOfHalfYear {
                value=v
            } else {
                value=self.original.monthOfHalfYear
            }
            return value
        }
        
        
        set (aValue) {_monthOfHalfYear=aValue} }
    
    var monthOfYear:Int? {
        get {
            var value:Int?
            if let v=_monthOfYear {
                value=v
            } else {
                value=self.original.monthOfYear
            }
            return value
        }
        
        
        set (aValue) {_monthOfYear=aValue} }
    
    var quarterOfYear:Int? {
        get {
            var value:Int?
            if let v=_quarterOfYear {
                value=v
            } else {
                value=self.original.quarterOfYear
            }
            return value
        }
        
        
        set (aValue) {_quarterOfYear=aValue} }
    
    var intervalSize:Int? { get { return _intervalSize } set (aValue) {_intervalSize=aValue} }
    
    var year:Int? {
        get {
            var value:Int?
            if let v=_year {
                value=v
            } else {
                value=self.original.year
            }
            return value
        }
        
        
        set (aValue) {_quarterOfYear=aValue} }
    
    var daysOfMonth:[Int]? { get { return _daysOfMonth} set (aValue) {_daysOfMonth=aValue} }
    
    var daysOfQuarter:[Int]? { get { return _daysOfQuarter} set (aValue) {_daysOfQuarter=aValue} }
    
    var weekdays:[Int]? { get { return _weekdays} set (aValue) {_weekdays=aValue} }
    
    var weeksOfMonth:[Int]? { get { return _weeksOfMonth} set (aValue) {_weeksOfMonth=aValue} }
    
    var weeksOfQuarter:[Int]? { get { return _weeksOfQuarter} set (aValue) {_weeksOfQuarter=aValue} }
    
    var weeksOfHalfYear:[Int]? { get { return _weeksOfHalfYear} set (aValue) {_weeksOfHalfYear=aValue} }
    
    var weeksOfYear:[Int]? { get { return nil} set (aValue) {} }
    
    var monthsOfQuarter:[Int]? { get { return _monthsOfQuarter} set (aValue) {_monthsOfQuarter=aValue} }
    
    var monthsOfHalfYear:[Int]? { get { return _monthsOfHalfYear} set (aValue) {_monthsOfHalfYear=aValue} }
    
    var monthsOfYear:[Int]? { get { return _monthsOfYear} set (aValue) {_monthsOfYear=aValue} }
    
    var quartersOfYear:[Int]? { get { return _quartersOfYear} set (aValue) {_quartersOfYear=aValue} }
    
    var firstUsedDate:NSDate? { get { return _firstUsedDate} set (aValue) {_firstUsedDate=aValue} }
    
    var lastUsedDate:NSDate? { get { return _lastUsedDate} set (aValue) {_lastUsedDate=aValue} }
    
}
