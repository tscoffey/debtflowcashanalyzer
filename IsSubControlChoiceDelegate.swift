//
//  IsSubControlDelegate.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 6/10/16.
//  Copyright © 2016 Coffey. All rights reserved.
//

import Foundation

protocol IsSubControlChoiceDelegate {
    func didSelectIndex(index:Int, component:Int)
    func didUnselectIndex(index:Int, component:Int)
}
