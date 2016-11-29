//
//  OccursContentTypeChoiceDelegate.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 6/10/16.
//  Copyright © 2016 Coffey. All rights reserved.
//

class OccursContentTypeChoiceDelegate:SubControlChoiceDelegate {
    

    override init(holder:IsChoiceProvider, data:IsOccursContentDataSource, parentDelegate:IsSubControlChoiceDelegate?) {
        super.init(holder:holder, data:data, parentDelegate:parentDelegate)
    }
    
    override func didSelectIndex(_ index:Int, component:OccursSubController) {
        let c=choicesHolder!.contentTypeSubChoices
        choicesHolder!.contentType.applyContentType(c![index], into: dataSource!)
        super.didSelectIndex(index, component: component)
    }
    override func didUnselectIndex(_ index:Int, component:OccursSubController) {
        
    }
}
