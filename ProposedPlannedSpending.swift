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
    var amount:NSDecimalNumber=NSDecimalNumber(double: 0.00)
    var payFrom:IsSourceAccount?=nil
    var firstDate:NSDate?
    var lastDate:NSDate?
    var leadDays:Int=0
    var spendCategory:IsSpendCategory?
    var clearsTypes:ProposedItemsClear?
    var defaultMerchantName:String?


    init (from:IsPlannedSpending) {
        original=from
        originalType=from.spendingTypeIs
        self.name=from.nameIs
        self.payFrom=from.sourceAccountIs
        self.firstDate=from.firstDateIs
        self.lastDate=from.lastDateIs
        self.leadDays=Int(from.leadDaysIs)
        self.amount=from.amountIs
        self.spendCategory=from.categoryIs
        self.clearsTypes=ProposedItemsClear(from:from,source:.FromPlannedSpending)
        if let defName=from.defaultMerchantIs?.nameIs {
            self.defaultMerchantName=defName
        }
    }
    
}
