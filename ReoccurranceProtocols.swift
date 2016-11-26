//
//  ReoccurranceProtocols.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 4/22/16.
//  Copyright © 2016 Coffey. All rights reserved.
//

import Foundation

protocol IsReoccurringDateCalculator {
    
    func nextDateAfter(_ date:Date)->Date?
    func nextDateOnOrAfter(_ date:Date)->Date?
    func prevDateBefore(_ date:Date)->Date?
    func prevDateOnOrBefore(_ date:Date)->Date?
    func datesAfter(_ date:Date)->[Date]
    func datesOnOrAfter(_ date:Date)->[Date]
    func datesBefore(_ date:Date)->[Date]
    func datesOnOrBefore(_ date:Date)->[Date]
    func nextDateBetween(_ startDate:Date, toDate:Date)->Date?
    func nextDatesBetween(_ startDate:Date, toDate:Date)->[Date]
    
    func daysUntilNextDateOnOrAfter(_ date:Date)->Int
    func daysUntilNextDateAfter(_ date:Date)->Int
    func daysSincePrevDateOnOrBefore(_ date:Date)->Int
    func daysSincePrevDateBefore(_ date:Date)->Int


    

}
protocol IsReoccurrance:HasPlannedSpending,IsReoccurringDateCalculator {
    var reoccuranceTypeIs:ReoccurranceType { get set }
    var occursValuesMutableSet: NSMutableSet { get set }
    var occursValuesArrayIs:[OccursValues] { get }
    var occursDataIs:[OccursDataTriple] { get }
    func isEmpty()->Bool
    func isSingle()->Bool
    func isMultiple()->Bool
}

extension IsReoccurrance {
    
    func isEmpty()->Bool {
        return self.occursDataIs.count == 0
    }

    func isSingle()->Bool {
        return self.occursDataIs.count == 1
    }
    
    func isMultiple()->Bool {
        return self.occursDataIs.count > 1
    }

}

protocol HasReoccurrance {
    var reoccurranceIs:Reoccurrance { get set }
}


