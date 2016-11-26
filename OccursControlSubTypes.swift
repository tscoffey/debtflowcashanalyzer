//
//  OccursControlSubTypes.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 5/20/16.
//  Copyright ) 2016 Coffey. All rights reserved.
//

import Foundation
import UIKit

enum OccursControlSubType {
    case
    contentTypePicker,
    dayOfMonthPicker,
    firstDayOfMonthPicker,
    secondDayOfMonthPicker,
    weekdayPicker,
    weekNumberOfMonthPicker,
    weekNumberOfQuarterPicker,
    weekNumberOfHalfYearPicker,
    weekNumberOfYearPicker,
    monthNumberOfQuarterPicker,
    monthNumberOfHalfYearPicker,
    monthNumberOfYearPicker,
    quarterOfYearPicker,
    yearPicker,
    datePicker(type:DateChooserType),
    staticLabel
    
    func isEqualTo(_ other:OccursControlSubType)->Bool {
        switch self {
        case .dayOfMonthPicker: if case .dayOfMonthPicker = other { return true }
        case .weekdayPicker: if case .weekdayPicker = other { return true }
        case .weekNumberOfMonthPicker: if case .weekNumberOfMonthPicker = other { return true }
        case .weekNumberOfQuarterPicker: if case .weekNumberOfQuarterPicker = other { return true }
        case .weekNumberOfHalfYearPicker: if case .weekNumberOfHalfYearPicker = other { return true }
        case .weekNumberOfYearPicker: if case .weekNumberOfYearPicker = other { return true }
        case .monthNumberOfQuarterPicker: if case .monthNumberOfQuarterPicker = other { return true }
        case .monthNumberOfHalfYearPicker: if case .monthNumberOfHalfYearPicker = other { return true }
        case .monthNumberOfYearPicker: if case .monthNumberOfYearPicker = other { return true }
        case .quarterOfYearPicker: if case .quarterOfYearPicker = other { return true }
        case .yearPicker: if case .yearPicker = other { return true }
        case .datePicker:if case .datePicker = other { return true }
        default: break
        }
        return false
    }
    
    func buildChoicesProvider(_ contentType:OccursControlContentType)->IsChoiceProvider {
        switch self {
        case .dayOfMonthPicker: return DayOfMonthChoicesProvider(contentType:contentType)
        case .weekdayPicker: return WeekdayChoicesProvider(contentType:contentType)
        case .weekNumberOfMonthPicker: return WeekNumberOfMonthChoicesProvider(contentType:contentType)
        case .weekNumberOfQuarterPicker: return WeekNumberOfQuarterChoicesProvider(contentType:contentType)
        case .weekNumberOfHalfYearPicker: return WeekNumberOfHalfYearChoicesProvider(contentType:contentType)
        case .weekNumberOfYearPicker: return WeekNumberOfYearChoicesProvider(contentType:contentType)
        case .monthNumberOfQuarterPicker: return MonthOfQuarterChoicesProvider(contentType:contentType)
        case .monthNumberOfHalfYearPicker: return MonthOfHalfYearChoicesProvider(contentType:contentType)
        case .monthNumberOfYearPicker: return MonthNumberOfYearChoicesProvider(contentType:contentType)
        case .quarterOfYearPicker: return QuarterChoicesProvider(contentType:contentType)
        case .yearPicker: return YearChoicesProvider(contentType:contentType)
        case .datePicker:return DateChoiceProvider(contentType:contentType)
        default: return OccursChoicesProvider(contentType: contentType, choice: nil, delegate: nil)
        }
    }
    

    
    func buildSubController(_ style:SubControllerStyle,
                            order:Int,
                            withinView:UIView,
                            relativeTo:OccursSubController?,
                            format:ControlPresentationFormat,
                            choicesProvider:IsChoiceProvider?,
                            dateChooserType:DateChooserType?,
                            dateChoices:IsOccursContentDataSource?) -> OccursSubController? {
        switch self {
        case .dayOfMonthPicker: return DayOfMonthChooserSubController(purpose: self, style: style, order: order, withinView: withinView, relativeTo: relativeTo, format: format, choicesProvider: choicesProvider)
        case .weekdayPicker: return WeekdayChooserSubController(purpose: self, style: style, order: order, withinView: withinView, relativeTo: relativeTo, format: format, choicesProvider: choicesProvider)
        case .weekNumberOfMonthPicker: return WeekOfMonthChooserSubController(purpose: self, style: style, order: order, withinView: withinView, relativeTo: relativeTo, format: format, choicesProvider: choicesProvider)
        case .weekNumberOfQuarterPicker: return WeekOfQuarterChooserSubController(purpose: self, style: style, order: order, withinView: withinView, relativeTo: relativeTo, format: format, choicesProvider: choicesProvider)
        case .weekNumberOfHalfYearPicker: return WeekOfHalfYearChooserSubController(purpose: self, style: style, order: order, withinView: withinView, relativeTo: relativeTo, format: format, choicesProvider: choicesProvider)
        case .weekNumberOfYearPicker: return WeekOfYearChooserSubController(purpose: self, style: style, order: order, withinView: withinView, relativeTo: relativeTo, format: format, choicesProvider: choicesProvider)
        case .monthNumberOfQuarterPicker: return MonthNumberOfQuarterChooserSubController(purpose: self, style: style, order: order, withinView: withinView, relativeTo: relativeTo, format: format, choicesProvider: choicesProvider)
        case .monthNumberOfHalfYearPicker: return MonthNumberOfHalfYearChooserSubController(purpose: self, style: style, order: order, withinView: withinView, relativeTo: relativeTo, format: format, choicesProvider: choicesProvider)
        case .monthNumberOfYearPicker: return MonthNumberOfYearChooserSubController(purpose: self, style: style, order: order, withinView: withinView, relativeTo: relativeTo, format: format, choicesProvider: choicesProvider)
        case .quarterOfYearPicker: return QuarterOfYearChooserSubController(purpose: self, style: style, order: order, withinView: withinView, relativeTo: relativeTo, format: format, choicesProvider: choicesProvider)
        case .yearPicker: return YearChooserSubController(purpose: self, style: style, order: order, withinView: withinView, relativeTo: relativeTo, format: format, choicesProvider: choicesProvider)
        case .datePicker:return DateChooserSubController(dateChooser: dateChooserType!, purpose: self, style: style, order: order, withinView: withinView, relativeTo: relativeTo, format: format, choicesProvider: choicesProvider, dateChoices: dateChoices!)
        default:break
        }
        return nil
        
    }
    
