//
//  OccursControlSubTypes.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 5/20/16.
//  Copyright © 2016 Coffey. All rights reserved.
//

import Foundation

enum OccursControlSubType {
    case
        ContentTypePicker,
        DayOfMonthPicker,
        WeekdayPicker,
        MonthNumberOfQuarterPicker,
        MonthOfYearPicker,
        NumberPicker,
        DatePicker(type:DateChooserType),
        StaticLabel
    
    func buildChoicesProvider(contentType:OccursControlContentType)->IsChoiceProvider {
        switch self {
        case .ContentTypePicker: return OccursContentTypeChoicesProvider(contentType:contentType)
        case .DayOfMonthPicker: return DayOfMonthChoicesProvider(contentType:contentType)
        case .WeekdayPicker: return WeekdayChoicesProvider(contentType:contentType)
        case .MonthOfYearPicker: return MonthOfYearChoicesProvider(contentType: contentType)

        default:return OccursContentTypeChoicesProvider(contentType:contentType)
        }
    }
    
    func isContentTypePicker()->Bool {
        switch self {
        case .ContentTypePicker: return true
        default:return false
        }
    }
    func isDatePicker()->Bool {
        switch self {
        case .DatePicker: return true
        default:return false
        }
    }
}

typealias OccursSingleControlArray = [ OccursControlContentType ]
typealias OccursMultipleControlsArray = [ OccursSingleControlArray ]

enum OccursControlContentType {
    case

    GeneralCategories,
        Every,
            EveryMonth,
            EveryWeek,
            EveryOther,
                EveryOtherWeek,
                EveryOtherMonth,
            EveryQuarter,
            EveryYear,
        TwiceA,
            TwiceaMonth,
                TwiceAMonthSelectDays,
                    TwiceAMonthAndAfterInterval,
                        TwiceAMonthAndAfterIntervalDays,
                        TwiceAMonthAndAfterIntervalWeeks,
                    TwiceAMonthSelectSecondDay,
                TwiceAMonthFirstAndMiddle,
                TwiceAMonthMiddleAndEnd,
            TwiceAYear,
        OnSelected,
            OnSelectedDays,
                OnSelectedDaysOfTheWeek,
                OnSelectedDaysOfTheMonth,
            OnSelectedWeeks,
                OnSelectedWeeksOfTheMonth,
                OnSelectedWeeksOfTheQuarter,
                OnSelectedWeeksOfTheHalfYear,
                OnSelectedWeeksYear,
            OnSelectedMonths,
                OnSelectedMonthsOfTheQuarter,
                OnSelectedMonthsOfTheHalfYear,
                OnSelectedMonthsOfTheYear,
            OnSelectedQuarters,
        OnceOn,
    OnDayOfTheMonthStarting,
    OnWeekdayStarting,
    OnWeekday,
    InTheMonthOfQuarterOnTheDay,
        InTheMonthOfQuarter,
            FirstMonthOfQuarter,
            SecondMonthOfQuarter,
            ThirdMonthOfQuarter,
    InTheMonthOfYear,
        InTheMonthOfYearAndDay,
    
    
    
    
    // starting and ending date chooser types
    Starting,
    StartingNow,
    StartingOn,
        StartingOnFullDate,
        StartingOnMonthYear,
        StartingOnYear,
    AndContinuing,
        AndContinuingEndingOnFullDate,
        AndContinuingEndingOnMonthYear,
        AndContinuingEndingOnYear,
    EndingOn,
        EndingOnFullDate,
        EndingOnMonthYear,
        EndingOnYear,

    
    // choosers
    

    DayOfMonthChooser,
    FirstDayInMonthChooser,
    SecondDayInMonthChooser,
    IntervalChooser,
    WeekdayChooser,
    MonthNumberOfQuarterChooser,
    MonthOfYearChooser,
    FirstDateChooser(type:DateChooserType),
    LastDateChooser(type:DateChooserType),

    
    // labels
    
    AnyLabel(label:String)
    
