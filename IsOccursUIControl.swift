//
//  IsSubControl.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 6/10/16.
//  Copyright © 2016 Coffey. All rights reserved.
//

import Foundation
import UIKit

protocol IsOccursUIControl {
    var controlView:UIView  { get }
    var controlSelectionIndex:Int? { get set }
    func setControlDataSource(_ source:AnyObject)
    func setControlDelegate(_ delegate:AnyObject)
    
    func setControlChoices(_ choices:[String]?)
    func addSelectTarget(_ target:OccursSubController?, selector:Selector?)
    
    func needsDisplay()
}

extension IsOccursUIControl {
    func setControlChoices(_ choices:[String]?) {}
    func addSelectTarget(_ target:OccursSubController?, selector:Selector?) {}
    func needsDisplay() {}
}
