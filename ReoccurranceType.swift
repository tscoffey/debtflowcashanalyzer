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
    
    Weekly, Monthly, Quarterly, SemiAnnually, Annually,
    SemiMonthly, FirstAndMiddleOfMonth, MiddleAndEndOfMonth,
    BiWeekly, BiMonthly,
    SelectedDaysOfWeek, SelectedDaysOfMonth, SelectedDaysOfQuarter,
    SelectedWeeksOfMonth, SelectedWeeksOfQuarter, SelectedWeeksOfSemiYear, SelectedWeeksOfYear,
    SelectedMonthsOfQuarter, SelectedMonthsOfSemiYear, SelectedMonthsOfYear,
    SelectedQuarterOfYear,
    OneTime
    
    func occursValueUsageTriple()->OccursValueUsageTriple {
        switch self {
        case .Weekly: return (.DayOfWeek, .Unused, .Unused)
        case .Monthly:return (.DayOfMonth, .Unused, .Unused)
        case .Quarterly: return (.MonthOfQuarter, .DayOfMonth, .Unused)
        case .SemiAnnually: return (.MonthOfHalfYear, .DayOfMonth, .Unused)
        case .Annually: return (.MonthOfYear, .DayOfMonth, .Unused)
        case .SemiMonthly: return (.DayOfMonth, .DayOfMonth, .Unused)
        case .FirstAndMiddleOfMonth: return (.Unused, .Unused, .Unused)
        case .MiddleAndEndOfMonth: return (.Unused, .Unused, .Unused)
        case .BiWeekly:return (.DayOfWeek, .Unused, .Unused)
        case .BiMonthly: return (.DayOfMonth, .Unused, .Unused)
        case .SelectedDaysOfWeek: return (.DayOfWeek, .Unused, .Unused)
        case .SelectedDaysOfMonth: return (.DayOfMonth, .Unused, .Unused)
        case .SelectedDaysOfQuarter: return (.DayOfQuarter, .Unused, .Unused)
        case .SelectedWeeksOfMonth: return (.WeekOfMonth, .DayOfWeek, .Unused)
        case .SelectedWeeksOfQuarter: return (.WeekOfQuarter, .DayOfWeek, .Unused)
        case .SelectedWeeksOfSemiYear: return (.WeekOfYear, .DayOfWeek, .Unused)
        case .SelectedWeeksOfYear: return (.WeekOfYear, .DayOfWeek, .Unused)
        case .SelectedMonthsOfQuarter: return (.MonthOfQuarter, .DayOfMonth, .Unused)
        case .SelectedMonthsOfSemiYear: return (.MonthOfHalfYear, .DayOfMonth, .Unused)
        case .SelectedMonthsOfYear: return (.MonthOfYear, .DayOfMonth, .Unused)
        case .SelectedQuarterOfYear: return (.QuarterOfYear, .MonthOfQuarter, .DayOfMonth)
        case .OneTime: return (.Unused, .Unused, .Unused)
        }
    }
    
    func occursChooserArray(with data:IsOccursContentDataSource) -> OccursSingleControlArray {
        var result:OccursSingleControlArray
        var needsStartingLabel=false
        
        switch self {
        case .Monthly:
            result=[OccursControlContentType.Every,
                    OccursControlContentType.EveryMonth,
//                    OccursControlContentType.OnTheDayOfMonth,
                    OccursControlContentType.DayOfMonthChooser,
                   ]
            needsStartingLabel=true
        case .Weekly:
            result=[OccursControlContentType.Every,
                    OccursControlContentType.EveryWeek,
                    OccursControlContentType.OnWeekday,
                    OccursControlContentType.WeekdayChooser,
            ]
            needsStartingLabel=true
        case .BiWeekly:
            result=[OccursControlContentType.EveryOther,
                    OccursControlContentType.EveryOtherWeek,
                    OccursControlContentType.OnWeekday,
                    OccursControlContentType.WeekdayChooser,

            ]
            needsStartingLabel=true
        case .BiMonthly:
            result=[OccursControlContentType.EveryOther,
                    OccursControlContentType.EveryOtherMonth,
//                    OccursControlContentType.OnTheDayOfMonth,
                    OccursControlContentType.DayOfMonthChooser,

            ]
            needsStartingLabel=true
        default: result=[]
        }
        if data.hasFirstOrLastUsedDates() {
            if needsStartingLabel { result.append(OccursControlContentType.startingLabel()) }
            if data.hasFirstUsedDate() {
                result.append(OccursControlContentType.StartingOn)
                result.append(OccursControlContentType.FirstDateChooser(type:.FullDate))
            } else {
                result.append(OccursControlContentType.StartingNow)
            }
            if data.hasLastUsedDate() {
                result.append(OccursControlContentType.EndingOn)
                result.append(OccursControlContentType.LastDateChooser(type: .FullDate))
            } else {
                result.append(OccursControlContentType.AndContinuing)
            }
        }

        return result
    }
    
//    func dateCalculator( values:[(Int32,Int32)], firstDate:NSDate?, lastDate:NSDate?, dateMitigation:SpendingDateMitigation)->IsReoccurringDateCalculator {
//        switch self {
//
//        }
//    }
    
    func generatesManyOccursValuesFromSingleDate() -> Bool {
        switch self {
        case .BiMonthly, .Quarterly, .SemiAnnually, .SemiMonthly: return true
        default: return false
        }
    }
    
    func reoccursEvery()->Bool {
        switch self {
        case .Weekly, .Monthly, .Quarterly,  .Annually: return true
        default: return false
        }
    }
    func reoccursEveryOther()->Bool {
        switch self {
        case .BiWeekly, .BiMonthly: return true
        default: return false
        }
    }
    func reoccursTwiceInAPeriod()->Bool {
        switch self {
        case .SemiMonthly, .SemiAnnually, .FirstAndMiddleOfMonth, .MiddleAndEndOfMonth: return true
        default: return false
        }
    }
    func reoccursSelectively()->Bool {
        switch self {
        case     .SelectedDaysOfWeek, .SelectedDaysOfMonth, .SelectedDaysOfQuarter,
                 .SelectedWeeksOfMonth, .SelectedWeeksOfQuarter, .SelectedWeeksOfSemiYear,
                 .SelectedWeeksOfYear,
                 .SelectedMonthsOfQuarter, .SelectedMonthsOfSemiYear, .SelectedMonthsOfYear,
                 .SelectedQuarterOfYear: return true
        default: return false
        }
    }
    func reoccursNever()->Bool {
        switch self {
        case .OneTime: return true
        default: return false
        }
    }
    

}
