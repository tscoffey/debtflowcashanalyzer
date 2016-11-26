//
//  UIPickerView+IsSubControl.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 6/10/16.
//  Copyright © 2016 Coffey. All rights reserved.
//

import Foundation
import UIKit

extension UIPickerView:IsOccursUIControl {
    var controlView:UIView  { return self }
    var controlSelectionIndex:Int? {
        get { return self.selectedRow(inComponent: 0) }
        set (aValue) { self.selectRow(aValue!, inComponent:0, animated:true) }
    }
    func setControlDataSource(_ source:AnyObject) {
        self.dataSource=(source as! UIPickerViewDataSource)
    }
    func setControlDelegate(_ delegate:AnyObject) {
        self.delegate=(delegate as! UIPickerViewDelegate)
    }
    func needsDisplay() {
        self.reloadAllComponents()
//        self.setNeedsDisplay()
    }
    


}
