//
//  SpendingOptionsProtocols.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 4/14/16.
//  Copyright © 2016 Coffey. All rights reserved.
//

import Foundation
protocol IsSpendingOptions:HasModel {
    var weekendsAndHolidayMitigationIs:SpendingDateMitigation { get set }
    
}


protocol HasSpendingOptions {
    var spendingOptionsIs:IsSpendingOptions { get set }
}

protocol IsStubbedSpendingOptions:IsSpendingOptions {
    
}

extension IsStubbedSpendingOptions {
    var weekendsAndHolidayMitigationIs:SpendingDateMitigation {
        get { return SpendingDateMitigation.DoNotShift }
        set (aValue) {}
    }
    
}