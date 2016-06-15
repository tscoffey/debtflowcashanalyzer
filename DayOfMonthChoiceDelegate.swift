//
//  DayOfMonthChoicesDelegate.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 6/12/16.
//  Copyright © 2016 Coffey. All rights reserved.
//

class DayOfMonthChoiceDelegate:IsSubControlChoiceDelegate {
    
    var choicesHolder:DayOfMonthChoicesProvider?
    var dataSource:IsOccursContentDataSource?
    
    deinit {
        choicesHolder = nil
        dataSource = nil
    }
    init(holder:DayOfMonthChoicesProvider, data:IsOccursContentDataSource) {
        choicesHolder=holder
        dataSource=data
    }
    
    func didSelectIndex(index:Int, component:Int) {
        let c=choicesHolder!.subChoices
        choicesHolder!.contentType.applyNumberValue(c[index], into: dataSource!)
    }
    func didUnselectIndex(index:Int, component:Int) {
        
    }
}