    func isContentTypePicker()->Bool {
        switch self {
        case .contentTypePicker: return true
        default:return false
        }
    }
    func isDatePicker()->Bool {
        switch self {
        case .datePicker: return true
        default:return false
        }
    }
    func isLabel()->Bool {
        switch self {
        case .staticLabel: return true
        default:return false
        }
    }
    func dateChooserType()->DateChooserType? {
        switch self {
        case .datePicker(let t): return t
        default:break
        }
        return nil
    }

}

typealias OccursSingleControlArray = [ OccursControlContentType ]
typealias OccursMultipleControlsArray = [ OccursSingleControlArray ]

enum OccursControlContentType {
    case
    generalCategories,
    every,
    everyMonth,
    everyWeek,
    everyOther,
    everyOtherWeek,
    everyOtherMonth,
    everyQuarter,
    everyYear,
    
    twiceA,
    twiceAMonth,
    twiceAMonthSelectDays,
    twiceAMonthSelectFirstDay,
    twiceAMonthSelectSecondDay,
    twiceAMonthFirstAndMiddleStarting,
    twiceAMonthMiddleAndEndStarting,
    twiceAYear,
    
    onSelected,
    onSelectedDays,
    onSelectedDaysOfTheWeek,
    onSelectedDaysOfTheMonth,
    onSelectedWeeks,
    onSelectedWeeksOfTheMonth,
    onSelectedWeeksOfTheQuarter,
    onSelectedWeeksOfTheHalfYear,
    onSelectedWeeksYear,
    onSelectedMonths,
    onSelectedMonthsOfTheQuarter,
    onSelectedMonthsOfTheHalfYear,
    onSelectedMonthsOfTheYear,
    onSelectedQuarters,
    
    onceOn,
    
    onDayOfTheMonthStarting,
    onWeekdayStarting,
    inTheMonthOfQuarterOnTheDayStarting,
    inTheMonthOfQuarter,
    firstMonthOfQuarter,
    secondMonthOfQuarter,
    thirdMonthOfQuarter,
    inTheMonthOfYear,
    inTheMonthOfYearAndDay,
    
    
    
    
    // starting and ending date chooser types
    starting,
    startingNow,
    startingNowOrOn,
    startingNowOrOnFullDate,
    startingNowOrOnMonthYear,
    startingNowOrOnQuarterYear,
    startingNowOrOnYear,
    startingNowEndingOn,
    startingNowEndingOnFullDate,
    startingNowEndingOnMonthYear,
    startingNowEndingOnQuarterYear,
    startingNowEndingOnYear,
    
