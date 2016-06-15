//
//  MerchantProtocols.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 4/12/16.
//  Copyright © 2016 Coffey. All rights reserved.
//

import Foundation
import CoreData

protocol IsMerchant:HasModel,HasName {
    
}


protocol HasMerchant {
    var merchantIs:IsMerchant { get set }
}

protocol HasManyMerchants {
    var merchantsMutableSet:NSMutableSet { get set }
    var merchantsAre:[IsMerchant] { get }
    var merchantNamesAre:[String] { get }
    func addMerchant(merchant:IsMerchant)->Void
    func removeMerchant(merchant:IsMerchant)->Void
    func findMerchant(named:String)->IsMerchant?
}

extension HasManyMerchants {
    
    var merchantsAre:[IsMerchant] {
        return self.merchantsMutableSet.map(){ $0 as! IsMerchant }
    }
    
    var merchantNamesAre:[String] {
        return self.merchantsAre.map(){ $0.nameIs }
    }
    
    func addMerchant(merchant:IsMerchant) -> Void {
        self.merchantsMutableSet.addObject(merchant as! AnyObject)
    }
    
    func removeMerchant(merchant:IsMerchant) -> Void {
        self.merchantsMutableSet.removeObject(merchant as! AnyObject)
    }
    
    func findMerchant(named:String) -> IsMerchant? {
        for aMerchant in self.merchantsAre {
            if aMerchant.nameIs == named { return aMerchant }
        }
        return nil
    }
}



