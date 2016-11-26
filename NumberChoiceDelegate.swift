//
//  NumberChoiceDelegate.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 6/22/16.
//  Copyright © 2016 Coffey. All rights reserved.
//

import Foundation
class NumberChoiceDelegate:SubControlChoiceDelegate {
    
    
    override init(holder:IsChoiceProvider, data:IsOccursContentDataSource, parentDelegate:IsSubControlChoiceDelegate?) {
        super.init(holder:holder, data:data, parentDelegate:parentDelegate)
    }
    
    override func didSelectIndex(_ index:Int, component:OccursSubController) {
        let c=self.choicesHolder!.numberSubChoices
        let current=choicesHolder!.contentType
        let next = current.applyNumberValue(c![index], into: dataSource!)
        choicesHolder!.contentType = next
        super.didSelectIndex(index, component: component)
    }
    
    override func didUnselectIndex(_ index:Int, component:OccursSubController) {
        
    }
}

