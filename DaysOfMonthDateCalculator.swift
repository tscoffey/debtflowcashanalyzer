//
//  MonthlyDateCalculator.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 4/23/16.
//  Copyright © 2016 Coffey. All rights reserved.
//

import Foundation

class DaysOfMonthDateCalculator:AbstractDateCalculator {
    
    class func dateCalculatorInstance(_ values:[(Int32,Int32)], firstDate:Date?, lastDate:Date?, dateMitigation:SpendingDateMitigation) ->IsReoccurringDateCalculator {
        let days=values.map(){$0.0}
        let newOne=DaysOfMonthDateCalculator(firstDate: firstDate, lastDate: lastDate, dateMitigation:dateMitigation, days: days)
        
        return newOne
    }

    
    var daysOfMonth:[Int]
    
    init(firstDate fDate: Date?, lastDate lDate: Date?, dateMitigation:SpendingDateMitigation, days:[Int32]) {
        daysOfMonth=(days.map(){ Int($0)}).sorted(){ $0 < $1 }
        super.init(firstDate: fDate, lastDate: lDate, dateMitigation:dateMitigation)

    }
    override func daysUntilNextDateAfter(_ date: Date) -> Int {
        return self.daysUntilNextDateAfter(date, usingDaysOfMonth: daysOfMonth)
    }
    
    func daysUntilNextDateAfter(_ date: Date, usingDaysOfMonth:[Int]) -> Int {
        let day=date.dayInMonthFor()
        var x=0
        let max=usingDaysOfMonth.count
        while (x < max) && (day >= usingDaysOfMonth[x]) {
            x=x+1
        }
        if (x < max) {
            return usingDaysOfMonth[x] - day
        } else {
            let days=date.daysInMonthFor()
            return days - day + usingDaysOfMonth[0]
        }
    }

}

class MonthlyDateCalculator:DaysOfMonthDateCalculator {
    
    override class func dateCalculatorInstance(_ values:[(Int32,Int32)], firstDate:Date?, lastDate:Date?, dateMitigation:SpendingDateMitigation) ->IsReoccurringDateCalculator {
        
        let days=[values[0].0]
        let newOne=MonthlyDateCalculator(firstDate: firstDate, lastDate: lastDate, dateMitigation:dateMitigation, days: days)
        
        return newOne
    }
    
    class func dateCalculatorInstance(_ dayOfMonth:Int, firstDate:Date?, lastDate:Date?, dateMitigation:SpendingDateMitigation) ->IsReoccurringDateCalculator {
        
        let days=[Int32(dayOfMonth)]
        let newOne=MonthlyDateCalculator(firstDate: firstDate, lastDate: lastDate, dateMitigation:dateMitigation, days: days)
        
        return newOne
    }
    

    
}

class SemiMonthlyDateCalculator:DaysOfMonthDateCalculator {
    
    override class func dateCalculatorInstance(_ values:[(Int32,Int32)], firstDate:Date?, lastDate:Date?, dateMitigation:SpendingDateMitigation) ->IsReoccurringDateCalculator {
        
        let days=values.map(){$0.0}
        let newOne=SemiMonthlyDateCalculator(firstDate: firstDate, lastDate: lastDate, dateMitigation:dateMitigation, days: days)
        
        return newOne
    }
    
    class func dateCalculatorInstance(_ firstDay:Int, secondDay:Int, firstDate:Date?, lastDate:Date?, dateMitigation:SpendingDateMitigation) ->IsReoccurringDateCalculator {
        
        let days=[Int32(firstDay),Int32(secondDay)]
        let newOne=SemiMonthlyDateCalculator(firstDate: firstDate, lastDate: lastDate, dateMitigation:dateMitigation, days: days)
        
        return newOne
    }
    
    func daysOfMonthToUse(_ forDate:Date) -> [Int] { return daysOfMonth }
    
    override func daysUntilNextDateAfter(_ date: Date) -> Int {
        return self.daysUntilNextDateAfter(date, usingDaysOfMonth: self.daysOfMonthToUse(date))
    }

}

class FirstAndMiddleOfMonthDateCalculator:SemiMonthlyDateCalculator {
    
    override class func dateCalculatorInstance(_ values:[(Int32,Int32)],firstDate:Date?, lastDate:Date?, dateMitigation:SpendingDateMitigation) ->IsReoccurringDateCalculator {
        
        return FirstAndMiddleOfMonthDateCalculator(firstDate: firstDate, lastDate: lastDate, dateMitigation:dateMitigation, days: [])
    }
    
    override func daysOfMonthToUse(_ forDate:Date) -> [Int]
    {
        return [1,15]
    }
}

class MiddleAndEndOfMonthDateCalculator:SemiMonthlyDateCalculator {
    
    override class func dateCalculatorInstance(_ values:[(Int32,Int32)],firstDate:Date?, lastDate:Date?, dateMitigation:SpendingDateMitigation) ->IsReoccurringDateCalculator {
        
        return MiddleAndEndOfMonthDateCalculator(firstDate: firstDate, lastDate: lastDate, dateMitigation:dateMitigation, days: [])
    }
    
    override func daysOfMonthToUse(_ forDate:Date) -> [Int]
    {
        return [15,forDate.daysInMonthFor()]
    }
}

