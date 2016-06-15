//
//  MonthsAndDaysDateCalculator.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 4/23/16.
//  Copyright © 2016 Coffey. All rights reserved.
//

import Foundation

class MonthsAndDaysDateCalculator:AbstractDateCalculator {
    var monthsDays:[(month:Int,dayOfMonth:Int)]
    
    init(firstDate fDate: NSDate?, lastDate lDate: NSDate?, dateMitigation:SpendingDateMitigation, monthsAndDays:[(Int32,Int32)]) {
        
        monthsDays=monthsAndDays.map(){(month:Int($0.0),dayOfMonth:Int($0.1))}.sort(){
            if ($0.month < $1.month) { return true }
            if $0.month == $1.month {
                if $0.dayOfMonth < $1.dayOfMonth { return true }
            }
            return false
        }
        super.init(firstDate: fDate, lastDate: lDate, dateMitigation:dateMitigation)
    }
    
    func combinedMonthDayFor(month:Int, dayOfMonth:Int) -> Int { return month * 100 + dayOfMonth }
    
    override func daysUntilNextDateAfter(date: NSDate) -> Int {
        let thisMonth=monthFor(date)
        let thisDay=dayInMonthFor(date)
        let combined=self.combinedMonthDayFor(thisMonth, dayOfMonth: thisDay)
        let max=monthsDays.count
        var x=0
        while (x < max && combined < self.combinedMonthDayFor(monthsDays[x].month, dayOfMonth: monthsDays[x].dayOfMonth)) {
            x=x+1
        }
        var goalDate:NSDate
        if x <= max && x > 0 {
            x = x - 1
            goalDate=buildDate(yearFor(date), month: monthsDays[x].month, day: monthsDays[x].dayOfMonth)
        } else {
            goalDate=buildDate(yearFor(date)+1, month: monthsDays[0].month, day: monthsDays[0].dayOfMonth)
        }
        return daysBetween(date, toDate: goalDate)
    }
    
}

class BiMonthlyDateCalculator:MonthsAndDaysDateCalculator {
    class func dateCalculatorInstance(values:[(Int32,Int32)], firstDate:NSDate?, lastDate:NSDate?, dateMitigation:SpendingDateMitigation) ->IsReoccurringDateCalculator {
        
        let newOne=BiMonthlyDateCalculator(firstDate: firstDate, lastDate: lastDate, dateMitigation:dateMitigation, monthsAndDays: values)
        
        return newOne
    }
    
}

class QuarterlyDateCalculator:MonthsAndDaysDateCalculator {
    class func dateCalculatorInstance(values:[(Int32,Int32)], firstDate:NSDate?, lastDate:NSDate?, dateMitigation:SpendingDateMitigation) ->IsReoccurringDateCalculator {
        
        let newOne=QuarterlyDateCalculator(firstDate: firstDate, lastDate: lastDate, dateMitigation:dateMitigation, monthsAndDays: values)
        
        return newOne
    }
    
}
class SemiAnnualDateCalculator:MonthsAndDaysDateCalculator {
    class  func dateCalculatorInstance(values:[(Int32,Int32)], firstDate:NSDate?, lastDate:NSDate?, dateMitigation:SpendingDateMitigation) ->IsReoccurringDateCalculator {
        
        let newOne=SemiAnnualDateCalculator(firstDate: firstDate, lastDate: lastDate, dateMitigation:dateMitigation, monthsAndDays: values)
        
        return newOne
    }
    
}

class AnnualDateCalculator:MonthsAndDaysDateCalculator {
    class func dateCalculatorInstance(values:[(Int32,Int32)], firstDate:NSDate?, lastDate:NSDate?, dateMitigation:SpendingDateMitigation) ->IsReoccurringDateCalculator {
        
        let newOne=AnnualDateCalculator(firstDate: firstDate, lastDate: lastDate, dateMitigation:dateMitigation, monthsAndDays: values)
        
        return newOne
    }
    
}

class OneTimeDateCalculator:MonthsAndDaysDateCalculator {
    class func dateCalculatorInstance(values:[(Int32,Int32)], firstDate:NSDate?, lastDate:NSDate?, dateMitigation:SpendingDateMitigation) ->IsReoccurringDateCalculator {
        
        let newOne=OneTimeDateCalculator(firstDate: firstDate, lastDate: lastDate, dateMitigation:dateMitigation, monthsAndDays: values)
        
        return newOne
    }
    
}

class SelectedMonthsAndDaysDateCalculator:MonthsAndDaysDateCalculator {
    class func dateCalculatorInstance(values:[(Int32,Int32)], firstDate:NSDate?, lastDate:NSDate?, dateMitigation:SpendingDateMitigation) ->IsReoccurringDateCalculator {
        
        let newOne=SelectedMonthsAndDaysDateCalculator(firstDate: firstDate, lastDate: lastDate, dateMitigation:dateMitigation, monthsAndDays: values)
        
        return newOne
    }
    
}

