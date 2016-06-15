//
//  OccursChoicesProvider.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 6/10/16.
//  Copyright © 2016 Coffey. All rights reserved.
//

import UIKit

class OccursChoicesProvider:IsChoiceProvider {
    
    private lazy var choices:[Int?]? = [Int?]()
    
    func choices(component:Int)->[String] { return [] }
    
    func choiceIndex(component:Int)->Int? {
        if component > choices!.count - 1 {
            choices?.append(nil)
            return self.choiceIndex(component)
        }
        return choices![component]
    }
    
    func setChoiceIndex(component:Int, index:Int?) {
        if component > choices!.count - 1 {
            choices?.append(nil)
            self.setChoiceIndex(component, index:index)
        }
        choices![component]=index

    }
    
    init(choices:[Int?]) {
        self.choices=choices
        
    }
}