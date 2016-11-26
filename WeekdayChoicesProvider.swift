//
//  WeekdayChoicesProvider.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 6/12/16.
//  Copyright © 2016 Coffey. All rights reserved.
//

import Foundation
import UIKit
class WeekdayChoicesProvider:OccursChoicesProvider {
    


    override init(contentType:OccursControlContentType,choice:Int?, delegate:IsSubControlChoiceDelegate?) {
        super.init(contentType:contentType, choice:choice, delegate:delegate)
    }
    
    init (contentType:OccursControlContentType) {
        super.init(contentType:contentType,choice:nil, delegate:nil)
    }

    
    
    override func buildNumberSubChoices()->[Int] {
        return (0...6).map(){$0}
    }
        
    override func buildStringChoices()->[String] {
        return self.numberSubChoices!.map(){ String.nameOfDayOfWeekIndex($0) }
    }


}

