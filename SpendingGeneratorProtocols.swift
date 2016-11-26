//
//  SpendingGeneratorProtocols.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 4/14/16.
//  Copyright © 2016 Coffey. All rights reserved.
//

import Foundation
import CoreData

protocol IsSpendingGenerator:HasModel {
    
}

protocol HasSpendingGenerator {
    var spendingGeneratorIs:IsSpendingGenerator { get set }
}

protocol HasManySpendingGenerators {
    var spendingGeneratorsMutableSet:NSMutableSet { get set }
    var spendingGeneratorsAre:[IsSpendingGenerator] { get }
    func addSpendingGenerator(_ spending:IsSpendingGenerator)->Void
    func removeSpendingGenerator(_ spending:IsSpendingGenerator)->Void
}

extension HasManySpendingGenerators {
    
    var spendingGeneratorsAre:[IsSpendingGenerator] {
        return self.spendingGeneratorsMutableSet.map(){ $0 as! IsSpendingGenerator }
    }
    
    func addSpendingGenerator(_ spendingGenerator:IsSpendingGenerator) -> Void {
        self.spendingGeneratorsMutableSet.add(spendingGenerator as AnyObject)
    }
    
    func removeSpendingGenerator(_ spendingGenerator:IsSpendingGenerator) -> Void {
        self.spendingGeneratorsMutableSet.remove(spendingGenerator as AnyObject)
    }
    
}
