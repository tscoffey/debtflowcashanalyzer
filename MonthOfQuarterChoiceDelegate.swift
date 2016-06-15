//
//  MonthOfQuarterChoiceDelegate.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 6/14/16.
//  Copyright © 2016 Coffey. All rights reserved.
//

class MonthOfQuarterChoiceDelegate:IsSubControlChoiceDelegate {
    
    var choicesHolder:MonthOfQuarterChoicesProvider?
    var dataSource:IsOccursContentDataSource?
    
    deinit {
        choicesHolder = nil
        dataSource = nil
    }
    init(holder:MonthOfQuarterChoicesProvider, data:IsOccursContentDataSource) {
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
