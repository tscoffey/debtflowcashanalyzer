//
//  PhonyDateHolder.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 5/19/16.
//  Copyright © 2016 Coffey. All rights reserved.
//

import Foundation

class PhonyDateHolder:HasFirstLastDates {
    
    var fDate:NSDate?
    var lDate:NSDate?
    
    var firstDateIs: NSDate? {
        get {return fDate }
        set (aValue) { fDate=aValue }
        
    }
    
    var lastDateIs: NSDate? {
        get {return lDate }
        set (aValue) { lDate=aValue }
        
    }
    
    init (first:NSDate?, last:NSDate? ) {
        fDate=first
        lDate=last
    }
}