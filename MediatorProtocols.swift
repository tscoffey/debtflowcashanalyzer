//
//  MediatorProtocols.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 4/12/16.
//  Copyright © 2016 Coffey. All rights reserved.
//

import Foundation
import CoreData

protocol IsMediator:HasName,HasManyBanks,HasManyAccounts,HasManySpendCategories,
HasManyMerchants,HasManyPlannedSpendings,HasManySpendingGenerators, HasManyTransactions, HasSpendingOptions {
    
    var modelContext:NSManagedObjectContext { get }
    
}

protocol HasModel {
    var modelIs:IsMediator { get set }
    var modelContext:NSManagedObjectContext {get }
}

extension HasModel {
    var modelContext:NSManagedObjectContext { return self.modelIs.modelContext }
}

protocol IsStubbedMediator:IsMediator {
    
}

extension IsStubbedMediator {
    var nameIs:String {
        get { return "stubbed mediator" }
        set (aValue) { }
    }
    
    var banksMutableSet:NSMutableSet {
        get { return NSMutableSet() }
        set (aValue) {
            
        }
    }
    
    var accountsMutableSet:NSMutableSet {
        get { return NSMutableSet() }
        set (aValue) {
           
        }
    }
    
    var categoriesMutableSet:NSMutableSet {
        get {
            return NSMutableSet()
        }
        set (aValue) {
            
        }
    }
    
    var merchantsMutableSet:NSMutableSet {
        get { return NSMutableSet() }
        set (aValue) {
            
        }
    }
    
    var plannedSpendingsMutableSet:NSMutableSet {
        get { return NSMutableSet() }
        set (aValue) {
            
        }
    }
    
    var spendingGeneratorsMutableSet:NSMutableSet {
        get { return NSMutableSet()}
        set (aValue) {
            
        }
    }
    
    var transactionsMutableSet:NSMutableSet {
        get { return NSMutableSet()}
        set (aValue) {
            
        }
    }
    
    var spendingOptionsIs:IsSpendingOptions {
        get { return StubbedSpendingOptions()  }
        set (aValue) {

        }
    }

    var banksAre:[IsBank] {
        return [IsBank]()
    }
    
    var bankNamesAre:[String] {
        return [String]()
    }
    
    func addBank(bank:IsBank) -> Void {
        
    }
    
    func removeBank(bank:IsBank) -> Void {
        
    }
    
    func findBank(named:String) -> IsBank? {

        return nil
    }
    
    var accountsAre:[IsAccount] {
        return [IsAccount]()
    }
    
    var accountNamesAre:[String] {
        return [String]()
    }
    
    func addAccount(account:IsAccount) -> Void {
        
    }
    
    func removeAccount(account:IsAccount) -> Void {
        
    }
    
    func findAccount(named:String) -> IsAccount? {
        return nil
    }
    
    var categoriesAre:[IsSpendCategory] {
        return [IsSpendCategory]()
    }
    
    var categoryNamesAre:[String] {
        return [String]()
    }
    
    func addCategory(category:IsSpendCategory) -> Void {
       
    }
    
    func removeCategory(category:IsSpendCategory) -> Void {
        
    }
    
    func findCategory(named:String) -> IsSpendCategory? {
        return nil
    }
    
    var merchantsAre:[IsMerchant] {
        return [IsMerchant]()
    }
    
    var merchantNamesAre:[String] {
        return [String]()
    }
    
    func addMerchant(merchant:IsMerchant) -> Void {
        
    }
    
    func removeMerchant(merchant:IsMerchant) -> Void {
        
    }
    
    func findMerchant(named:String) -> IsMerchant? {
        return nil
    }

    var plannedSpendingsAre:[IsPlannedSpending] {
        return [IsPlannedSpending]()
    }
    
    var plannedSpendingNamesAre:[String] {
        return [String]()
    }
    
    func addPlannedSpending(plannedSpending:IsPlannedSpending) -> Void {
        
    }
    
    func removePlannedSpending(plannedSpending:IsPlannedSpending) -> Void {
        
    }
    
    func findPlannedSpending(named:String) -> IsPlannedSpending? {

        return nil
    }
    
    var spendingGeneratorsAre:[IsSpendingGenerator] {
        return [IsSpendingGenerator]()
    }
    
    func addSpendingGenerator(spendingGenerator:IsSpendingGenerator) -> Void {
    }
    
    func removeSpendingGenerator(spendingGenerator:IsSpendingGenerator) -> Void {
    }
    
    var transactionsAre:[IsTransaction] {
        return [IsTransaction]()
    }
    
    func addTransaction(transaction:IsTransaction) -> Void {

    }
    
    func removeTransaction(transaction:IsTransaction) -> Void {

    }
    func findTransactions(dated:NSDate, isDueDate:Bool)->[IsTransaction] {
        return [IsTransaction]()
    }
    func findTransactions(amountOf:NSDecimalNumber)->[IsTransaction] {
        return [IsTransaction]()
    }
    func findTransactions(categoryOf:IsSpendCategory)->[IsTransaction] {
        return [IsTransaction]()
    }
    func findTransactions(onAccount:IsSourceAccount)->[IsTransaction] {
        return [IsTransaction]()
    }

    
}


