//
//  Reoccurrance.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 4/6/16.
//  Copyright © 2016 Coffey. All rights reserved.
//

import Foundation
import CoreData


class Reoccurrance: NSManagedObject,IsReoccurrance {
    
    static var entityName="Reoccurrance"
    
    class func ofType(_ type:ReoccurranceType, insertIntoContext context:NSManagedObjectContext) -> Reoccurrance? {
        let newOne=NSEntityDescription.insertNewObject(forEntityName: entityName, into: context) as! Reoccurrance
        newOne.reoccursTypeIndex=type.rawValue
        
        return newOne
    }
    
    class func ofType(_ type:ReoccurranceType, values:[(Int,Int,Int)], insertIntoContext context:NSManagedObjectContext) -> Reoccurrance? {
        
        let newOne=self.ofType(type, insertIntoContext: context)
        for each:(Int,Int,Int) in values {
            _=OccursValues.values(each, insertIntoReoccurrance: newOne!)
        }
        return newOne
    }
    
    class func monthlyOn(_ day:Int, insertIntoContext context:NSManagedObjectContext) -> Reoccurrance? {
        return self.ofType(.monthly, values: [(day,0,0)], insertIntoContext: context)
    }
    
    class func weeklyOn(_ weekday:Int, insertIntoContext context:NSManagedObjectContext)  -> Reoccurrance? {
        return self.ofType(.weekly,  values: [(weekday,0,0)], insertIntoContext: context)
    }

    lazy var calculator: IsReoccurringDateCalculator = {
        [unowned self] in
        return AbstractDateCalculator(firstDate:nil, lastDate:nil, dateMitigation:SpendingDateMitigation.doNotShift)
//        return self.reoccuranceTypeIs.dateCalculator(self.occursDataIs,
//            firstDate: self.plannedSpendingIs.firstDateIs,
//            lastDate: self.plannedSpendingIs.lastDateIs,
//            dateMitigation:self.plannedSpendingIs.modelIs.spendingOptionsIs.weekendsAndHolidayMitigationIs)
    }()
    
    var recursType:ReoccurranceType = .monthly
    
    var reoccuranceTypeIs: ReoccurranceType {
        get { recursType = ReoccurranceType(rawValue: self.reoccursTypeIndex)!
              return recursType
            }
        set (aValue) { recursType=aValue
            self.reoccursTypeIndex = aValue.rawValue
        }
    }
    
    var plannedSpendingIs: IsPlannedSpending {
        get {return self.plannedSpending as! IsPlannedSpending }
        set (aValue) { self.plannedSpending = (aValue as! PlannedSpending) }
    }
    
    var occursValuesMutableSet: NSMutableSet {
        get { return self.mutableSetValue(forKey: "occursValues") }
        set (aValue) {self.occursValues = aValue }
    }
    
    var occursValuesArrayIs:[OccursValues] {
        return self.occursValuesMutableSet.map() {$0 as! OccursValues }
        
    }
    
    var occursDataIs: [OccursDataTriple] {
        return self.occursValuesArrayIs.map() { $0.dataTriple() }
    }
    
    
    func nextDateAfter(_ date:Date)->Date? {
        return self.calculator.nextDateAfter(date)
    }
    func nextDateOnOrAfter(_ date:Date)->Date? {
        return self.calculator.nextDateOnOrAfter(date)
    }

    func prevDateBefore(_ date:Date)->Date? {
        return self.calculator.prevDateBefore(date)
    }

    func prevDateOnOrBefore(_ date:Date)->Date? {
        return self.calculator.prevDateOnOrBefore(date)
    }

    func datesAfter(_ date:Date)->[Date] {
        return self.calculator.datesAfter(date)
    }

    func datesOnOrAfter(_ date:Date)->[Date] {
        return self.calculator.datesOnOrAfter(date)
    }
    func datesBefore(_ date:Date)->[Date] {
        return self.calculator.datesBefore(date)
    }
    func datesOnOrBefore(_ date:Date)->[Date] {
        return self.calculator.datesOnOrBefore(date)
    }
    
    func daysUntilNextDateOnOrAfter(_ date:Date)->Int {
        return self.calculator.daysUntilNextDateOnOrAfter(date)
    }
    func daysUntilNextDateAfter(_ date:Date)->Int {
        return self.calculator.daysUntilNextDateAfter(date)
    }
    func daysSincePrevDateOnOrBefore(_ date:Date)->Int {
        return self.calculator.daysSincePrevDateOnOrBefore(date)
    }
    func daysSincePrevDateBefore(_ date:Date)->Int {
        return self.calculator.daysSincePrevDateBefore(date)
    }

    func nextDateBetween(_ startDate:Date, toDate:Date)->Date? {
        return self.calculator.nextDateBetween(startDate, toDate: toDate)
    }
    
    func nextDatesBetween(_ startDate:Date, toDate:Date)->[Date] {
        return self.calculator.nextDatesBetween(startDate, toDate: toDate)
    }


}
