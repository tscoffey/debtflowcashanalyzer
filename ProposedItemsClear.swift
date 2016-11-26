//
//  ProposedItemsClear.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 5/16/16.
//  Copyright © 2016 Coffey. All rights reserved.
//

import Foundation

enum ProposedItemsClearsSource:Int  {
    case fromPlannedSpending, fromCategory, fromSourceAccount
    
    func mainEditDescription() -> String {
        switch self {
        case .fromPlannedSpending: return "Spending Clear/Send Settings"
        case .fromCategory: return "Category Default Clear/Send Settings"
        case .fromSourceAccount: return "Source Default Clear/Send Settings"
        }
    }
    
}

class ProposedItemsClear:IsProposedChange {
    
    var original:HasItemClearsTypes?
    
    var source:ProposedItemsClearsSource = .fromPlannedSpending
    var whenClears:ClearsDateType
    var amountClears:ClearsAmountType
    var howClears:ClearsMethodType
    var sendsMethod:ItemSendMethodType
    var clearedAfterDays:NSNumber?
    
    var editorLabelText:String {
        switch self.source {
            case .fromCategory: return "Category Clear Settings"
            case .fromSourceAccount: return "Source Account Clear Settings"
            case .fromPlannedSpending: return "Spending Clears Items"
        }
    }
    
    var howManyDaysLabelText:String {
        
        switch self.whenClears {
            case .clearsDaysAfterSendDate, .clearsDaysAfterDueDate: return "How many days after?"
            case .clearsDaysBeforeDueDate: return "How many days before?"
            default: return ""
        }

    }
    
    init (from:IsSourceAccount) {
        original=from
        self.whenClears=from.itemWhenClearsIs
        self.howClears=from.itemHowClearsIs
        self.amountClears=from.itemAmountClearsIs
        self.sendsMethod=from.itemSendMethodTypeIs
        self.clearedAfterDays=from.clearsAfterDaysIs
        self.source = .fromSourceAccount
    }
    init (from:HasItemClearsTypes, source:ProposedItemsClearsSource) {
        original=from
        self.whenClears=from.itemWhenClearsIs
        self.howClears=from.itemHowClearsIs
        self.amountClears=from.itemAmountClearsIs
        self.sendsMethod=from.itemSendMethodTypeIs
        self.clearedAfterDays=from.clearsAfterDaysIs
        self.source=source
    }
    
    init (source:ProposedItemsClearsSource) {
        original=nil
        whenClears=ClearsDateType.clearsOnSendDate
        amountClears=ClearsAmountType.clearsForExactAmount
        howClears=ClearsMethodType.clearsManually
        sendsMethod=ItemSendMethodType.sentByMail
        clearedAfterDays=nil
        self.source=source
    }
    
    func clearedAfterDaysOrZero() -> Int {
        if clearedAfterDays == nil {
            return 0
        } else {
            return Int((clearedAfterDays!.int32Value))
        }
    }
    
    func isEditingNew() -> Bool {
        return original == nil
    }
    
    func isEditingOld() -> Bool {
        return original != nil
    }
    
    func isValidAsProposed() -> Bool {
        return true
    }
    
    
    
}
