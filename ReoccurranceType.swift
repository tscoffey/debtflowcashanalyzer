//
//  ReoccurranceType.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 4/7/16.
//  Copyright © 2016 Coffey. All rights reserved.
//

import Foundation

enum ReoccurranceType:Int32 {
    
    case
    
    weekly, monthly, quarterly, semiAnnually, annually,
    semiMonthly, firstAndMiddleOfMonth, middleAndEndOfMonth,
    biWeekly, biMonthly,
    selectedDaysOfWeek, selectedDaysOfMonth, selectedDaysOfQuarter,
    selectedWeeksOfMonth, selectedWeeksOfQuarter, selectedWeeksOfSemiYear, selectedWeeksOfYear,
    selectedMonthsOfQuarter, selectedMonthsOfSemiYear, selectedMonthsOfYear,
    selectedQuarterOfYear,
    oneTime
    
    func occursValueUsageTriple()->OccursValueUsageTriple {
        switch self {
        case .weekly: return (.dayOfWeek, .unused, .unused)
        case .monthly:return (.dayOfMonth, .unused, .unused)
        case .quarterly: return (.monthOfQuarter, .dayOfMonth, .unused)
        case .semiAnnually: return (.monthOfHalfYear, .dayOfMonth, .unused)
        case .annually: return (.monthOfYear, .dayOfMonth, .unused)
        case .semiMonthly: return (.dayOfMonth, .dayOfMonth, .unused)
        case .firstAndMiddleOfMonth: return (.unused, .unused, .unused)
        case .middleAndEndOfMonth: return (.unused, .unused, .unused)
        case .biWeekly:return (.dayOfWeek, .unused, .unused)
        case .biMonthly: return (.dayOfMonth, .unused, .unused)
        case .selectedDaysOfWeek: return (.dayOfWeek, .unused, .unused)
        case .selectedDaysOfMonth: return (.dayOfMonth, .unused, .unused)
        case .selectedDaysOfQuarter: return (.dayOfQuarter, .unused, .unused)
        case .selectedWeeksOfMonth: return (.weekOfMonth, .dayOfWeek, .unused)
        case .selectedWeeksOfQuarter: return (.weekOfQuarter, .dayOfWeek, .unused)
        case .selectedWeeksOfSemiYear: return (.weekOfYear, .dayOfWeek, .unused)
        case .selectedWeeksOfYear: return (.weekOfYear, .dayOfWeek, .unused)
        case .selectedMonthsOfQuarter: return (.monthOfQuarter, .dayOfMonth, .unused)
        case .selectedMonthsOfSemiYear: return (.monthOfHalfYear, .dayOfMonth, .unused)
        case .selectedMonthsOfYear: return (.monthOfYear, .dayOfMonth, .unused)
        case .selectedQuarterOfYear: return (.quarterOfYear, .monthOfQuarter, .dayOfMonth)
        case .oneTime: return (.unused, .unused, .unused)
        }
    }
    
    func occursChooserArray(with data:IsOccursContentDataSource) -> OccursSingleControlArray {
        return []
    }
    
//    func dateCalculator( values:[(Int32,Int32)], firstDate:NSDate?, lastDate:NSDate?, dateMitigation:SpendingDateMitigation)->IsReoccurringDateCalculator {
//        switch self {
//
//        }
//    }
    
    func generatesManyOccursValuesFromSingleDate() -> Bool {
        switch self {
        case .biMonthly, .quarterly, .semiAnnually, .semiMonthly: return true
        default: return false
        }
    }
    
    func reoccursEvery()->Bool {
        switch self {
        case .weekly, .monthly, .quarterly,  .annually: return true
        default: return false
        }
    }
    func reoccursEveryOther()->Bool {
        switch self {
        case .biWeekly, .biMonthly: return true
        default: return false
        }
    }
    func reoccursTwiceInAPeriod()->Bool {
        switch self {
        case .semiMonthly, .semiAnnually, .firstAndMiddleOfMonth, .middleAndEndOfMonth: return true
        default: return false
        }
    }
    func reoccursSelectively()->Bool {
        switch self {
        case     .selectedDaysOfWeek, .selectedDaysOfMonth, .selectedDaysOfQuarter,
                 .selectedWeeksOfMonth, .selectedWeeksOfQuarter, .selectedWeeksOfSemiYear,
                 .selectedWeeksOfYear,
                 .selectedMonthsOfQuarter, .selectedMonthsOfSemiYear, .selectedMonthsOfYear,
                 .selectedQuarterOfYear: return true
        default: return false
        }
    }
    func reoccursNever()->Bool {
        switch self {
        case .oneTime: return true
        default: return false
        }
    }
    

}
