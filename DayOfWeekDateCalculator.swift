//
//  DayOfWeekDateCalculator.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 4/23/16.
//  Copyright © 2016 Coffey. All rights reserved.
//

import Foundation

class DaysOfWeekDateCalculator:AbstractDateCalculator {
    
    var daysOfWeek:[Int]
    
    
    init(firstDate fDate: NSDate?, lastDate lDate: NSDate?, dateMitigation:SpendingDateMitigation, daysOfWeek:[Int32]) {
        self.daysOfWeek=daysOfWeek.map(){ Int($0)}.sort(){ $0 < $1 }
        super.init(firstDate: fDate, lastDate: lDate, dateMitigation:dateMitigation)
        
    }
    
    override func daysUntilNextDateAfter(date: NSDate) -> Int {
        let weekday=weekdayFor(date)
        var x=0
        let max=daysOfWeek.count
        while (x < max) && (weekday >= daysOfWeek[x]) {
            x=x+1
        }
        if (x < max) {
            return daysOfWeek[x] - weekday
        } else {
            return 7 - weekday + daysOfWeek[0]
        }
    }


}

class DailyDateCalculator:DaysOfWeekDateCalculator {
    
    class func dateCalculatorInstance(values:[(Int32,Int32)], firstDate:NSDate?, lastDate:NSDate?, dateMitigation:SpendingDateMitigation) ->IsReoccurringDateCalculator {
        
        let daysOfWeek=values.map(){$0.0}
        let newOne=DailyDateCalculator(firstDate: firstDate, lastDate: lastDate, dateMitigation:dateMitigation, daysOfWeek:daysOfWeek)
        
        return newOne
    }
    
    
}

class WeeklyDateCalculator:DaysOfWeekDateCalculator {
    
    class func dateCalculatorInstance(values:[(Int32,Int32)], firstDate:NSDate?, lastDate:NSDate?, dateMitigation:SpendingDateMitigation) ->IsReoccurringDateCalculator {
        
        let daysOfWeek=values.map(){$0.0}
        let newOne=WeeklyDateCalculator(firstDate: firstDate, lastDate: lastDate, dateMitigation:dateMitigation, daysOfWeek:daysOfWeek)
        
        return newOne
    }
    
    
}

class SpecificWeekdaysDateCalculator:DaysOfWeekDateCalculator {
    
    class func dateCalculatorInstance(values:[(Int32,Int32)], firstDate:NSDate?, lastDate:NSDate?, dateMitigation:SpendingDateMitigation) ->IsReoccurringDateCalculator {
        
        let daysOfWeek=values.map(){$0.0}
        let newOne=SpecificWeekdaysDateCalculator(firstDate: firstDate, lastDate: lastDate, dateMitigation:dateMitigation, daysOfWeek:daysOfWeek)
        
        return newOne
    }
    
    
}
