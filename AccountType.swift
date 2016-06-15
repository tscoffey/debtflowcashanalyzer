//
//  AccountType.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 4/6/16.
//  Copyright © 2016 Coffey. All rights reserved.
//

public enum AccountType:Int32 {
    case Unknown, Checking, Savings, RevolvingCredit,
    CreditCard, Mortgage, SecondMtg, Medical, Auto, Student, Lease, HELOC, CreditLine
    
    func isSourceAccount() -> Bool {
        return [.Checking, .Savings, .RevolvingCredit].contains(self)
    }
}