    startingOn,
    startingOnFullDate(label:String),
    startingOnMonthYear(label:String),
    startingOnQuarterYear(label:String),
    startingOnYear(label:String),
    
    
    andContinuing,
    andContinuingOrEndingOn,
    andContinuingOrEndingOnFullDate,
    andContinuingOrEndingOnMonthYear,
    andContinuingOrEndingOnQuarterYear,
    andContinuingOrEndingOnYear,
    
    endingOn,
    endingOnFullDate,
    endingOnMonthYear,
    endingOnQuarterYear,
    endingOnYear,
    
    
    // value choosers
    
    
    dayOfMonthChooser(value:Int?),
    firstDayInMonthChooser(value:Int?),
    secondDayInMonthChooser(value:Int?),
    weekdayChooser(value:Int?),
    weekNumberOfMonthChooser(value:Int?),
    weekNumberOfQuarterChooser(value:Int?),
    weekNumberOfHalfYearChooser(value:Int?),
    weekNumberOfYearChooser(weekNumber:Int?),
    monthNumberOfQuarterChooser(value:Int?),
    monthNumberOfHalfYearChooser(value:Int?),
    monthNumberOfYearChooser(value:Int?),
    quarterOfYearChooser(value:Int?),
    yearChooser(value:Int?),
    firstDateChooser(type:DateChooserType, value:Date?),
    lastDateChooser(type:DateChooserType, value:Date?),
    
    
    // labels
    
    anyLabel(label:String),
    unused
    
    
    
    func epilogFirstLastDateControls(_ label:String?, dateChooser:DateChooserType) -> OccursMultipleControlsArray {
        var result=OccursMultipleControlsArray()
        if let l=label {
            result.append([.anyLabel(label: l)])
        }
        result.append( [ .firstDateChooser(type: dateChooser, value:nil) ] )
        result.append(contentsOf: self.epilogLastDateControls(dateChooser))
        return result
    }
    func epilogLastDateControls(_ dateChooser:DateChooserType) -> OccursMultipleControlsArray {
        var result=OccursMultipleControlsArray()
        var endingType:OccursControlContentType
        switch dateChooser {
        case .fullDate: endingType = .andContinuingOrEndingOnFullDate
        case .monthAndYearOnly: endingType = .andContinuingOrEndingOnMonthYear
        case .quarterAndYearOnly: endingType = .andContinuingOrEndingOnQuarterYear
        case .yearOnly: endingType = .andContinuingOrEndingOnYear
        default: break
        }
        result.append( [ .anyLabel(label: "And continuing")] )
        result.append( [ endingType])
        return result
    }
    
