//
//  OccursData.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 5/26/16.
//  Copyright © 2016 Coffey. All rights reserved.
//

import Foundation
typealias OccursValueUsageTriple=(OccursValueUsageType,OccursValueUsageType,OccursValueUsageType)

class OccursData {
    
    class func empty()->OccursData {
        return OccursData()
        
    }
    class func monthlyOn(dayOfMonth:Int)->OccursData {
        return OccursData(type:ReoccurranceType.Monthly,data:[(dayOfMonth,0,0)],firstDate:nil, lastDate:nil)
    }
    class func weeklyOn(dayOfWeek:Int)->OccursData {
        return OccursData(type:ReoccurranceType.Weekly,data:[(dayOfWeek,0,0)],firstDate:nil, lastDate:nil)
    }
    
    var data:[OccursDataTriple]?
    var dataTypes:[OccursValueUsageType]
    var type:ReoccurranceType?
    var firstDate: NSDate?
    var lastDate: NSDate?
    
    init() {
        data=[]
        dataTypes=[OccursValueUsageType.Unused,OccursValueUsageType.Unused,OccursValueUsageType.Unused]
        type=ReoccurranceType.OneTime
        firstDate=nil
        lastDate=nil
    }
    init(type:ReoccurranceType, data:[OccursDataTriple]?, firstDate:NSDate?, lastDate:NSDate?) {
        self.type=type
        self.data=data
        let triple=self.type!.occursValueUsageTriple()
        self.dataTypes=[triple.0,triple.1,triple.2]
        self.firstDate=firstDate
        self.lastDate=lastDate
    }
    init(type:ReoccurranceType, data:[OccursDataTriple]?) {
        self.type=type
        self.data=data
        let triple=self.type!.occursValueUsageTriple()
        self.dataTypes=[triple.0,triple.1,triple.2]
        self.firstDate=nil
        self.lastDate=nil
    }
    
    init(from:IsReoccurrance) {
        self.type=from.reoccuranceTypeIs
        self.data=from.occursDataIs
        let triple=self.type!.occursValueUsageTriple()
        self.dataTypes=[triple.0,triple.1,triple.2]
        self.firstDate=nil
        self.lastDate=nil
    }
    
    init (from:IsPlannedSpending) {
        self.type=from.reoccurranceIs.reoccuranceTypeIs
        self.data=from.reoccurranceIs.occursDataIs
        let triple=self.type!.occursValueUsageTriple()
        self.dataTypes=[triple.0,triple.1,triple.2]
        
        self.firstDate=from.firstDateIs
        self.lastDate=from.lastDateIs
    }
    
    init (from:OccursData) {
        self.type=from.type
        self.data=from.data
        self.dataTypes=from.dataTypes
        self.firstDate=from.firstDate
        self.lastDate=from.lastDate
    }
    
    func hasUsageType(type:OccursValueUsageType)->Bool {
        for i in dataTypes {
            if i == type { return true }
        }
        return false
    }
    
    func indexOfType(type:OccursValueUsageType) -> NSNumber? {
        for i in 0...2 {
            if dataTypes[i] == type { return i }
        }
        return nil
    }
    
    func valueFor(type:OccursValueUsageType, triple:OccursDataTriple) -> Int? {
        if let num=self.indexOfType(type) {
            let i=num.intValue
            if i == 0 {return triple.0}
            if i == 1 {return triple.1}
            if i == 2 {return triple.2}
        }
        return nil
    }
    func valueIs(type:OccursValueUsageType, index:Int, value:Int) {
        if let num=self.indexOfType(type) {
            if data == nil {
                data=[OccursDataTriple]()
            }
            if var d=data {
                while d.count < index + 1 {
                    d.append((0,0,0))
                }
            }
            let i=num.intValue
            if i == 0 {data![index].0 = value}
            if i == 1 {data![index].1 = value}
            if i == 2 {data![index].2 = value}
        }
    }

    
    func occursChooserArray(with:IsOccursContentDataSource) -> OccursSingleControlArray {
        return self.type!.occursChooserArray(with: self)
    }
    
}

extension OccursData:IsOccursContentDataSource {
    
    var reoccurranceType:ReoccurranceType? {
        get { return type }
        set (aValue) { type=aValue }
    }
    
