//
//  DropDown+IsSubControl.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 6/17/16.
//  Copyright © 2016 Coffey. All rights reserved.
//

import Foundation
import UIKit
extension UIDropDown:IsOccursUIControl {
    var controlView:UIView  { return self }
    var controlSelectionIndex:Int? {
        get { return self.selectedIndex }
        set (aValue) {self.selectedIndex=aValue }
    }
    func setControlDataSource(_ source:AnyObject) {
        
    }
    func setControlDelegate(_ delegate:AnyObject) {
        self.delegate=(delegate as! UIDropDownDelegate)
    }
    func setControlChoices(_ choices:[String]?) {
        self.options=NSMutableArray(array: choices!)
    }
    func needsDisplay() {
        self.setNeedsDisplay()
    }
    
}
