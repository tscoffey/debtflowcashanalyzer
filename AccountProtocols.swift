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
    func addAccount(_ account:IsAccount)->Void
    func removeAccount(_ account:IsAccount)->Void
    func findAccount(_ named:String)->IsAccount?
}

extension HasManyAccounts {
    
    var accountsAre:[IsAccount] {
        return self.accountsMutableSet.map(){ $0 as! IsAccount }
    }
    
    var accountNamesAre:[String] {
        return self.accountsAre.map(){ $0.nameIs }
    }
    
    func addAccount(_ account:IsAccount) -> Void {
        self.accountsMutableSet.add(account as AnyObject)
    }
    
    func removeAccount(_ account:IsAccount) -> Void {
        self.accountsMutableSet.remove(account as AnyObject)
    }
    
    func findAccount(_ named:String) -> IsAccount? {
        for aAccount in self.accountsAre {
            if aAccount.nameIs == named { return aAccount }
        }
        return nil
    }
}

protocol HasAccountBalances {
    var accountDatedBalancesMutableSet:NSMutableSet { get set }
    var accountDatedBalancesAre:[IsAccountDatedBalance] { get }
    func accountCurrentBalanceOnDateIs(_ date:Date) -> NSDecimalNumber
    func accountCurrentBalanceIs() -> NSDecimalNumber
    func setInitialBalanceTo(_ initialBalance:NSDecimalNumber, dated:Date)
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
    var acctDatedBalanceDateIs:Date { get set }
}

protocol HasManySourceTransactions {
    var acctSourceTransactionsMutableSet:NSMutableSet { get set }
    var acctSourceTransactionsAre:[IsTransaction] { get }
}



protocol IsSourceAccount:IsAccount,HasAccountBalances,HasItemClearsTypes {

    
}



