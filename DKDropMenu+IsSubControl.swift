//
//  DKDropMenu+IsSubControl.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 6/17/16.
//  Copyright © 2016 Coffey. All rights reserved.
//

import Foundation
import UIKit

extension DKDropMenu:IsOccursUIControl {
    
    var controlView:UIView  { return self }
    var controlSelectionIndex:Int? {
        get { return nil }
        set (aValue) {  }
    }
    func setControlDataSource(_ source:AnyObject) {
        
    }
    func setControlDelegate(_ delegate:AnyObject) {
        self.delegate=(delegate as! DKDropMenuDelegate)
        
    }
    func setControlChoices(_ choices:[String]?) {
        var i=0
        if let c = choices {
            for choice in c {
                self.addItem(choice)
                i=i+1
            }
        }
    }
    func addSelectTarget(_ target:OccursSubController?, selector:Selector?) {

    }
    
    func needsDisplay() {
        self.setNeedsDisplay()
    }

    
}
