//
//  UILabel+IsSubController.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 6/13/16.
//  Copyright © 2016 Coffey. All rights reserved.
//

import Foundation
import UIKit
extension UILabel:IsSubControl {
    var controlView:UIView  { return self }
    var controlSelectionIndex:Int? {
        get { return nil }
        set (aValue) {}
    }
    func setControlDataSource(source:AnyObject) {}
    func setControlDelegate(delegate:AnyObject) {}    
}
