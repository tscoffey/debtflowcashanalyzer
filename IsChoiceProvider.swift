//
//  IsChoiceProvider.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 6/10/16.
//  Copyright © 2016 Coffey. All rights reserved.
//

import Foundation

protocol IsChoiceProvider {
    func choices(component:Int)->[String]
    func choiceIndex(component:Int)->Int?
    func setChoiceIndex(component:Int, index:Int?)
}
