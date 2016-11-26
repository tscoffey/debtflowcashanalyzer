//
//  UISegmentedControl+IsSubControl.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 6/16/16.
//  Copyright © 2016 Coffey. All rights reserved.
//

import Foundation
import UIKit

extension  UISegmentedControl :IsOccursUIControl {
    var controlView:UIView  { return self }
    var controlSelectionIndex:Int? {
        get { return self.selectedSegmentIndex }
        set (aValue) { self.selectedSegmentIndex=aValue! }
    }
    func setControlDataSource(_ source:AnyObject) {
        
    }
    func setControlDelegate(_ delegate:AnyObject) {
        
    }
    func setControlChoices(_ choices:[String]?) {
        var i=0
        if let c = choices {
            self.removeAllSegments()
            for choice in c {
                self.insertSegment(withTitle: c[i], at: i, animated: true)
                i=i+1
            }
        }
    }
    func addSelectTarget(_ target:OccursSubController?, selector:Selector?) {
        if let t=target, let s=selector {
            self.addTarget(t, action: s, for: UIControlEvents.valueChanged)
        }
    }
    
    func needsDisplay() {
        self.setNeedsDisplay()
    }
}
