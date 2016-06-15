//
//  ItemSendMethodType.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 5/9/16.
//  Copyright © 2016 Coffey. All rights reserved.
//

enum ItemSendMethodType:Int32 {
    
    case SentByMail, SentByBillPay, PulledFromAccount, PaidInPerson, CategoryDetermines, AccountDetermines
    
    func buttonChoicesFor(source:ProposedItemsClearsSource) -> [String] {
        switch source {
            case .FromPlannedSpending: return ["Mail", "Bill Pay", "Pulled By Payee","In Person", "Use Category", "Use Account"]
            default: return ["Mail", "Bill Pay", "Pulled By Payee","In Person"]
        }
    }
}
