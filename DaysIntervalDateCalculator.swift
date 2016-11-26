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
    
    class func dateCalculatorInstance(_ values:[(Int32,Int32)], firstDate:Date?, lastDate:Date?, dateMitigation:SpendingDateMitigation) ->IsReoccurringDateCalculator {
        
        let newOne=DaysIntervalDateCalculator(firstDate: firstDate, lastDate: lastDate, dateMitigation:dateMitigation, interval: values[0].0)
        
        return newOne
    }
    
    init(firstDate fDate: Date?, lastDate lDate: Date?, dateMitigation:SpendingDateMitigation, interval:Int32) {
        intervalDays=interval
        super.init(firstDate: fDate, lastDate: lDate, dateMitigation:dateMitigation)
        
    }

    
}
