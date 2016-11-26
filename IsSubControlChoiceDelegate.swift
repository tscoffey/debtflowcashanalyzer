//
//  IsSubControlDelegate.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 6/10/16.
//  Copyright © 2016 Coffey. All rights reserved.
//

import Foundation

protocol IsSubControlChoiceDelegate {
    func didSelectIndex(_ index:Int, component:OccursSubController, fromUI:Bool)
    func didChangeChoices(_ choices:[Int], component:OccursSubController, fromUI:Bool)
    func didSelectDate(_ date:Date, component:OccursSubController, fromUI:Bool)
}

extension IsSubControlChoiceDelegate {
    func didSelectIndex(_ index:Int, component:OccursSubController, fromUI:Bool) {}
    func didChangeChoices(_ choices:[Int], component:OccursSubController, fromUI:Bool) {}
    func didSelectDate(_ date:Date, component:OccursSubController, fromUI:Bool) {}

    
}
