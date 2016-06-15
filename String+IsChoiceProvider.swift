//
//  String+IsChoiceProvider.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 6/13/16.
//  Copyright © 2016 Coffey. All rights reserved.
//

import Foundation
extension String:IsChoiceProvider {
    
    func choices(component:Int)->[String] { return [self] }
    func choiceIndex(component:Int)->Int? { return nil }
    func setChoiceIndex(component:Int, index:Int?) {}


    
}
