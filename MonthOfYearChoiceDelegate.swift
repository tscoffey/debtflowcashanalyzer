//
//  MonthOfYearChoiceDelegate.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 6/13/16.
//  Copyright © 2016 Coffey. All rights reserved.
//

class MonthOfYearChoiceDelegate:IsSubControlChoiceDelegate {
    
    var choicesHolder:MonthOfYearChoicesProvider?
    var dataSource:IsOccursContentDataSource?
    
    deinit {
        choicesHolder = nil
        dataSource = nil
    }
    init(holder:MonthOfYearChoicesProvider, data:IsOccursContentDataSource) {
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


