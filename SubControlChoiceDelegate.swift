//
//  SubControlChoiceDelegate.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 6/18/16.
//  Copyright © 2016 Coffey. All rights reserved.
//

import Foundation

class SubControlChoiceDelegate:IsSubControlChoiceDelegate {
    
    var _parentDelegate:IsSubControlChoiceDelegate?
    
    var parentDelegate:IsSubControlChoiceDelegate? {
        get { return _parentDelegate }
        set (aValue) { _parentDelegate = aValue }
    }
    
    var choicesHolder:IsChoiceProvider?
    var dataSource:IsOccursContentDataSource?
    
    func didSelectIndex(_ index:Int, component:OccursSubController) {
        if let p = _parentDelegate {
//            p.didSelectIndex(index, component: component)
        }
        
    }
    func didUnselectIndex(_ index:Int, component:OccursSubController) {
        
    }
    
    init(holder:IsChoiceProvider, data:IsOccursContentDataSource,parentDelegate:IsSubControlChoiceDelegate?) {
        choicesHolder=holder
        dataSource=data
        _parentDelegate=parentDelegate
    }
    
    deinit {
        choicesHolder = nil
        dataSource = nil
        _parentDelegate=nil
    }

    
}
