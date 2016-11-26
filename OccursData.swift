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
    class func monthlyOn(_ dayOfMonth:Int)->OccursData {
        return OccursData(type:ReoccurranceType.monthly,data:[(dayOfMonth,0,0)],firstDate:nil, lastDate:nil)
    }
    class func weeklyOn(_ dayOfWeek:Int)->OccursData {
        return OccursData(type:ReoccurranceType.weekly,data:[(dayOfWeek,0,0)],firstDate:nil, lastDate:nil)
    }
    
    var data:[OccursDataTriple]?
    var dataTypes:[OccursValueUsageType]
    var type:ReoccurranceType?
    var firstDate: Date?
    var lastDate: Date?
    
    init() {
        data=[]
        dataTypes=[OccursValueUsageType.unused,OccursValueUsageType.unused,OccursValueUsageType.unused]
        type=ReoccurranceType.oneTime
        firstDate=nil
        lastDate=nil
    }
    init(type:ReoccurranceType, data:[OccursDataTriple]?, firstDate:Date?, lastDate:Date?) {
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
        
        self.firstDate=from.firstDateIs as Date?
        self.lastDate=from.lastDateIs as Date?
    }
    
    init (from:OccursData) {
        self.type=from.type
        self.data=from.data
        self.dataTypes=from.dataTypes
        self.firstDate=from.firstDate
        self.lastDate=from.lastDate
    }
    
    func hasUsageType(_ type:OccursValueUsageType)->Bool {
        for i in dataTypes {
            if i == type { return true }
        }
        return false
    }
    
    func indexOfType(_ type:OccursValueUsageType) -> NSNumber? {
        for i in 0...2 {
            if dataTypes[i] == type { return i as NSNumber? }
        }
        return nil
    }
    
    func valueFor(_ type:OccursValueUsageType, triple:OccursDataTriple) -> Int? {
        if let num=self.indexOfType(type) {
            let i=num.int32Value
            if i == 0 {return triple.0}
            if i == 1 {return triple.1}
            if i == 2 {return triple.2}
        }
        return nil
    }
    func valueIs(_ type:OccursValueUsageType, index:Int, value:Int) {
        if let num=self.indexOfType(type) {
            if data == nil {
                data=[OccursDataTriple]()
            }
            if var d=data {
                while d.count < index + 1 {
                    d.append((0,0,0))
                }
            }
            let i=num.int32Value
            if i == 0 {data![index].0 = value}
            if i == 1 {data![index].1 = value}
            if i == 2 {data![index].2 = value}
        }
    }

    
    func occursChooserArray(_ with:IsOccursContentDataSource) -> OccursSingleControlArray {
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
                return self.valueFor(.dayOfMonth, triple: data![0])
            } else {
                return nil
            }
        }
        set (aValue) { self.valueIs( .dayOfMonth, index: 0 , value: aValue!)}
    }
    var dayOfQuarter:Int? {
        get {
            if self.isSingle() {
                return self.valueFor(.dayOfQuarter, triple: data![0])
            } else {
                return nil
            }
        }
        set (aValue) { self.valueIs( .dayOfQuarter, index: 0 , value: aValue!)}
    }
    var firstDayOfMonth:Int? {
        get {
            if self.isMultiple() {
                return self.valueFor(.dayOfMonth, triple: data![0])
            } else {
                return nil
            }
        }
        set (aValue) { self.valueIs( .dayOfMonth, index: 0 , value: aValue!)}
    }
    var secondDayOfMonth:Int? {
        get {
            if self.isMultiple() {
                return self.valueFor(.dayOfMonth, triple: data![1])
            } else {
                return nil
            }
        }
        set (aValue) { self.valueIs( .dayOfMonth, index: 1 , value: aValue!)}
    }
    
    var weekday:Int? {
        get {
            if self.isSingle() {
                return self.valueFor(.dayOfWeek, triple: data![0])
            } else {
                return nil
            }
        }
        set (aValue) { self.valueIs( .dayOfWeek, index: 0 , value: aValue!)}
    }
    var weekOfMonth:Int? {
        get {
            if self.isSingle() {
                return self.valueFor(.weekOfMonth, triple: data![0])
            } else {
                return nil
            }
        }
        set (aValue) { self.valueIs( .weekOfMonth, index: 0 , value: aValue!)}
    }
    var weekOfQuarter:Int? {
        get {
            if self.isSingle() {
                return self.valueFor(.weekOfQuarter, triple: data![0])
            } else {
                return nil
            }
        }
        set (aValue) { self.valueIs( .weekOfQuarter, index: 0 , value: aValue!)}
    }
    var weekOfHalfYear:Int? {
        get {
            if self.isSingle() {
                return self.valueFor(.weekOfHalfYear, triple: data![0])
            } else {
                return nil
            }
        }
        set (aValue) { self.valueIs( .weekOfHalfYear, index: 0 , value: aValue!)}
    }
    var weekOfYear:Int? {
        get {
            if self.isSingle() {
                return self.valueFor(.weekOfYear, triple: data![0])
            } else {
                return nil
            }
        }
        set (aValue) { self.valueIs( .weekOfYear, index: 0 , value: aValue!)}
    }
    var monthOfQuarter:Int? {
        get {
            if self.isSingle() {
                return self.valueFor(.monthOfQuarter, triple: data![0])
            } else {
                return nil
            }
        }
        set (aValue) { self.valueIs( .monthOfQuarter, index: 0 , value: aValue!)}
    }
    var monthOfHalfYear:Int? {
        get {
            if self.isSingle() {
                return self.valueFor(.monthOfHalfYear, triple: data![0])
            } else {
                return nil
            }
        }
        set (aValue) { self.valueIs( .monthOfHalfYear, index: 0 , value: aValue!)}
    }
    var monthOfYear:Int? {
        get {
            if self.isSingle() {
                return self.valueFor(.monthOfYear, triple: data![0])
            } else {
                return nil
            }
        }
        set (aValue) { self.valueIs( .monthOfYear, index: 0 , value: aValue!)}
    }
    var quarterOfYear:Int? {
        get {
            if self.isSingle() {
                return self.valueFor(.quarterOfYear, triple: data![0])
            } else {
                return nil
            }
        }
        set (aValue) { self.valueIs( .quarterOfYear, index: 0 , value: aValue!)}
    }
    var year:Int? {
        get {
            if self.isSingle() {
                return self.valueFor(.quarterOfYear, triple: data![0])
            } else {
                return nil
            }
        }
        set (aValue) { self.valueIs( .quarterOfYear, index: 0 , value: aValue!)}
    }
    
    var firstUsedDate:Date? {
        get { return firstDate }
        set (aValue) { firstDate=aValue }
    }
    var lastUsedDate:Date? {
        get { return lastDate }
        set (aValue) { lastDate=aValue }
    }
    
    func isEmpty() -> Bool {
        if let d=self.data {
            return d.count == 0
        } else {
            return true
        }
    }
    func isSingle() -> Bool {
        if let d=self.data {
            return d.count == 1
        } else {
            return false
        }
    }
    func isMultiple() -> Bool {
        if let d=self.data {
            return d.count > 1
        } else {
            return false
        }
    }




    
}

