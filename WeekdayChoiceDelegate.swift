//
//  WeekdayChoiceDelegate.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 6/12/16.
//  Copyright © 2016 Coffey. All rights reserved.
//

class WeekdayChoiceDelegate:IsSubControlChoiceDelegate {
    
    var choicesHolder:WeekdayChoicesProvider?
    var dataSource:IsOccursContentDataSource?
    
    deinit {
        choicesHolder = nil
        dataSource = nil
    }
    init(holder:WeekdayChoicesProvider, data:IsOccursContentDataSource) {
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