    static func onTheLabel()-> OccursControlContentType {
        return OccursControlContentType.AnyLabel(label: "On the")
    }
    static func startingLabel()-> OccursControlContentType {
        return OccursControlContentType.AnyLabel(label: "Starting")
    }
    static func firstDayLabel()-> OccursControlContentType {
        return OccursControlContentType.AnyLabel(label: "First day")
    }
    static func secondDayLabel()-> OccursControlContentType {
        return OccursControlContentType.AnyLabel(label: "Second day")
    }
    static func monthOfTheQuarterLabel()-> OccursControlContentType {
        return OccursControlContentType.AnyLabel(label: "Month of the quarter")
    }
    static func monthOfTheHalfYearLabel()-> OccursControlContentType {
        return OccursControlContentType.AnyLabel(label: "Month of the half-year")
    }
    static func monthOfTheYearLabel()-> OccursControlContentType {
        return OccursControlContentType.AnyLabel(label: "Month of the year")
    }

    func unlabeledStartingDatesSequence() ->OccursSingleControlArray {
        return  [.StartingNow, .StartingOn]
    }
    func labeledStartingDatesSequence() ->OccursSingleControlArray {
        return [OccursControlContentType.startingLabel(), .StartingNow, .StartingOn]
    }
    
    func nextOccursControls()-> OccursMultipleControlsArray {
        
        var result:OccursSingleControlArray?
        var result2:OccursMultipleControlsArray?

        switch self {
        
        case .GeneralCategories: result =  [.Every, .TwiceA, .OnSelected, .OnceOn]
            
        case .Every: result = [.EveryMonth, .EveryWeek, . EveryOther, .EveryQuarter, .EveryYear]
            
        case .EveryMonth: result = [.OnDayOfTheMonthStarting, .StartingOnFullDate]

        case .EveryWeek: result = [.OnWeekdayStarting, .StartingOnFullDate]

        case .EveryOther: result = [.EveryOtherWeek, .EveryOtherMonth]
            
        case .EveryOtherWeek: result = [.WeekdayChooser, .StartingOnFullDate]

        case .EveryOtherMonth: result = [.DayOfMonthChooser, .StartingOnFullDate]

        case .EveryQuarter: result = [.InTheMonthOfQuarterOnTheDay, .StartingOnFullDate]

        case .EveryYear: result = [.InTheMonthOfYearAndDay, .StartingOnFullDate]
            
        case .OnDayOfTheMonthStarting: result2 = [ [.DayOfMonthChooser],
                                                   [ .AnyLabel(label:"Starting")],
                                                   [.StartingOnMonthYear]
            
                        ]
        case .OnWeekdayStarting: result2 = [ [.WeekdayChooser],
                                            [ .AnyLabel(label:"Starting")],
                                            [.Starting]
            
            ]

            
        case .InTheMonthOfQuarterOnTheDay: result2 = [[.MonthNumberOfQuarterChooser],
                                                      [ .AnyLabel(label:"Month of the quarter")],
                                                      [ .AnyLabel(label:"On the")],
                                                      [.DayOfMonthChooser],
                                                      [ .AnyLabel(label:"Starting")],
                                                      [.Starting],
            ]
        case .InTheMonthOfYearAndDay:
            result2=[ [.MonthOfYearChooser],
                      [.AnyLabel(label: "On the")],
                      [.DayOfMonthChooser],
                      [ .AnyLabel(label:"Starting")],
                      [.Starting]
            ]
            

        case .StartingOnFullDate: result2 = [ [.FirstDateChooser(type: DateChooserType.FullDate) ],
                                              [ .AndContinuingEndingOnFullDate ]
                                            ]
        case .AndContinuingEndingOnFullDate: result = [.AndContinuing, .EndingOnFullDate]

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
            
            case .Every: result="Every"
            
            case .EveryMonth: result="Month"
            
            case .EveryWeek: result="Week"
            
            case .EveryOther: result="Other"
            
            case .EveryOtherWeek: result="Week"
            
            case .EveryOtherMonth: result="Month"
            
            case .EveryQuarter: result="Quarter"
            
            case .EveryYear: result="Year"
            
            case .TwiceA: result="Twice A"
            
            case .TwiceaMonth: result="Month"
            
            case .TwiceAMonthSelectDays: result="Selected Days"
            
            case .TwiceAMonthSelectSecondDay: result="Second day"
            case .TwiceAMonthAndAfterInterval: result="And After"
            
            case .TwiceAMonthFirstAndMiddle: result="First+Middle of Month"
            
            case .TwiceAMonthMiddleAndEnd: result="Middle+End of Month"
            
            case .TwiceAYear: result="Year"
            case .OnSelected: result="On Selected"
            case .OnSelectedDays: result="Days"
            case .OnSelectedDaysOfTheWeek: result="Of the week"
            case .OnSelectedDaysOfTheMonth: result="Of the month"
            case .OnSelectedWeeks: result="Weeks"
            case .OnSelectedWeeksOfTheMonth: result="Of the month"
            case .OnSelectedWeeksOfTheQuarter: result="Of the quarter"
            case .OnSelectedWeeksOfTheHalfYear: result="Of the half year"
            case .OnSelectedWeeksYear: result="Of the year"
            case .OnSelectedMonths: result="Months"
            case .OnSelectedMonthsOfTheQuarter: result="Of the quarter"
            case .OnSelectedMonthsOfTheHalfYear: result="Of the half year"
            case .OnSelectedMonthsOfTheYear: result="Of the year"
            case .OnSelectedQuarters: result="Quarters"
            case .OnceOn: result="Once on"

            case .DayOfMonthChooser: result="On the"
            case .OnDayOfTheMonthStarting: result="On the"
            
            case .OnWeekday: result="On"
            case .OnWeekdayStarting: result="On"
            case .WeekdayChooser: result="On"
            
            case .InTheMonthOfQuarter: result="In the"
            case .InTheMonthOfQuarterOnTheDay: result="In the"
            case .InTheMonthOfYearAndDay: result="In"
            
            case .FirstMonthOfQuarter: result="1st"
            
            case .SecondMonthOfQuarter: result="2nd"
            
            case .ThirdMonthOfQuarter: result="3rd"
            
            case .InTheMonthOfYear: result="In"
            case .MonthOfYearChooser: result="In"

            
            case .StartingOnFullDate, .StartingOnMonthYear, .StartingOnYear: result = "Starting"
            case .FirstDateChooser: result = "On"
            case .StartingNow: result="Now"
            case .EndingOnFullDate, .EndingOnMonthYear, .EndingOnYear: result = "Ending on"
            case .AndContinuingEndingOnFullDate, .AndContinuingEndingOnMonthYear, .AndContinuingEndingOnYear: result = "And continuing"
            case .AnyLabel (let l):result = l
            
            default: result=""
        }
        return result
    }
    