    var dayOfMonth:Int? {
        get {
            if self.isSingle() {
                return self.valueFor(.DayOfMonth, triple: data![0])
            } else {
                return nil
            }
        }
        set (aValue) { self.valueIs( .DayOfMonth, index: 0 , value: aValue!)}
    }
    var dayOfQuarter:Int? {
        get {
            if self.isSingle() {
                return self.valueFor(.DayOfQuarter, triple: data![0])
            } else {
                return nil
            }
        }
        set (aValue) { self.valueIs( .DayOfQuarter, index: 0 , value: aValue!)}
    }
    var firstDayOfMonth:Int? {
        get {
            if self.isMultiple() {
                return self.valueFor(.DayOfMonth, triple: data![0])
            } else {
                return nil
            }
        }
        set (aValue) { self.valueIs( .DayOfMonth, index: 0 , value: aValue!)}
    }
    var secondDayOfMonth:Int? {
        get {
            if self.isMultiple() {
                return self.valueFor(.DayOfMonth, triple: data![1])
            } else {
                return nil
            }
        }
        set (aValue) { self.valueIs( .DayOfMonth, index: 1 , value: aValue!)}
    }
    
    var weekday:Int? {
        get {
            if self.isSingle() {
                return self.valueFor(.DayOfWeek, triple: data![0])
            } else {
                return nil
            }
        }
        set (aValue) { self.valueIs( .DayOfWeek, index: 0 , value: aValue!)}
    }
    var weekOfMonth:Int? {
        get {
            if self.isSingle() {
                return self.valueFor(.WeekOfMonth, triple: data![0])
            } else {
                return nil
            }
        }
        set (aValue) { self.valueIs( .WeekOfMonth, index: 0 , value: aValue!)}
    }
    var weekOfQuarter:Int? {
        get {
            if self.isSingle() {
                return self.valueFor(.WeekOfQuarter, triple: data![0])
            } else {
                return nil
            }
        }
        set (aValue) { self.valueIs( .WeekOfQuarter, index: 0 , value: aValue!)}
    }
    var weekOfHalfYear:Int? {
        get {
            if self.isSingle() {
                return self.valueFor(.WeekOfHalfYear, triple: data![0])
            } else {
                return nil
            }
        }
        set (aValue) { self.valueIs( .WeekOfHalfYear, index: 0 , value: aValue!)}
    }
    var weekOfYear:Int? {
        get {
            if self.isSingle() {
                return self.valueFor(.WeekOfYear, triple: data![0])
            } else {
                return nil
            }
        }
        set (aValue) { self.valueIs( .WeekOfYear, index: 0 , value: aValue!)}
    }
    var monthOfQuarter:Int? {
        get {
            if self.isSingle() {
                return self.valueFor(.MonthOfQuarter, triple: data![0])
            } else {
                return nil
            }
        }
        set (aValue) { self.valueIs( .MonthOfQuarter, index: 0 , value: aValue!)}
    }
    var monthOfHalfYear:Int? {
        get {
            if self.isSingle() {
                return self.valueFor(.MonthOfHalfYear, triple: data![0])
            } else {
                return nil
            }
        }
        set (aValue) { self.valueIs( .MonthOfHalfYear, index: 0 , value: aValue!)}
    }
    var monthOfYear:Int? {
        get {
            if self.isSingle() {
                return self.valueFor(.MonthOfYear, triple: data![0])
            } else {
                return nil
            }
        }
        set (aValue) { self.valueIs( .MonthOfYear, index: 0 , value: aValue!)}
    }
    var quarterOfYear:Int? {
        get {
            if self.isSingle() {
                return self.valueFor(.QuarterOfYear, triple: data![0])
            } else {
                return nil
            }
        }
        set (aValue) { self.valueIs( .QuarterOfYear, index: 0 , value: aValue!)}
    }
    var year:Int? {
        get {
            if self.isSingle() {
                return self.valueFor(.QuarterOfYear, triple: data![0])
            } else {
                return nil
            }
        }
        set (aValue) { self.valueIs( .QuarterOfYear, index: 0 , value: aValue!)}
    }
    
    var firstUsedDate:NSDate? {
        get { return firstDate }
        set (aValue) { firstDate=aValue }
    }
    var lastUsedDate:NSDate? {
        get { return lastDate }
        set (aValue) { lastDate=aValue }
    }
    
    func isEmpty() -> Bool {
        if var d=self.data {
            return d.count == 0
        } else {
            return true
        }
    }
    func isSingle() -> Bool {
        if var d=self.data {
            return d.count == 1
        } else {
            return false
        }
    }
    func isMultiple() -> Bool {
        if var d=self.data {
            return d.count > 1
        } else {
            return false
        }
    }




    
}

