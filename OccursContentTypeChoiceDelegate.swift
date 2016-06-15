//
//  OccursContentTypeChoiceDelegate.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 6/10/16.
//  Copyright © 2016 Coffey. All rights reserved.
//

class OccursContentTypeChoiceDelegate:IsSubControlChoiceDelegate {
    
    var choicesHolder:OccursContentTypeChoicesProvider?
    var dataSource:IsOccursContentDataSource?
    
    deinit {
        choicesHolder = nil
        dataSource = nil
    }
    init(holder:OccursContentTypeChoicesProvider, data:IsOccursContentDataSource) {
        choicesHolder=holder
        dataSource=data
    }
    
    func didSelectIndex(index:Int, component:Int) {
        let c=choicesHolder!.subChoices
        choicesHolder!.contentType.applyContentType(c[index], into: dataSource!)
    }
    func didUnselectIndex(index:Int, component:Int) {
        
    }
}
