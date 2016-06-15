//
//  LookTheme.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 5/19/16.
//  Copyright © 2016 Coffey. All rights reserved.
//

import Foundation

class LookTheme {
    var lookValues:HasUILookValues
    
    
    init (look:HasUILookValues) {
        lookValues=look
    }
    
    func applyTo(controller:HasUIThemeComponents) {
        if let v=controller.clearsEditorSegmentedView {
            lookValues.applyBackgroundColor(lookValues.clearsEditorSegmentedOptionsBackgroundColor, toView:v)
            lookValues.applyTintColor(lookValues.clearsEditorSegmentedOptionsTintColor, toView:v)
        }
        if let v=controller.firstLastDatesSegmentView {
            lookValues.applyBackgroundColor(lookValues.firstLastDatesEditorSegmentedOptionsBackgroundColor, toView:v)
            lookValues.applyTintColor(lookValues.firstLastDatesEditorSegmentedOptionsTintColor, toView:v)
        }
        if let v=controller.dayOfWeekPickerSegmentView {
            lookValues.applyBackgroundColor(lookValues.dayOfWeekSegmentedOptionsBackgroundColor, toView:v)
            lookValues.applyTintColor(lookValues.dayOfWeekSegmentedOptionsTintColor, toView:v)
        }

    }
    
    
}


//  appDelegate().lookTheme.applyTo(
