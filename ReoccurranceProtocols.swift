//
//  ReoccurranceProtocols.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 4/22/16.
//  Copyright © 2016 Coffey. All rights reserved.
//

import Foundation

protocol IsReoccurringDateCalculator {
    
    func nextDateAfter(date:NSDate)->NSDate?
    func nextDateOnOrAfter(date:NSDate)->NSDate?
    func prevDateBefore(date:NSDate)->NSDate?
    func prevDateOnOrBefore(date:NSDate)->NSDate?
    func datesAfter(date:NSDate)->[NSDate]
    func datesOnOrAfter(date:NSDate)->[NSDate]
    func datesBefore(date:NSDate)->[NSDate]
    func datesOnOrBefore(date:NSDate)->[NSDate]
    func nextDateBetween(startDate:NSDate, toDate:NSDate)->NSDate?
    func nextDatesBetween(startDate:NSDate, toDate:NSDate)->[NSDate]
    
    func daysUntilNextDateOnOrAfter(date:NSDate)->Int
    func daysUntilNextDateAfter(date:NSDate)->Int
    func daysSincePrevDateOnOrBefore(date:NSDate)->Int
    func daysSincePrevDateBefore(date:NSDate)->Int


    

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


