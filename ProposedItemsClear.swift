//
//  ProposedItemsClear.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 5/16/16.
//  Copyright © 2016 Coffey. All rights reserved.
//

import Foundation

enum ProposedItemsClearsSource:Int  {
    case FromPlannedSpending, FromCategory, FromSourceAccount
    
    func mainEditDescription() -> String {
        switch self {
        case .FromPlannedSpending: return "Spending Clear/Send Settings"
        case .FromCategory: return "Category Default Clear/Send Settings"
        case .FromSourceAccount: return "Source Default Clear/Send Settings"
        }
    }
    
}

class ProposedItemsClear:IsProposedChange {
    
    var original:HasItemClearsTypes?
    
    var source:ProposedItemsClearsSource = .FromPlannedSpending
    var whenClears:ClearsDateType
    var amountClears:ClearsAmountType
    var howClears:ClearsMethodType
    var sendsMethod:ItemSendMethodType
    var clearedAfterDays:NSNumber?
    
    var editorLabelText:String {
        switch self.source {
            case .FromCategory: return "Category Clear Settings"
            case .FromSourceAccount: return "Source Account Clear Settings"
            case .FromPlannedSpending: return "Spending Clears Items"
        }
    }
    
    var howManyDaysLabelText:String {
        
        switch self.whenClears {
            case .ClearsDaysAfterSendDate, .ClearsDaysAfterDueDate: return "How many days after?"
            case .ClearsDaysBeforeDueDate: return "How many days before?"
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
        self.source = .FromSourceAccount
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
        whenClears=ClearsDateType.ClearsOnSendDate
        amountClears=ClearsAmountType.ClearsForExactAmount
        howClears=ClearsMethodType.ClearsManually
        sendsMethod=ItemSendMethodType.SentByMail
        clearedAfterDays=nil
        self.source=source
    }
    
    func clearedAfterDaysOrZero() -> Int {
        if clearedAfterDays == nil {
            return 0
        } else {
            return Int((clearedAfterDays!.intValue))
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
