//
//  ProposedPlannedSpending.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 5/9/16.
//  Copyright © 2016 Coffey. All rights reserved.
//

import Foundation
class ProposedPlannedSpending {
    
    var original:IsPlannedSpending?
    var originalType:PlannedSpendingType
    
    var name:String=""
    var amount:NSDecimalNumber=NSDecimalNumber(value: 0.00 as Double)
    var payFrom:IsSourceAccount?=nil
    var firstDate:Date?
    var lastDate:Date?
    var leadDays:Int=0
    var spendCategory:IsSpendCategory?
    var clearsTypes:ProposedItemsClear?
    var defaultMerchantName:String?


    init (from:IsPlannedSpending) {
        original=from
        originalType=from.spendingTypeIs
        self.name=from.nameIs
        self.payFrom=from.sourceAccountIs
        self.firstDate=from.firstDateIs as Date?
        self.lastDate=from.lastDateIs as Date?
        self.leadDays=Int(from.leadDaysIs)
        self.amount=from.amountIs
        self.spendCategory=from.categoryIs
        self.clearsTypes=ProposedItemsClear(from:from,source:.fromPlannedSpending)
        if let defName=from.defaultMerchantIs?.nameIs {
            self.defaultMerchantName=defName
        }
    }
    
}