    func isCategoryItem()->Bool {
        var result:Bool
        switch self {
        case    .DayOfMonthChooser: result=false
        case    .FirstDayInMonthChooser: result=false
        case    .SecondDayInMonthChooser: result=false
        case    .IntervalChooser: result=false
        case    .WeekdayChooser : result=false
        case    .MonthNumberOfQuarterChooser: result=false
        case    .MonthOfYearChooser: result=false
        case    .FirstDateChooser: result=false
        case    .LastDateChooser: result=false
        case    .AnyLabel: result=false
            
        default:result=true
        }
        return result
    }
    
    func isLabel() -> Bool {
        var result:Bool
        switch self {
        case    .AnyLabel: result=true
        default:result=false
        }
        return result
    }
    
    func isChooser() -> Bool {
        return !(self.isLabel() || self.isCategoryItem())
    }
    
    func isNumberChooser() -> Bool {
        return self.isChooser() && !self.isDateChooser()
    }
    
    func isDayOfMonthChooser() -> Bool {
        var result:Bool
        switch self {
        case    .DayOfMonthChooser: result=true
        case    .FirstDayInMonthChooser: result=true
        case    .SecondDayInMonthChooser: result=true
        default: result=false
        }
        return result
    }
    func isMonthNumberOfQuarterChooser() ->Bool {
        var result:Bool
        switch self {
        case    .MonthNumberOfQuarterChooser: result=true
        default: result=false
        }
        return result
    }
    
    func isMonthOfYearChooser() -> Bool {
        var result:Bool
        switch self {
        case    .MonthOfYearChooser: result=true
        default: result=false
        }
        return result
    }

    func isWeekdayChooser()->Bool {
        var result:Bool
        switch self {
        case .WeekdayChooser:result=true
        default:result=false
            
        }
        return result
    }
    func isMonthChooser()->Bool {
        var result:Bool
        switch self {
        case .MonthOfYearChooser:result=true
        default:result=false
            
        }
        return result
    }

    func isIntervalChooser()->Bool {
        var result:Bool
        switch self {
        case .IntervalChooser:result=true
        default:result=false
            
        }
        return result
    }
    func isDateChooser()->Bool {
        var result:Bool
        switch self {
        case .FirstDateChooser:result=true
        case .LastDateChooser:result=true
        default:result=false
            
        }
        return result
    }
    
