//
//  PhonyDateHolder.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 5/19/16.
//  Copyright © 2016 Coffey. All rights reserved.
//

import Foundation

class PhonyDateHolder:HasFirstLastDates {
    
    var fDate:Date?
    var lDate:Date?
    
    var firstDateIs: Date? {
        get {return fDate }
        set (aValue) { fDate=aValue }
        
    }
    
    var lastDateIs: Date? {
        get {return lDate }
        set (aValue) { lDate=aValue }
        
    }
    
    init (first:Date?, last:Date? ) {
        fDate=first
        lDate=last
    }
}
