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
    
    func applyTo(_ controller:HasUIThemeComponents) {
        if let v=controller.clearsEditorSegmentedView {
            lookValues.applyBackgroundColor(lookValues.clearsEditorSegmentedOptionsBackgroundColor, toView:v)
            lookValues.applyTintColor(lookValues.clearsEditorSegmentedOptionsTintColor, toView:v)
            return
        }
        if let v=controller.firstLastDatesSegmentView {
            lookValues.applyBackgroundColor(lookValues.firstLastDatesEditorSegmentedOptionsBackgroundColor, toView:v)
            lookValues.applyTintColor(lookValues.firstLastDatesEditorSegmentedOptionsTintColor, toView:v)
            return
        }
        if let v=controller.dayOfWeekPickerSegmentView {
            lookValues.applyBackgroundColor(lookValues.dayOfWeekSegmentedOptionsBackgroundColor, toView:v)
            lookValues.applyTintColor(lookValues.dayOfWeekSegmentedOptionsTintColor, toView:v)
            return
        }
        if let v=controller.occursCategoryChooserView {
            lookValues.applyBackgroundColor(lookValues.occursCategoryChooserBackgroundColor, toView: v)
            lookValues.applyTintColor(lookValues.occursCategoryChooserTintColor, toView: v)
            return
        }
        if let v=controller.occursDateView {
            lookValues.applyBackgroundColor(lookValues.occursDateChooserBackgroundColor, toView: v)
            lookValues.applyTintColor(lookValues.occursDateChooserTintColor, toView: v)
            return
        }
        if let v=controller.occursLabelView {
            lookValues.applyBackgroundColor(lookValues.occursLabelBackgroundColor, toView: v)
            lookValues.applyTextColor(lookValues.occursLabelTintColor, toView: v)
            return
        }



    }
    
    
}


//  appDelegate().lookTheme.applyTo(
