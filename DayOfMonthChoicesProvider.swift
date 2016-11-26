//
//  DayOfMonthChoicesProvider.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 6/12/16.
//  Copyright © 2016 Coffey. All rights reserved.
//

import Foundation
import UIKit
class DayOfMonthChoicesProvider:OccursChoicesProvider {
    
    
    override init(contentType:OccursControlContentType,choice:Int?, delegate:IsSubControlChoiceDelegate?) {
        super.init(contentType:contentType, choice:choice, delegate:delegate)
    }
    
    init (contentType:OccursControlContentType) {
        super.init(contentType:contentType,choice:nil, delegate:nil)
    }
    
    
    override func buildNumberSubChoices()->[Int] {
        return (1...31).map(){$0}
    }
    
    override func buildStringChoices()->[String] {
        return self.numberSubChoices!.map(){ String.nameOfDayOfMonth($0) }
    }
    
    func setDayChoice(_ value:Int, component:OccursSubController) {
        self.setChoiceIndex(value, component: component, fromUI: false)
    }
    
}
