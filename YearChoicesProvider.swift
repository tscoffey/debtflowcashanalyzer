//
//  YearChoicesProvider.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 6/14/16.
//  Copyright © 2016 Coffey. All rights reserved.
//

import Foundation
class YearChoicesProvider:OccursChoicesProvider {
    
    fileprivate lazy var _years:[Int] = self.buildYears()
    
    func buildYears()->[Int] {
        let date = Date()
        let calendar = Calendar.current
        let components = (calendar as NSCalendar).components(.year, from: date)
        let year =  components.year
        return [year!,year!+1,year!+2]
        
    }
    var yearsToChooseFrom:[Int] {
        get { return self._years }
        set (aValue) { self._years=aValue}
    }

    

    override init(contentType:OccursControlContentType,choice:Int?, delegate:IsSubControlChoiceDelegate?) {
        super.init(contentType:contentType, choice:choice, delegate:delegate)
    }
    
    init (contentType:OccursControlContentType) {
        super.init(contentType:contentType,choice:nil, delegate:nil)
    }

    
    
    override func buildNumberSubChoices()->[Int] {
        return self.yearsToChooseFrom
    }

    
    override func buildStringChoices()->[String] {
        return self.numberSubChoices!.map(){ String($0) }
    }
    
    func setYearChoice(_ value:Int, component:OccursSubController) {
        self.setChoiceIndex(value, component: component, fromUI: false)
    }



}

