//
//  BankProtocols.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 4/12/16.
//  Copyright © 2016 Coffey. All rights reserved.
//

import Foundation
import CoreData

protocol HasBankFees {
    var bankLateFeeIs:NSDecimalNumber {get set }
    var bankMinimumPaymentAmountIs:NSDecimalNumber {get set }
    var bankMinimumPaymentPercentIs:NSDecimalNumber {get set }
}

protocol IsBank:HasModel, HasName, HasBankFees, HasManyAccounts {
}

protocol HasBank {
    var bankIs:IsBank { get set }
}

protocol HasManyBanks {
    var banksMutableSet:NSMutableSet { get set }
    var banksAre:[IsBank] { get }
    var bankNamesAre:[String] { get }
    func addBank(bank:IsBank)->Void
    func removeBank(bank:IsBank)->Void
    func findBank(named:String)->IsBank?
}

extension HasManyBanks {
    
    var banksAre:[IsBank] {
        return self.banksMutableSet.map(){ $0 as! IsBank }
    }
    
    var bankNamesAre:[String] {
        return self.banksAre.map(){ $0.nameIs }
    }
    
    func addBank(bank:IsBank) -> Void {
        self.banksMutableSet.addObject(bank as! AnyObject)
    }
    
    func removeBank(bank:IsBank) -> Void {
        self.banksMutableSet.removeObject(bank as! AnyObject)
    }
    
    func findBank(named:String) -> IsBank? {
        for aBank in self.banksAre {
            if aBank.nameIs == named { return aBank }
        }
        return nil
    }
}

