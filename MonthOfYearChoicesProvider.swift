//
//  MonthOfYearChoicesProvider.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 6/13/16.
//  Copyright © 2016 Coffey. All rights reserved.
//

import Foundation
import UIKit

class MonthOfYearChoicesProvider:OccursChoicesProvider {
    
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
        return (1...12).map(){$0}
    }
    
    lazy var stringChoices:[String] =
        self.buildStringChoices()
    
    func buildStringChoices()->[String] {
        return self.subChoices.map(){ String.nameOfMonthOfYear($0) }
    }
    
    init (contentType:OccursControlContentType) {
        _contentType=contentType
        super.init(choices:[])
    }
    
    override func choices(component:Int)->[String] {
        return self.stringChoices
    }

}

