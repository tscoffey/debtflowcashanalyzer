//
//  MonthlyDateCalculator.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 4/23/16.
//  Copyright © 2016 Coffey. All rights reserved.
//

import Foundation

class DaysOfMonthDateCalculator:AbstractDateCalculator {
    
    class func dateCalculatorInstance(values:[(Int32,Int32)], firstDate:NSDate?, lastDate:NSDate?, dateMitigation:SpendingDateMitigation) ->IsReoccurringDateCalculator {
        let days=values.map(){$0.0}
        let newOne=DaysOfMonthDateCalculator(firstDate: firstDate, lastDate: lastDate, dateMitigation:dateMitigation, days: days)
        
        return newOne
    }

    
    var daysOfMonth:[Int]
    
    init(firstDate fDate: NSDate?, lastDate lDate: NSDate?, dateMitigation:SpendingDateMitigation, days:[Int32]) {
        daysOfMonth=(days.map(){ Int($0)}).sort(){ $0 < $1 }
        super.init(firstDate: fDate, lastDate: lDate, dateMitigation:dateMitigation)

    }
    override func daysUntilNextDateAfter(date: NSDate) -> Int {
        return self.daysUntilNextDateAfter(date, usingDaysOfMonth: daysOfMonth)
    }
    
    func daysUntilNextDateAfter(date: NSDate, usingDaysOfMonth:[Int]) -> Int {
        let day=dayInMonthFor(date)
        var x=0
        let max=usingDaysOfMonth.count
        while (x < max) && (day >= usingDaysOfMonth[x]) {
            x=x+1
        }
        if (x < max) {
            return usingDaysOfMonth[x] - day
        } else {
            let days=daysInMonthFor(date)
            return days - day + usingDaysOfMonth[0]
        }
    }

}

class MonthlyDateCalculator:DaysOfMonthDateCalculator {
    
    override class func dateCalculatorInstance(values:[(Int32,Int32)], firstDate:NSDate?, lastDate:NSDate?, dateMitigation:SpendingDateMitigation) ->IsReoccurringDateCalculator {
        
        let days=[values[0].0]
        let newOne=MonthlyDateCalculator(firstDate: firstDate, lastDate: lastDate, dateMitigation:dateMitigation, days: days)
        
        return newOne
    }
    
    class func dateCalculatorInstance(dayOfMonth:Int, firstDate:NSDate?, lastDate:NSDate?, dateMitigation:SpendingDateMitigation) ->IsReoccurringDateCalculator {
        
        let days=[Int32(dayOfMonth)]
        let newOne=MonthlyDateCalculator(firstDate: firstDate, lastDate: lastDate, dateMitigation:dateMitigation, days: days)
        
        return newOne
    }
    

    
}

class SemiMonthlyDateCalculator:DaysOfMonthDateCalculator {
    
    override class func dateCalculatorInstance(values:[(Int32,Int32)], firstDate:NSDate?, lastDate:NSDate?, dateMitigation:SpendingDateMitigation) ->IsReoccurringDateCalculator {
        
        let days=values.map(){$0.0}
        let newOne=SemiMonthlyDateCalculator(firstDate: firstDate, lastDate: lastDate, dateMitigation:dateMitigation, days: days)
        
        return newOne
    }
    
    class func dateCalculatorInstance(firstDay:Int, secondDay:Int, firstDate:NSDate?, lastDate:NSDate?, dateMitigation:SpendingDateMitigation) ->IsReoccurringDateCalculator {
        
        let days=[Int32(firstDay),Int32(secondDay)]
        let newOne=SemiMonthlyDateCalculator(firstDate: firstDate, lastDate: lastDate, dateMitigation:dateMitigation, days: days)
        
        return newOne
    }
    
    func daysOfMonthToUse(forDate:NSDate) -> [Int] { return daysOfMonth }
    
    override func daysUntilNextDateAfter(date: NSDate) -> Int {
        return self.daysUntilNextDateAfter(date, usingDaysOfMonth: self.daysOfMonthToUse(date))
    }

}

class FirstAndMiddleOfMonthDateCalculator:SemiMonthlyDateCalculator {
    
    override class func dateCalculatorInstance(values:[(Int32,Int32)],firstDate:NSDate?, lastDate:NSDate?, dateMitigation:SpendingDateMitigation) ->IsReoccurringDateCalculator {
        
        return FirstAndMiddleOfMonthDateCalculator(firstDate: firstDate, lastDate: lastDate, dateMitigation:dateMitigation, days: [])
    }
    
    override func daysOfMonthToUse(forDate:NSDate) -> [Int]
    {
        return [1,15]
    }
}

class MiddleAndEndOfMonthDateCalculator:SemiMonthlyDateCalculator {
    
    override class func dateCalculatorInstance(values:[(Int32,Int32)],firstDate:NSDate?, lastDate:NSDate?, dateMitigation:SpendingDateMitigation) ->IsReoccurringDateCalculator {
        
        return MiddleAndEndOfMonthDateCalculator(firstDate: firstDate, lastDate: lastDate, dateMitigation:dateMitigation, days: [])
    }
    
    override func daysOfMonthToUse(forDate:NSDate) -> [Int]
    {
        return [15,daysInMonthFor(forDate)]
    }
}

