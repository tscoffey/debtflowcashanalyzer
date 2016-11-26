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
    
    func addBank(_ bank:IsBank) -> Void {
        
    }
    
    func removeBank(_ bank:IsBank) -> Void {
        
    }
    
    func findBank(_ named:String) -> IsBank? {

        return nil
    }
    
    var accountsAre:[IsAccount] {
        return [IsAccount]()
    }
    
    var accountNamesAre:[String] {
        return [String]()
    }
    
    func addAccount(_ account:IsAccount) -> Void {
        
    }
    
    func removeAccount(_ account:IsAccount) -> Void {
        
    }
    
    func findAccount(_ named:String) -> IsAccount? {
        return nil
    }
    
    var categoriesAre:[IsSpendCategory] {
        return [IsSpendCategory]()
    }
    
    var categoryNamesAre:[String] {
        return [String]()
    }
    
    func addCategory(_ category:IsSpendCategory) -> Void {
       
    }
    
    func removeCategory(_ category:IsSpendCategory) -> Void {
        
    }
    
    func findCategory(_ named:String) -> IsSpendCategory? {
        return nil
    }
    
    var merchantsAre:[IsMerchant] {
        return [IsMerchant]()
    }
    
    var merchantNamesAre:[String] {
        return [String]()
    }
    
    func addMerchant(_ merchant:IsMerchant) -> Void {
        
    }
    
    func removeMerchant(_ merchant:IsMerchant) -> Void {
        
    }
    
    func findMerchant(_ named:String) -> IsMerchant? {
        return nil
    }

    var plannedSpendingsAre:[IsPlannedSpending] {
        return [IsPlannedSpending]()
    }
    
    var plannedSpendingNamesAre:[String] {
        return [String]()
    }
    
    func addPlannedSpending(_ plannedSpending:IsPlannedSpending) -> Void {
        
    }
    
    func removePlannedSpending(_ plannedSpending:IsPlannedSpending) -> Void {
        
    }
    
    func findPlannedSpending(_ named:String) -> IsPlannedSpending? {

        return nil
    }
    
    var spendingGeneratorsAre:[IsSpendingGenerator] {
        return [IsSpendingGenerator]()
    }
    
    func addSpendingGenerator(_ spendingGenerator:IsSpendingGenerator) -> Void {
    }
    
    func removeSpendingGenerator(_ spendingGenerator:IsSpendingGenerator) -> Void {
    }
    
    var transactionsAre:[IsTransaction] {
        return [IsTransaction]()
    }
    
    func addTransaction(_ transaction:IsTransaction) -> Void {

    }
    
    func removeTransaction(_ transaction:IsTransaction) -> Void {

    }
    func findTransactions(_ dated:Date, isDueDate:Bool)->[IsTransaction] {
        return [IsTransaction]()
    }
    func findTransactions(_ amountOf:NSDecimalNumber)->[IsTransaction] {
        return [IsTransaction]()
    }
    func findTransactions(_ categoryOf:IsSpendCategory)->[IsTransaction] {
        return [IsTransaction]()
    }
    func findTransactions(_ onAccount:IsSourceAccount)->[IsTransaction] {
        return [IsTransaction]()
    }

    
}


