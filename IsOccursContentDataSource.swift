//
//  IsOccursContentDataDataSource.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 5/25/16.
//  Copyright © 2016 Coffey. All rights reserved.
//

import Foundation

protocol IsOccursContentDataSource {
    
    var reoccurranceType:ReoccurranceType? { get set }
    
    var dayOfMonth:Int? { get set }
    var dayOfQuarter:Int? { get set }
    var dayOfHalfYear:Int? { get set }
    var dayOfYear:Int? { get set }
    var firstDayOfMonth:Int? { get set }
    var secondDayOfMonth:Int? { get set}
    var weekday:Int? { get set}
    var weekOfMonth:Int? { get set}
    var weekOfQuarter:Int? { get set}
    var weekOfHalfYear:Int? { get set}
    var weekOfYear:Int? { get set}
    var monthOfQuarter:Int? { get set}
    var monthOfHalfYear:Int? { get set}
    var monthOfYear:Int? { get set}
    var quarterOfYear:Int? { get set}
    var intervalSize:Int? { get set }

    var daysOfMonth:[Int]? { get set}
    var daysOfQuarter:[Int]? { get set}
    var weekdays:[Int]? { get set}
    var weeksOfMonth:[Int]? { get set}
    var weeksOfQuarter:[Int]? { get set}
    var weeksOfHalfYear:[Int]? { get }
    var weeksOfYear:[Int]? { get set}
    var monthsOfQuarter:[Int]? { get set}
    var monthsOfHalfYear:[Int]? { get set}
    var monthsOfYear:[Int]? { get set}
    var quartersOfYear:[Int]? { get set}
    
    var year:Int? { get set }
    
    var firstUsedDate:Date? { get set}
    var lastUsedDate:Date? { get set}
    
    func hasFirstUsedDate()->Bool
    func hasLastUsedDate()->Bool
    func hasFirstOrLastUsedDates()->Bool
    
    func isEmpty() ->Bool
    func isSingle()->Bool
    func isMultiple()->Bool
    
    func hasDay()->Bool
    func hasWeekday()->Bool
    func hasWeek()->Bool
    func hasMonth()->Bool
    func hasQuarter()->Bool
    func hasDays()->Bool
    func hasWeeks()->Bool
    func hasMonths()->Bool
    func hasQuarters()->Bool
    
}

extension IsOccursContentDataSource {
    
    var reoccurranceType:ReoccurranceType? { get { return nil} set (aValue) { } }
    
    var dayOfMonth:Int? { get { return nil} set (aValue) {} }
    var dayOfQuarter:Int? { get { return nil} set (aValue) {} }
    var dayOfHalfYear:Int? { get { return nil} set (aValue) {} }
    var dayOfYear:Int? { get { return nil} set (aValue) {} }
    var firstDayOfMonth:Int? { get { return nil} set (aValue) {} }
    var secondDayOfMonth:Int? { get { return nil} set (aValue) {} }
    var weekday:Int? { get { return nil} set (aValue) {} }
    var weekOfMonth:Int? { get { return nil} set (aValue) {} }
    var weekOfQuarter:Int? { get { return nil} set (aValue) {} }
    var weekOfHalfYear:Int? { get { return nil} set (aValue) {} }
    var weekOfYear:Int? { get { return nil} set (aValue) {} }
    var monthOfQuarter:Int? { get { return nil} set (aValue) {} }
    var monthOfHalfYear:Int? { get { return nil} set (aValue) {} }
    var monthOfYear:Int? { get { return nil} set (aValue) {} }
    var quarterOfYear:Int? { get { return nil} set (aValue) {} }
    var intervalSize:Int? { get { return nil } set (aValue) {} }
    
    var daysOfMonth:[Int]? { get { return nil} set (aValue) {} }
    var daysOfQuarter:[Int]? { get { return nil} set (aValue) {} }
    var weekdays:[Int]? { get { return nil} set (aValue) {} }
    var weeksOfMonth:[Int]? { get { return nil} set (aValue) {} }
    var weeksOfQuarter:[Int]? { get { return nil} set (aValue) {} }
    var weeksOfHalfYear:[Int]? { get { return nil} set (aValue) {} }
    var weeksOfYear:[Int]? { get { return nil} set (aValue) {} }
    var monthsOfQuarter:[Int]? { get { return nil} set (aValue) {} }
    var monthsOfHalfYear:[Int]? { get { return nil} set (aValue) {} }
    var monthsOfYear:[Int]? { get { return nil} set (aValue) {} }
    var quartersOfYear:[Int]? { get { return nil} set (aValue) {} }
    
    var year:[Int]? { get { return nil} set (aValue) {} }
    
    var firstUsedDate:Date? { get { return nil} set (aValue) {} }
    var lastUsedDate:Date? { get { return nil} set (aValue) {} }
    
    func hasFirstUsedDate()->Bool { if self.firstUsedDate == nil { return false } else { return true } }
    func hasLastUsedDate()->Bool { if self.lastUsedDate == nil { return false } else { return true }}
    func hasFirstOrLastUsedDates()->Bool { if self.hasFirstUsedDate() || self.hasLastUsedDate() { return true } else { return false }}
    
    func isEmpty()->Bool { return false }
    func isSingle()->Bool { return true }
    func isMultiple()->Bool { return false }
    
    func hasDay()->Bool {
        if self.isSingle() {
            if self.dayOfMonth != nil || self.dayOfQuarter != nil || self.dayOfHalfYear != nil || self.dayOfYear != nil {
                return true
            }
        }
        return false
    }
    func hasWeekday()->Bool {
        if self.isSingle() {
            if self.weekday != nil  {
                return true
            }
        }
        return false
    }
    func hasWeek()->Bool {
        if self.isSingle() {
            if self.weekOfMonth != nil || self.weekOfQuarter != nil || self.weekOfHalfYear != nil || self.weekOfYear != nil {
                return true
            }
        }
        return false
    }
    func hasMonth()->Bool {
        if self.isSingle() {
            if self.monthOfQuarter != nil || self.monthOfHalfYear != nil || self.monthOfYear != nil {
                return true
            }
        }
        return false
    }
    func hasQuarter()->Bool {
        if self.isSingle() {
            if self.quarterOfYear != nil  {
                return true
            }
        }
        return false
    }
    
    func hasDays()->Bool { return false }
    func hasWeeks()->Bool { return false }
    func hasMonths()->Bool { return false }
    func hasQuarters()->Bool { return false }

    
    
}

