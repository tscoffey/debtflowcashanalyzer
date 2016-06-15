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
    
    class func ofType(type:ReoccurranceType, insertIntoContext context:NSManagedObjectContext) -> Reoccurrance? {
        let newOne=NSEntityDescription.insertNewObjectForEntityForName(entityName, inManagedObjectContext: context) as! Reoccurrance
        newOne.reoccursTypeIndex=type.rawValue
        
        return newOne
    }
    
    class func ofType(type:ReoccurranceType, values:[(Int,Int,Int)], insertIntoContext context:NSManagedObjectContext) -> Reoccurrance? {
        
        let newOne=self.ofType(type, insertIntoContext: context)
        for each:(Int,Int,Int) in values {
            _=OccursValues.values(each, insertIntoReoccurrance: newOne!)
        }
        return newOne
    }
    
    class func monthlyOn(day:Int, insertIntoContext context:NSManagedObjectContext) -> Reoccurrance? {
        return self.ofType(.Monthly, values: [(day,0,0)], insertIntoContext: context)
    }
    
    class func weeklyOn(weekday:Int, insertIntoContext context:NSManagedObjectContext)  -> Reoccurrance? {
        return self.ofType(.Weekly,  values: [(weekday,0,0)], insertIntoContext: context)
    }

    lazy var calculator: IsReoccurringDateCalculator = {
        [unowned self] in
        return AbstractDateCalculator(firstDate:nil, lastDate:nil, dateMitigation:SpendingDateMitigation.DoNotShift)
//        return self.reoccuranceTypeIs.dateCalculator(self.occursDataIs,
//            firstDate: self.plannedSpendingIs.firstDateIs,
//            lastDate: self.plannedSpendingIs.lastDateIs,
//            dateMitigation:self.plannedSpendingIs.modelIs.spendingOptionsIs.weekendsAndHolidayMitigationIs)
    }()
    
    var recursType:ReoccurranceType = .Monthly
    
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
        get { return self.mutableSetValueForKey("occursValues") }
        set (aValue) {self.occursValues = aValue }
    }
    
    var occursValuesArrayIs:[OccursValues] {
        return self.occursValuesMutableSet.map() {$0 as! OccursValues }
        
    }
    
    var occursDataIs: [OccursDataTriple] {
        return self.occursValuesArrayIs.map() { $0.dataTriple() }
    }
    
    
    func nextDateAfter(date:NSDate)->NSDate? {
        return self.calculator.nextDateAfter(date)
    }
    func nextDateOnOrAfter(date:NSDate)->NSDate? {
        return self.calculator.nextDateOnOrAfter(date)
    }

    func prevDateBefore(date:NSDate)->NSDate? {
        return self.calculator.prevDateBefore(date)
    }

    func prevDateOnOrBefore(date:NSDate)->NSDate? {
        return self.calculator.prevDateOnOrBefore(date)
    }

    func datesAfter(date:NSDate)->[NSDate] {
        return self.calculator.datesAfter(date)
    }

    func datesOnOrAfter(date:NSDate)->[NSDate] {
        return self.calculator.datesOnOrAfter(date)
    }
    func datesBefore(date:NSDate)->[NSDate] {
        return self.calculator.datesBefore(date)
    }
    func datesOnOrBefore(date:NSDate)->[NSDate] {
        return self.calculator.datesOnOrBefore(date)
    }
    
    func daysUntilNextDateOnOrAfter(date:NSDate)->Int {
        return self.calculator.daysUntilNextDateOnOrAfter(date)
    }
    func daysUntilNextDateAfter(date:NSDate)->Int {
        return self.calculator.daysUntilNextDateAfter(date)
    }
    func daysSincePrevDateOnOrBefore(date:NSDate)->Int {
        return self.calculator.daysSincePrevDateOnOrBefore(date)
    }
    func daysSincePrevDateBefore(date:NSDate)->Int {
        return self.calculator.daysSincePrevDateBefore(date)
    }

    func nextDateBetween(startDate:NSDate, toDate:NSDate)->NSDate? {
        return self.calculator.nextDateBetween(startDate, toDate: toDate)
    }
    
    func nextDatesBetween(startDate:NSDate, toDate:NSDate)->[NSDate] {
        return self.calculator.nextDatesBetween(startDate, toDate: toDate)
    }


}
