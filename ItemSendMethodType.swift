//
//  ItemSendMethodType.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 5/9/16.
//  Copyright © 2016 Coffey. All rights reserved.
//

enum ItemSendMethodType:Int32 {
    
    case sentByMail, sentByBillPay, pulledFromAccount, paidInPerson, categoryDetermines, accountDetermines
    
    func buttonChoicesFor(_ source:ProposedItemsClearsSource) -> [String] {
        switch source {
            case .fromPlannedSpending: return ["Mail", "Bill Pay", "Pulled By Payee","In Person", "Use Category", "Use Account"]
            default: return ["Mail", "Bill Pay", "Pulled By Payee","In Person"]
        }
    }
}
