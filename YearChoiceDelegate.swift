//
//  YearChoiceDelegate.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 6/14/16.
//  Copyright © 2016 Coffey. All rights reserved.
//

import Foundation
class YearChoiceDelegate:IsSubControlChoiceDelegate {
    
    var choicesHolder:YearChoicesProvider?
    var dataSource:IsOccursContentDataSource?
    
    deinit {
        choicesHolder = nil
        dataSource = nil
    }
    init(holder:YearChoicesProvider, data:IsOccursContentDataSource) {
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
