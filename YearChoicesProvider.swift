//
//  YearChoicesProvider.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 6/14/16.
//  Copyright © 2016 Coffey. All rights reserved.
//

import Foundation
class YearChoicesProvider:OccursChoicesProvider {
    
    private lazy var _years:[Int] = self.buildYears()
    
    func buildYears()->[Int] {
        let date = NSDate()
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components(.Year, fromDate: date)
        let year =  components.year
        return [year,year+1,year+2]
        
    }
    var yearsToChooseFrom:[Int] {
        get { return self._years }
        set (aValue) { self._years=aValue}
    }
    private var _contentType:OccursControlContentType?
    
    var contentType:OccursControlContentType {
        get { return _contentType! }
        set (aValue) { _contentType=aValue }
    }
    
    deinit {
        _contentType = nil
    }
    init(contentType:OccursControlContentType,choice:Int?) {
        _contentType=contentType
        super.init(choices:[choice])
        
    }
    
    lazy var subChoices:[Int] =
        self.buildSubChoices()
    
    func buildSubChoices()->[Int] {
        return self.yearsToChooseFrom
    }
    
    lazy var stringChoices:[String] =
        self.buildStringChoices()
    
    func buildStringChoices()->[String] {
        return self.subChoices.map(){ String($0) }
    }
    
    init (contentType:OccursControlContentType) {
        _contentType=contentType
        super.init(choices:[])
    }
    
    override func choices(component:Int)->[String] {
        return self.stringChoices
    }
}