    func nextOccursControls()-> OccursMultipleControlsArray {
        
        var result:OccursSingleControlArray?
        var result2:OccursMultipleControlsArray?
        
        switch self {
            
        case .generalCategories: result =  [.every , .twiceA ]
            
        case .every: result = [.everyMonth , .everyWeek, .everyOther, .everyQuarter ]
        case .everyMonth: result = [ .onDayOfTheMonthStarting, .startingOnFullDate(label:"Starting on")]
        case .everyWeek: result = [ .onWeekdayStarting, .startingOnFullDate(label:"Starting on")]
        case .everyQuarter: result = [ .inTheMonthOfQuarterOnTheDayStarting, .startingOnFullDate(label:"Starting on")]
            
        case .everyOther: result = [ .everyOtherMonth, .everyOtherWeek]
        case .everyOtherMonth: result = [ .onDayOfTheMonthStarting, .startingOnFullDate(label:"Starting on")]
        case .everyOtherWeek: result = [ .onWeekdayStarting, .startingOnFullDate(label:"Starting on")]
            
        case .twiceA:  result = [ .twiceAMonth, .twiceAYear ]
        case .twiceAMonth: result = [ .twiceAMonthFirstAndMiddleStarting,
                                      .twiceAMonthMiddleAndEndStarting,
                                      .twiceAMonthSelectDays]
        case .twiceAMonthFirstAndMiddleStarting, .twiceAMonthMiddleAndEndStarting:
            result2 = [
                [ .anyLabel(label:"Starting")],
                [.startingNowOrOnMonthYear]
            ]
        case .twiceAMonthSelectDays: result2 = [
            [.anyLabel(label:"On the")],
            [.dayOfMonthChooser(value:nil)],
            [.anyLabel(label:"And the")],
            [.dayOfMonthChooser(value:nil)],
            [.anyLabel(label:"Starting")],
            [.startingNowOrOnMonthYear]
            ]
            
        case .onDayOfTheMonthStarting: result2 = [ [.dayOfMonthChooser(value:nil)],
                                                   [ .anyLabel(label:"Of the month")],
                                                   [ .anyLabel(label:"Starting")],
                                                   [.startingNowOrOnMonthYear]
            ]
        case .onWeekdayStarting: result2 = [ [.weekdayChooser(value:nil)],
                                             [ .anyLabel(label:"Starting")],
                                             [.startingNowOrOnFullDate]
            ]
        case .inTheMonthOfQuarterOnTheDayStarting:
                result2 = [ [.anyLabel(label: "Month of quarter")],
                           [.monthNumberOfQuarterChooser(value:nil)],
                           [.anyLabel(label: "On the")],
                           [.dayOfMonthChooser(value:nil)],
                           [ .anyLabel(label:"Of the month")],
                           [ .anyLabel(label:"Starting")],
                           [.startingNowOrOnQuarterYear]
                ]
            
            
        case .startingNowOrOnFullDate: result = [ .startingNowEndingOnFullDate, .startingOnFullDate(label:"On date") ]
        case .startingNowOrOnMonthYear: result = [ .startingNowEndingOnMonthYear, .startingOnMonthYear(label:"On month") ]
        case .startingNowOrOnQuarterYear: result = [ .startingNowEndingOnQuarterYear, .startingOnQuarterYear(label:"On quarter") ]
            
        case .startingOnFullDate: result2 = self.epilogFirstLastDateControls(nil,dateChooser:.fullDate)
        case .startingOnMonthYear: result2 = self.epilogFirstLastDateControls(nil,dateChooser:.monthAndYearOnly)
        case .startingOnQuarterYear: result2 = self.epilogFirstLastDateControls(nil,dateChooser:.quarterAndYearOnly)
        case .startingNowEndingOnFullDate: result2 = self.epilogLastDateControls(.fullDate)
            
        case .startingNowEndingOnMonthYear: result2 = self.epilogLastDateControls(.monthAndYearOnly)
        case .startingNowEndingOnQuarterYear: result2 = self.epilogLastDateControls(.quarterAndYearOnly)
        
            
        case .andContinuingOrEndingOnFullDate:
            result = [ .andContinuing,
                       .lastDateChooser(type: DateChooserType.fullDate, value:nil) ]
        case .andContinuingOrEndingOnMonthYear:
            result = [ .andContinuing,
                       .lastDateChooser(type: DateChooserType.monthAndYearOnly, value:nil) ]
            
        case .andContinuingOrEndingOnQuarterYear:
            result = [ .andContinuing,
                       .lastDateChooser(type: DateChooserType.quarterAndYearOnly, value:nil) ]
            
        default: return []
        }
        if let r=result {
            result2=[r]
        }
        return result2!
    }
    
    func textLabel()->String {
        var result:String
        switch self {
            
        case .every: result="Every"
        case .everyOther: result="Other"
        case .everyMonth, .everyOtherMonth, .twiceAMonth: result="Month"
        case .everyWeek, .everyOtherWeek: result="Week"
        case .everyQuarter: result="Quarter"
        case .twiceAYear: result="Year"
            
        case .twiceA: result="Twice a"
        case .twiceAMonthFirstAndMiddleStarting: result="First+Middle"
        case .twiceAMonthMiddleAndEndStarting: result="Middle+End"
        case .twiceAMonthSelectDays: result = "On days"
            
        case .startingNow,
             .startingNowEndingOnFullDate,
             .startingNowEndingOnMonthYear,
             .startingNowEndingOnQuarterYear,
             .startingNowEndingOnYear: result="Now"
            
        case .startingOnFullDate(let l): result = l
        case .startingOnMonthYear(let l): result = l
        case .startingOnQuarterYear(let l): result = l
            
        case .onWeekdayStarting: result = "On"
            
        case .onDayOfTheMonthStarting: result = "On the"
        case .inTheMonthOfQuarterOnTheDayStarting: result="Month+Day"
            
        case .andContinuing: result = "Indefinitely"
            
        case .anyLabel (let l):result = l
            
        case .lastDateChooser: result = "Until"
            
        case .unused:
            result = "???"
            
        default: result="<>"
        }
        return result
    }
    
