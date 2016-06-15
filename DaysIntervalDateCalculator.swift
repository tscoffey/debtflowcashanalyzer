//
//  DaysIntervalDateCalculator.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 4/23/16.
//  Copyright © 2016 Coffey. All rights reserved.
//

import Foundation

class DaysIntervalDateCalculator:AbstractDateCalculator {
    
    var intervalDays:Int32
    
    class func dateCalculatorInstance(values:[(Int32,Int32)], firstDate:NSDate?, lastDate:NSDate?, dateMitigation:SpendingDateMitigation) ->IsReoccurringDateCalculator {
        
        let newOne=DaysIntervalDateCalculator(firstDate: firstDate, lastDate: lastDate, dateMitigation:dateMitigation, interval: values[0].0)
        
        return newOne
    }
    
    init(firstDate fDate: NSDate?, lastDate lDate: NSDate?, dateMitigation:SpendingDateMitigation, interval:Int32) {
        intervalDays=interval
        super.init(firstDate: fDate, lastDate: lDate, dateMitigation:dateMitigation)
        
    }

    
}