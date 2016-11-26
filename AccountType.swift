//
//  AccountType.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 4/6/16.
//  Copyright © 2016 Coffey. All rights reserved.
//

public enum AccountType:Int32 {
    case unknown, checking, savings, revolvingCredit,
    creditCard, mortgage, secondMtg, medical, auto, student, lease, heloc, creditLine
    
    func isSourceAccount() -> Bool {
        return [.checking, .savings, .revolvingCredit].contains(self)
    }
}