    func isCategoryItem()->Bool {
        var result:Bool
        switch self {
        case    .dayOfMonthChooser,
                .firstDayInMonthChooser,
                .secondDayInMonthChooser: result=false
            
        case    .weekdayChooser,
                .weekNumberOfMonthChooser,
                .weekNumberOfQuarterChooser,
                .weekNumberOfHalfYearChooser,
                .weekNumberOfYearChooser : result=false
            
        case    .monthNumberOfQuarterChooser,
                .monthNumberOfHalfYearChooser,
                .monthNumberOfYearChooser: result=false
            
        case    .quarterOfYearChooser: result = false
        case    .yearChooser: result=false
            
        case    .firstDateChooser,.lastDateChooser: result=false
        case    .anyLabel: result=false
            
        default:result=true
        }
        return result
    }
    
    func isLabel() -> Bool {
        var result:Bool
        switch self {
        case    .anyLabel: result=true
        default:result=false
        }
        return result
    }
    
    func isChooser() -> Bool {

        if self.isLabel() { return false }
        if self.isCategoryItem() { return false }
        return true
    }
    
    func isNumberChooser() -> Bool {

        if self.isChooser() {
            if self.isDateChooser() {
                return false
            } else {
                return true
            }
        } else {
            return false
        }
    }
    
    func isDayOfMonthChooser() -> Bool {
        var result:Bool
        switch self {
        case    .dayOfMonthChooser: result=true
        case    .firstDayInMonthChooser: result=true
        case    .secondDayInMonthChooser: result=true
        default: result=false
        }
        return result
    }
    func isFirstDayInMonthChooser() ->Bool {
        if case .firstDayInMonthChooser = self { return true }
        return false
    }
    func isSecondDayInMonthChooser() ->Bool {
        if case .secondDayInMonthChooser = self { return true }
        return false
    }
    
    func isMonthNumberChooser() ->Bool {
        var result:Bool
        switch self {
        case    .monthNumberOfQuarterChooser, .monthNumberOfHalfYearChooser, .monthNumberOfYearChooser: result=true
        default: result=false
        }
        return result
    }
    func isMonthNumberOfQuarterChooser() ->Bool {
        if case .monthNumberOfQuarterChooser = self { return true }
        return false
    }
    func isMonthNumberOfHalfYearChooser() ->Bool {
        if case .monthNumberOfHalfYearChooser = self { return true }
        return false
    }
    func isMonthOfYearChooser() ->Bool {
        if case .monthNumberOfYearChooser = self { return true }
        return false
    }
    
    func isWeekdayChooser()->Bool {
        if case .weekdayChooser = self { return true }
        return false
    }
    
    func isWeekNumberChooser()->Bool {
        var result:Bool
        switch self {
        case .weekNumberOfMonthChooser, .weekNumberOfQuarterChooser, .weekNumberOfHalfYearChooser, .weekNumberOfYearChooser: result=true
        default:result=false
        }
        return result
    }
    func isWeekNumberOfMonthChooser() ->Bool {
        if case .weekNumberOfMonthChooser = self { return true }
        return false
    }
    func isWeekNumberOfQuarterChooser() ->Bool {
        if case .weekNumberOfQuarterChooser = self { return true }
        return false
    }
    func isWeekNumberOfHalfYearChooser() ->Bool {
        if case .weekNumberOfHalfYearChooser = self { return true }
        return false
    }
    func isWeekNumberOfYearChooser() ->Bool {
        if case .weekNumberOfYearChooser = self { return true }
        return false
    }

    func isQuarterOfYearChooser()->Bool {
        if case .quarterOfYearChooser = self { return true }
        return false
    }
    func isYearChooser()->Bool {
        if case .yearChooser = self { return true }
        return false
    }

    
    func isDateChooser()->Bool {
        var result:Bool
        switch self {
        case .firstDateChooser:result=true
        case .lastDateChooser:result=true
        default:result=false
            
        }
        return result
    }
    
