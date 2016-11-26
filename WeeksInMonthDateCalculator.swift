//
//  WeeksInMonthDateCalculator.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 4/25/16.
//  Copyright © 2016 Coffey. All rights reserved.
//

import Foundation

class WeeksInMonthDateCalculator:AbstractDateCalculator {
    var weekdayAndCount:[(occurrenceInMonth:Int,weekday:Int)]
    
    class func dateCalculatorInstance(_ values:[(Int32,Int32)], firstDate:Date?, lastDate:Date?, dateMitigation:SpendingDateMitigation) ->IsReoccurringDateCalculator {
        
        let newOne=WeeksInMonthDateCalculator(firstDate: firstDate, lastDate: lastDate, dateMitigation:dateMitigation, weekdayAndCount: values)
        
        return newOne
    }

    
    init(firstDate fDate: Date?, lastDate lDate: Date?, dateMitigation:SpendingDateMitigation, weekdayAndCount:[(Int32,Int32)]) {
        
        self.weekdayAndCount=weekdayAndCount.map(){(Int($0.0),Int($0.1))}.sorted(){
            if ($0.occurrenceInMonth < $1.occurrenceInMonth) { return true }
            if ($0.occurrenceInMonth == $1.occurrenceInMonth) {
                if ($0.weekday < $1.weekday) { return true }
            }
            return false
        }
        super.init(firstDate: fDate, lastDate: lDate, dateMitigation:dateMitigation)
    }

    func combinedFor(_ weekInMonth:Int, weekday:Int) -> Int { return weekInMonth * 10 + weekday }
    
    override func daysUntilNextDateAfter(_ date:Date)->Int {
        let weekday=date.weekdayFor()
        let weekInMonth=date.weekdayOccurrenceInMonthFor()
        let combined=self.combinedFor(weekInMonth, weekday: weekday)
        let max=weekdayAndCount.count
        var x=0
        while (x < max) && (combined < self.combinedFor(weekdayAndCount[x].occurrenceInMonth, weekday: weekdayAndCount[x].weekday)) {
            x=x+1
        }
        var nextWeek:Int
        var nextWeekday:Int
        var baseDate:Date
        var goalDate:Date
        if x <= max && x > 0 {
            x = x - 1
            nextWeek = weekdayAndCount[x].occurrenceInMonth
            nextWeekday=weekdayAndCount[x].weekday
            baseDate=date
        } else {
            nextWeek = weekdayAndCount[0].occurrenceInMonth
            nextWeekday=weekdayAndCount[0].weekday
            baseDate=date.firstDateInNextMonthFor()
        }
        goalDate=Date.dateForWeekdayAndCountIn(baseDate.monthFor(),year:baseDate.yearFor(),weekday:nextWeekday,count:nextWeek)
        return date.daysBetween(goalDate)
    }
    

}

class FirstWeekOfMonthDateCalculator:WeeksInMonthDateCalculator {
    
    override class func dateCalculatorInstance(_ values:[(Int32,Int32)], firstDate:Date?, lastDate:Date?, dateMitigation:SpendingDateMitigation) ->IsReoccurringDateCalculator {
        
        let newValue=(Int32(1),values[0].1)
        let newOne=FirstWeekOfMonthDateCalculator(firstDate: firstDate, lastDate: lastDate, dateMitigation:dateMitigation, weekdayAndCount: [newValue])
        
        return newOne
    }
    
}

class LastWeekOfMonthDateCalculator:WeeksInMonthDateCalculator {
    
    override class func dateCalculatorInstance(_ values:[(Int32,Int32)], firstDate:Date?, lastDate:Date?, dateMitigation:SpendingDateMitigation) ->IsReoccurringDateCalculator {
        
        let newValue=(Int32(4),values[0].1)
        let newOne=LastWeekOfMonthDateCalculator(firstDate: firstDate, lastDate: lastDate, dateMitigation:dateMitigation, weekdayAndCount: [newValue])
        
        return newOne
    }
    
}

