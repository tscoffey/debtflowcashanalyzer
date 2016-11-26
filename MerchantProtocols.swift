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
    func addMerchant(_ merchant:IsMerchant)->Void
    func removeMerchant(_ merchant:IsMerchant)->Void
    func findMerchant(_ named:String)->IsMerchant?
}

extension HasManyMerchants {
    
    var merchantsAre:[IsMerchant] {
        return self.merchantsMutableSet.map(){ $0 as! IsMerchant }
    }
    
    var merchantNamesAre:[String] {
        return self.merchantsAre.map(){ $0.nameIs }
    }
    
    func addMerchant(_ merchant:IsMerchant) -> Void {
        self.merchantsMutableSet.add(merchant as AnyObject)
    }
    
    func removeMerchant(_ merchant:IsMerchant) -> Void {
        self.merchantsMutableSet.remove(merchant as AnyObject)
    }
    
    func findMerchant(_ named:String) -> IsMerchant? {
        for aMerchant in self.merchantsAre {
            if aMerchant.nameIs == named { return aMerchant }
        }
        return nil
    }
}