    func isFirstDateChooser() -> Bool {
            switch self {
            case .firstDateChooser:return true
            default:return false
                
            }
    }
    func isLastDateChooser() -> Bool {
            switch self {
            case .lastDateChooser:return true
            default:return false
                
            }
    }

    
    func reoccurranceType()->ReoccurranceType? {
        var result:ReoccurranceType?=nil
        if self.isCategoryItem() {
            switch self {
                
                
            case .everyMonth: result=ReoccurranceType.monthly
                
            case .everyWeek: result=ReoccurranceType.weekly
                
                
            case .everyOtherWeek: result=ReoccurranceType.biWeekly
                
            case .everyOtherMonth: result=ReoccurranceType.biMonthly
                
            case .everyQuarter: result=ReoccurranceType.quarterly
                
            case .everyYear: result=ReoccurranceType.annually
                
                
            case .twiceAMonthSelectDays: result=ReoccurranceType.selectedDaysOfMonth
                
                
            case .twiceAMonthFirstAndMiddleStarting: result=ReoccurranceType.firstAndMiddleOfMonth
                
            case .twiceAMonthMiddleAndEndStarting: result=ReoccurranceType.middleAndEndOfMonth
                
            case .twiceAYear: result=ReoccurranceType.semiAnnually
            case .onSelectedDaysOfTheWeek: result=ReoccurranceType.selectedDaysOfWeek
            case .onSelectedDaysOfTheMonth: result=ReoccurranceType.selectedDaysOfMonth
            case .onSelectedWeeksOfTheMonth: result=ReoccurranceType.selectedWeeksOfMonth
            case .onSelectedWeeksOfTheQuarter: result=ReoccurranceType.selectedWeeksOfQuarter
            case .onSelectedWeeksOfTheHalfYear: result=ReoccurranceType.selectedWeeksOfSemiYear
            case .onSelectedWeeksYear: result=ReoccurranceType.selectedWeeksOfYear
                
            case .onSelectedMonthsOfTheQuarter: result=ReoccurranceType.selectedMonthsOfQuarter
            case .onSelectedMonthsOfTheHalfYear: result=ReoccurranceType.selectedMonthsOfSemiYear
            case .onSelectedMonthsOfTheYear: result=ReoccurranceType.selectedMonthsOfYear
            case .onSelectedQuarters: result=ReoccurranceType.selectedQuarterOfYear
            case .onceOn: result=ReoccurranceType.oneTime
                
                
            default: result=nil
            }
            
            
        } else {
            result=nil
        }
        return result
    }
    
    func applyContentType(_ value:OccursControlContentType?, into:IsOccursContentDataSource?) {
        var into = into
        if self.isCategoryItem() {
            into?.reoccurranceType=value?.reoccurranceType()
        }
    }
    
    func numberValueChosen()-> Int? {
        var result:Int?=nil
        if self.isNumberChooser() {
            switch self {
            case .dayOfMonthChooser( let v): result=v
            case .firstDayInMonthChooser( let v): result=v
            case .secondDayInMonthChooser( let v): result=v
            case .weekdayChooser( let v): result=v
            case .monthNumberOfQuarterChooser( let v): result=v
            case .monthNumberOfYearChooser( let v): result=v
            default: break
            }
        }
        return result
    }
    
    func applyNumberValue(_ value:Int?, into:IsOccursContentDataSource?) -> OccursControlContentType {
        var into = into
        var new:OccursControlContentType=OccursControlContentType.dayOfMonthChooser(value: nil)
        if self.isNumberChooser() {
            switch self {
            case .dayOfMonthChooser:
                into?.dayOfMonth=value
                new = .dayOfMonthChooser(value: value)
            case .firstDayInMonthChooser:
                into?.firstDayOfMonth=value
                new = .firstDayInMonthChooser(value: value)
            case .secondDayInMonthChooser:
                into?.secondDayOfMonth=value
                new = .secondDayInMonthChooser(value: value)
            case .weekdayChooser:
                into?.weekday=value
                new = .weekdayChooser(value: value)
            case .monthNumberOfQuarterChooser:
                into?.monthOfQuarter=value
                new = .monthNumberOfQuarterChooser(value: value)
            case .monthNumberOfYearChooser:
                into?.monthOfYear=value
                new = .monthNumberOfYearChooser(value: value)
            case .quarterOfYearChooser:
                into?.quarterOfYear=value
                new = .quarterOfYearChooser(value: value)
            case .yearChooser:
                into?.year=value
                new = .yearChooser(value: value)

            default: break
            }
        }
        return new
        
    }
    
