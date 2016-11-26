//
//  String+IsChoiceProvider.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 6/13/16.
//  Copyright © 2016 Coffey. All rights reserved.
//

import Foundation
extension String:IsChoiceProvider  {
    
    
    var choice:String? { return self}
    var choiceIndex:Int? {
        get { return nil }
    }
    var choices:[String] { return [self] }
    
    var contentType:OccursControlContentType {
        get {return .anyLabel(label:self) }
        set (aValue) {}
    }
    var numberSubChoices:[Int]? {
        get {return nil }
    }
    var contentTypeSubChoices:[OccursControlContentType]? { return nil }

}
