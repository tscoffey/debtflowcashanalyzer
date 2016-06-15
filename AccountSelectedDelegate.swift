//
//  AccountSelectedDelegate.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 5/17/16.
//  Copyright © 2016 Coffey. All rights reserved.
//

import Foundation
protocol SourceAccountSelectedDelegate {
    func didSelectSourceAccount(account:IsSourceAccount)
    func didDeselectSourceAccount()
    
}
