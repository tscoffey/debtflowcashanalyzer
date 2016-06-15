//
//  AccountProtocols.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 4/12/16.
//  Copyright © 2016 Coffey. All rights reserved.
//

import Foundation
import CoreData


protocol IsAccount:HasModel,HasName,HasBank,HasManyTransactions {
    var accountType:AccountType { get set }
    
}

protocol HasAccount {
    var accountIs:IsAccount { get set }
}

protocol HasSourceAccount {
    var sourceAccountIs:IsSourceAccount { get set }
}

protocol HasManyAccounts {
    var accountsMutableSet:NSMutableSet { get set }
    var accountsAre:[IsAccount] { get }
    var accountNamesAre:[String] { get }
    func addAccount(account:IsAccount)->Void
    func removeAccount(account:IsAccount)->Void
    func findAccount(named:String)->IsAccount?
}

extension HasManyAccounts {
    
    var accountsAre:[IsAccount] {
        return self.accountsMutableSet.map(){ $0 as! IsAccount }
    }
    
    var accountNamesAre:[String] {
        return self.accountsAre.map(){ $0.nameIs }
    }
    
    func addAccount(account:IsAccount) -> Void {
        self.accountsMutableSet.addObject(account as! AnyObject)
    }
    
    func removeAccount(account:IsAccount) -> Void {
        self.accountsMutableSet.removeObject(account as! AnyObject)
    }
    
    func findAccount(named:String) -> IsAccount? {
        for aAccount in self.accountsAre {
            if aAccount.nameIs == named { return aAccount }
        }
        return nil
    }
}

protocol HasAccountBalances {
    var accountDatedBalancesMutableSet:NSMutableSet { get set }
    var accountDatedBalancesAre:[IsAccountDatedBalance] { get }
    func accountCurrentBalanceOnDateIs(date:NSDate) -> NSDecimalNumber
    func accountCurrentBalanceIs() -> NSDecimalNumber
    func setInitialBalanceTo(initialBalance:NSDecimalNumber, dated:NSDate)
}

extension HasAccountBalances {
    var accountDatedBalancesAre:[IsAccountDatedBalance] {
        let balances=self.accountDatedBalancesMutableSet
        let r=balances.map(){$0 as! IsAccountDatedBalance}

        return r
    }
}

protocol IsAccountDatedBalance:HasAccount {
    var acctDatedBalanceIs:NSDecimalNumber { get set }
    var acctDatedBalanceDateIs:NSDate { get set }
}

protocol HasManySourceTransactions {
    var acctSourceTransactionsMutableSet:NSMutableSet { get set }
    var acctSourceTransactionsAre:[IsTransaction] { get }
}



protocol IsSourceAccount:IsAccount,HasAccountBalances,HasItemClearsTypes {

    
}