    func dateValueChosen()->Date? {
        var result:Date?=nil
        if self.isDateChooser() {
            switch self {
            case .firstDateChooser (let x,let v): result=v
            case .lastDateChooser (let x,let v): result=v
            default:break
            }
        }
        return result
    }
    
    func applyDateValue(_ value:Date?, into:IsOccursContentDataSource?) ->OccursControlContentType {
        var into = into
        var new=OccursControlContentType.firstDateChooser(type:DateChooserType.fullDate, value:nil)
        if self.isDateChooser() {
            switch self {
            case .firstDateChooser (let type, let date):
                into?.firstUsedDate=value
                new = .firstDateChooser(type:type, value:value)
            case .lastDateChooser (let type, let date):
                into?.lastUsedDate=value
                new = .lastDateChooser(type:type, value:value)
            default:break
            }
        }
        return new
        
    }
    
    
    func occursControlSubType() -> OccursControlSubType {
        if self.isCategoryItem() {
            return OccursControlSubType.contentTypePicker }
        if self.isDateChooser() {
            var chooserType=DateChooserType.fullDate
            switch self {
            case .firstDateChooser(let type, let date): chooserType=type
            case .lastDateChooser(let type, let date): chooserType=type
            default:break
            }
            return OccursControlSubType.datePicker(type:chooserType)
        }
        if self.isDayOfMonthChooser() {
            return OccursControlSubType.dayOfMonthPicker }
        if self.isMonthNumberChooser() {
            switch self {
            case .monthNumberOfQuarterChooser: return OccursControlSubType.monthNumberOfQuarterPicker
            case .monthNumberOfHalfYearChooser: return OccursControlSubType.monthNumberOfHalfYearPicker
            case .monthNumberOfYearChooser: return OccursControlSubType.monthNumberOfYearPicker
            default:break
            }
        }
        if self.isWeekdayChooser() {
            return OccursControlSubType.weekdayPicker
        }
        if self.isWeekNumberChooser() {
            switch self {
            case .weekNumberOfMonthChooser: return OccursControlSubType.weekNumberOfMonthPicker
            case .weekNumberOfQuarterChooser: return OccursControlSubType.weekNumberOfQuarterPicker
            case .weekNumberOfHalfYearChooser: return OccursControlSubType.weekNumberOfHalfYearPicker
            case .weekNumberOfYearChooser: return OccursControlSubType.weekNumberOfYearPicker
            default:break
            }
        }
        if self.isQuarterOfYearChooser() {
            return OccursControlSubType.quarterOfYearPicker
        }
        if self.isYearChooser() {
            return OccursControlSubType.yearPicker
        }
        if self.isLabel() {
            return OccursControlSubType.staticLabel }
        
        return OccursControlSubType.staticLabel
    }
    
    func isIn(_ choices:OccursSingleControlArray) ->Bool {
        let this=self.textLabel()
        for c in choices {
            if this == c.textLabel() { return true }
        }
        return false
    }
    func indexIn(_ choices:OccursSingleControlArray) ->Int {
        let this=self.textLabel()
        var i=0
        for c in choices {
            if this == c.textLabel() { return i }
            i=i+1
        }
        return -1
    }
    
    static func occursChooserTypeArrayFor(_ dataSource:IsOccursContentDataSource)->OccursSingleControlArray  {
        var result=OccursSingleControlArray()
        
        if let reoccurrance=dataSource.reoccurranceType {
            switch reoccurrance {
            default: result=[]
            }
        } else {
            result=[]
        }
        return result
    }
    
    func isEqualTo(_ other:OccursControlContentType)->Bool {
        switch self {
        case .dayOfMonthChooser: if case .dayOfMonthChooser = other { return true }
        case .weekdayChooser: if case .weekdayChooser  = other { return true }
        case .monthNumberOfYearChooser: if case .monthNumberOfYearChooser = other { return true }
        case .monthNumberOfQuarterChooser: if case .monthNumberOfQuarterChooser = other { return true }
        case .quarterOfYearChooser: if case .quarterOfYearChooser = other { return true }
        case .yearChooser: if case .yearChooser = other { return true }
        case .firstDateChooser: if case .firstDateChooser = other { return true }
        case .lastDateChooser: if case .lastDateChooser = other { return true }
        default: break
        }
        return false
    }
    
}



