//
//  HorizontalPickerView+IsSubControl.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 6/11/16.
//  Copyright © 2016 Coffey. All rights reserved.
//

import Foundation
import UIKit

extension HorizontalPickerView:IsSubControl {
    var controlView:UIView  { return self }
    var controlSelectionIndex:Int? {
        get { return self.selectedRow()}
        set (aValue) { self.selectRow(aValue!, animated: true) }
    }
    func setControlDataSource(source:AnyObject) {
        self.dataSource = (source as! HorizontalPickerViewDataSource)
    }
    func setControlDelegate(delegate:AnyObject) {
        self.delegate = (delegate as! HorizontalPickerViewDelegate)
    }
    
}
