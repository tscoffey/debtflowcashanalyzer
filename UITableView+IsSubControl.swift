//
//  UITableView+IsSubControl.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 6/17/16.
//  Copyright © 2016 Coffey. All rights reserved.
//

import Foundation
import UIKit

extension UITableView:IsOccursUIControl {
    var controlView:UIView  { return self }
    var controlSelectionIndex:Int? {
        get { return nil }
        set (aValue) {
            let path=IndexPath(index: aValue!)
            self.selectRow(at: path , animated: true, scrollPosition: UITableViewScrollPosition.middle)
        }
    }
    func setControlDataSource(_ source:AnyObject) {
        self.dataSource=(source as! UITableViewDataSource)
    }
    func setControlDelegate(_ delegate:AnyObject) {
        self.delegate=(delegate as! UITableViewDelegate)
    }
    func needsDisplay() {
        self.setNeedsDisplay()
    }
}
