//
//  ProposedSourceAccount.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 5/10/16.
//  Copyright © 2016 Coffey. All rights reserved.
//

import Foundation

class ProposedSourceAccount:IsProposedChange {
    
    var original:IsSourceAccount?
    var accountsLookup:HasManyAccounts
    var banksLookup:HasManyBanks
    
    var name:String=""
    var bankName:String=""
    var initialBalance:NSDecimalNumber = NSDecimalNumber(value: 0.00 as Double)
    var type:AccountType = .checking
    var clearsTypes:ProposedItemsClear?

    init(from:IsSourceAccount) {
        original=from
        accountsLookup=from.modelIs
        banksLookup=from.modelIs
        name=from.nameIs
        bankName=""
        type=from.accountType
        self.clearsTypes=ProposedItemsClear(from:from,source:.fromSourceAccount)
        initialBalance=from.accountCurrentBalanceIs()
    }

    init (model:IsMediator) {
        self.original=nil
        self.accountsLookup=model
        self.banksLookup=model
        clearsTypes=ProposedItemsClear(source:.fromSourceAccount)
    }
    
    init (accountsLookup:HasManyAccounts, banksLookup:HasManyBanks) {
        self.original=nil
        self.accountsLookup=accountsLookup
        self.banksLookup=banksLookup
        clearsTypes=ProposedItemsClear(source:.fromSourceAccount)
    }
    
    func isEditingNew() -> Bool {
        return original == nil
    }
    func isEditingOld() -> Bool {
        return original != nil
    }
    
    func nameAlreadyExists() -> Bool {
        return self.accountsLookup.accountNamesAre.contains(self.name)
    }
    
    func nameChangedFromOriginal() -> Bool {
        return self.isEditingOld() && self.name != self.original!.nameIs
    }
    
    func nameIsValid() -> Bool {
        if self.name.characters.count == 0 { return false }
        if self.isEditingNew() {
            return self.nameAlreadyExists() == false
        } else {
            return self.nameChangedFromOriginal() && !self.nameAlreadyExists()
        }
    }
    func bankIsValid() -> Bool {
        return self.bankName.characters.count > 0
    }
    
    func isValidAsProposed() -> Bool {
        return (self.nameIsValid())
                &&
                (self.bankIsValid())
                &&
               (self.clearsTypes!.howClears != .clearsAutomatically || self.clearsTypes!.clearedAfterDaysOrZero() > 0)
    }
}