    func reoccurranceType()->ReoccurranceType? {
        var result:ReoccurranceType?=nil
        if self.isCategoryItem() {
            switch self {
                
                
            case .EveryMonth: result=ReoccurranceType.Monthly
                
            case .EveryWeek: result=ReoccurranceType.Weekly
                
                
            case .EveryOtherWeek: result=ReoccurranceType.BiWeekly
                
            case .EveryOtherMonth: result=ReoccurranceType.BiMonthly
                
            case .EveryQuarter: result=ReoccurranceType.Quarterly
                
            case .EveryYear: result=ReoccurranceType.Annually
                
                
            case .TwiceAMonthSelectDays: result=ReoccurranceType.SelectedDaysOfMonth
                
                
            case .TwiceAMonthFirstAndMiddle: result=ReoccurranceType.FirstAndMiddleOfMonth
                
            case .TwiceAMonthMiddleAndEnd: result=ReoccurranceType.MiddleAndEndOfMonth
                
            case .TwiceAYear: result=ReoccurranceType.SemiAnnually
            case .OnSelectedDaysOfTheWeek: result=ReoccurranceType.SelectedDaysOfWeek
            case .OnSelectedDaysOfTheMonth: result=ReoccurranceType.SelectedDaysOfMonth
            case .OnSelectedWeeksOfTheMonth: result=ReoccurranceType.SelectedWeeksOfMonth
            case .OnSelectedWeeksOfTheQuarter: result=ReoccurranceType.SelectedWeeksOfQuarter
            case .OnSelectedWeeksOfTheHalfYear: result=ReoccurranceType.SelectedWeeksOfSemiYear
            case .OnSelectedWeeksYear: result=ReoccurranceType.SelectedWeeksOfYear

            case .OnSelectedMonthsOfTheQuarter: result=ReoccurranceType.SelectedMonthsOfQuarter
            case .OnSelectedMonthsOfTheHalfYear: result=ReoccurranceType.SelectedMonthsOfSemiYear
            case .OnSelectedMonthsOfTheYear: result=ReoccurranceType.SelectedMonthsOfYear
            case .OnSelectedQuarters: result=ReoccurranceType.SelectedQuarterOfYear
            case .OnceOn: result=ReoccurranceType.OneTime

               
            default: result=nil
            }

            
        } else {
            result=nil
        }
        return result
    }
    
    func applyContentType(value:OccursControlContentType?, var into:IsOccursContentDataSource) {
        if self.isCategoryItem() {
            into.reoccurranceType=value?.reoccurranceType()
        }
    }
    
    func numberValueChosen(from:IsOccursContentDataSource)-> Int? {
        var result:Int?=nil
        if self.isNumberChooser() {
            switch self {
            case .DayOfMonthChooser: result=from.dayOfMonth
            case .FirstDayInMonthChooser: result=from.firstDayOfMonth
            case .SecondDayInMonthChooser: result=from.secondDayOfMonth
            case .WeekdayChooser: result=from.weekday
            case .MonthNumberOfQuarterChooser: result=from.monthOfQuarter
            case .MonthOfYearChooser: result=from.monthOfYear
            case .IntervalChooser: result=0
            default: break
            }
        }
        return result
    }
    
    func applyNumberValue(value:Int?, var into:IsOccursContentDataSource) {

        if self.isNumberChooser() {
            switch self {
            case .DayOfMonthChooser: into.dayOfMonth=value
            case .FirstDayInMonthChooser: into.firstDayOfMonth=value
            case .SecondDayInMonthChooser: into.secondDayOfMonth=value
            case .WeekdayChooser: into.weekday=value
            case .MonthNumberOfQuarterChooser: into.monthOfQuarter=value
            case .MonthOfYearChooser: into.monthOfYear=value
            case .IntervalChooser:into.intervalSize=value
            default: break
            }
        }

    }
    
    func dateValueChosen(from:IsOccursContentDataSource)->NSDate? {
        var result:NSDate?=nil
        if self.isDateChooser() {
            switch self {
            case .FirstDateChooser: result=from.firstUsedDate
            case .LastDateChooser: result=from.lastUsedDate
            default:break
            }
        }
        return result
    }
    
