//
//  UIView+IsSubControl.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 6/14/16.
//  Copyright © 2016 Coffey. All rights reserved.
//

import Foundation
import UIKit

extension DateView:IsSubControl {
    
    var controlView:UIView  { return self }
    var controlSelectionIndex:Int? {
        get { return nil }
        set (aValue) {}
    }
    func setControlDataSource(source:AnyObject) {}
    func setControlDelegate(delegate:AnyObject) {}
}
