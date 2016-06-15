//
//  IsSubControl.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 6/10/16.
//  Copyright © 2016 Coffey. All rights reserved.
//

import Foundation
import UIKit

protocol IsSubControl {
    var controlView:UIView  { get }
    var controlSelectionIndex:Int? { get set }
    func setControlDataSource(source:AnyObject)
    func setControlDelegate(delegate:AnyObject)
}