    func applyDateValue(value:NSDate?, var into:IsOccursContentDataSource){
        if self.isDateChooser() {
            switch self {
            case .FirstDateChooser: into.firstUsedDate=value
            case .LastDateChooser: into.lastUsedDate=value
            default:break
            }
        }

    }

    
    func occursControlSubType() -> OccursControlSubType {
        if self.isCategoryItem() {
            return OccursControlSubType.ContentTypePicker }
        if self.isDateChooser() {
            var chooserType=DateChooserType.FullDate
            switch self {
            case .FirstDateChooser(let type): chooserType=type
            case .LastDateChooser(let type): chooserType=type
            default:break
            }
            return OccursControlSubType.DatePicker(type:chooserType)
        }
        if self.isDayOfMonthChooser() {
            return OccursControlSubType.DayOfMonthPicker }
        if self.isMonthNumberOfQuarterChooser() {
            return OccursControlSubType.MonthNumberOfQuarterPicker }
        if self.isMonthOfYearChooser() {
            return OccursControlSubType.MonthOfYearPicker }


        if self.isWeekdayChooser() {
            return OccursControlSubType.WeekdayPicker }
        if self.isNumberChooser() {
            return OccursControlSubType.NumberPicker }
        if self.isLabel() {
            return OccursControlSubType.StaticLabel }

        return OccursControlSubType.StaticLabel
    }
    
    func isIn(choices:OccursSingleControlArray) ->Bool {
        let this=self.textLabel()
        for c in choices {
            if this == c.textLabel() { return true }
        }
        return false
    }
    func indexIn(choices:OccursSingleControlArray) ->Int {
        let this=self.textLabel()
        var i=0
        for c in choices {
            if this == c.textLabel() { return i }
            i=i+1
        }
        return -1
    }
    
    static func occursChooserTypeArrayFor(dataSource:IsOccursContentDataSource)->OccursSingleControlArray  {
        var result=OccursSingleControlArray()
        
        if let reoccurrance=dataSource.reoccurranceType {
            switch reoccurrance {
            case .Weekly: result=[.Every, .EveryWeek, .OnWeekday]
            case .Monthly:result=[ .Every, .EveryMonth, .DayOfMonthChooser]
            case .Quarterly: result=[ .Every, .EveryQuarter, .OnSelectedMonthsOfTheQuarter, .DayOfMonthChooser]
            case .SemiAnnually: result=[.TwiceA,.TwiceAYear]
            case .Annually: result=[.Every, .EveryYear, .InTheMonthOfYear,.DayOfMonthChooser]
            case .SemiMonthly: result=[.TwiceA,.TwiceaMonth,.TwiceAMonthSelectDays,.TwiceAMonthSelectSecondDay]
            case .FirstAndMiddleOfMonth: result=[.TwiceA,.TwiceaMonth,.TwiceAMonthFirstAndMiddle]
            case .MiddleAndEndOfMonth: result=[.TwiceA,.TwiceaMonth,.TwiceAMonthMiddleAndEnd]
            case .BiWeekly:result=[.Every, .EveryOther,.EveryOtherWeek, .OnWeekday]
            case .BiMonthly: result=[.Every, .EveryOther, .EveryOtherMonth, .DayOfMonthChooser]
            case .SelectedDaysOfWeek: result=[.OnSelected,.OnSelectedDaysOfTheWeek]
            case .SelectedDaysOfMonth: result=[.OnSelected,.OnSelectedDaysOfTheMonth]
            case .SelectedDaysOfQuarter: result=[.OnSelected,.OnSelectedQuarters, .OnSelectedDays]
            case .SelectedWeeksOfMonth: result=[.OnSelected, .OnSelectedWeeksOfTheMonth]
            case .SelectedWeeksOfQuarter: result=[.OnSelected, .OnSelectedWeeksOfTheQuarter]
            case .SelectedWeeksOfSemiYear: result=[.OnSelected, .OnSelectedWeeksOfTheHalfYear]
            case .SelectedWeeksOfYear: result=[.OnSelected, .OnSelectedWeeksYear]
            case .SelectedMonthsOfQuarter: result=[.OnSelected, .OnSelectedMonthsOfTheQuarter, .DayOfMonthChooser]
            case .SelectedMonthsOfSemiYear: result=[.OnSelected, .OnSelectedMonthsOfTheHalfYear,.DayOfMonthChooser]
            case .SelectedMonthsOfYear: result=[.OnSelected, .OnSelectedMonthsOfTheYear]
            case .SelectedQuarterOfYear: result=[.OnSelected, .OnSelectedQuarters]
            case .OneTime: result=[ .OnceOn]
            default: result=[]
            }
        } else {
            result=[]
        }        
        return result
    }
    
}



        