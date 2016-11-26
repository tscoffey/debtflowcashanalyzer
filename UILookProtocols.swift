//
//  File.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 5/11/16.
//  Copyright © 2016 Coffey. All rights reserved.
//

import UIKit


protocol HasUILookValues {
    
    var defaultTintColor:UIColor? { get }
    var clearsEditorSegmentedOptionsBackgroundColor:UIColor? { get }
    var clearsEditorSegmentedOptionsTintColor:UIColor? { get }
    
    var accountListTableBackgroundColor:UIColor? { get }
    var accountListTableTintColor:UIColor? { get }
    var accountListTableTextColor:UIColor? { get }
    var accountEditorSegmentedOptionsBackgroundColor:UIColor? { get }
    var accountEditorSegmentedOptionsTintColor:UIColor? { get }
    
    var firstLastDatesEditorSegmentedOptionsBackgroundColor:UIColor? { get }
    var firstLastDatesEditorSegmentedOptionsTintColor:UIColor? { get }
    
    var dayOfWeekSegmentedOptionsBackgroundColor:UIColor? { get }
    var dayOfWeekSegmentedOptionsTintColor:UIColor? { get }
    
    var occursCategoryChooserBackgroundColor:UIColor? { get }
    var occursCategoryChooserTintColor:UIColor? { get }

    var occursDateChooserBackgroundColor:UIColor? { get }
    var occursDateChooserTintColor:UIColor? { get }
    
    var occursLabelBackgroundColor:UIColor? { get }
    var occursLabelTintColor:UIColor? { get }

}

extension HasUILookValues {
    var defaultTintColor:UIColor? { return UIColor.lightBlueColor() }
    
    var clearsEditorSegmentedOptionsBackgroundColor:UIColor? { return nil  }
    var clearsEditorSegmentedOptionsTintColor:UIColor? { return UIColor.salmonColor() }
    
    var accountListTableBackgroundColor:UIColor? {return UIColor.chocolateColor() }
    var accountListTableTintColor:UIColor? { return nil }
    var accountListTableTextColor:UIColor? { return UIColor.white }
    
    var accountEditorSegmentedOptionsBackgroundColor:UIColor? { return nil  }
    var accountEditorSegmentedOptionsTintColor:UIColor? { return UIColor.plumColor() }
    
    var firstLastDatesEditorSegmentedOptionsBackgroundColor:UIColor? { return UIColor.moccasinColor() }
    var firstLastDatesEditorSegmentedOptionsTintColor:UIColor? { return UIColor.firebrickColor() }
    
    var dayOfWeekSegmentedOptionsBackgroundColor:UIColor? { return nil }
    var dayOfWeekSegmentedOptionsTintColor:UIColor? { return UIColor.darkVioletColor() }
    
    var occursCategoryChooserBackgroundColor:UIColor? { return nil}
    var occursCategoryChooserTintColor:UIColor? { return UIColor.darkSlateBlueColor() }
    
    var occursDateChooserBackgroundColor:UIColor? { return nil }
    var occursDateChooserTintColor:UIColor? { return UIColor.copperColor() }
    
    var occursLabelBackgroundColor:UIColor? { return nil}
    var occursLabelTintColor:UIColor? { return UIColor.darkOrangeColor()}



}

extension HasUILookValues {
    
    func applyBackgroundColor(_ color:UIColor?, toView:UIView?) {
        if let v=toView,
            let c=color {
            v.backgroundColor=c
        }
        
    }
    func applyTintColor(_ color:UIColor?, toView:UIView?) {
        var _color:UIColor?
        if let c=color {
            _color=color
        } else {
            _color=self.defaultTintColor
        }
        if let v=toView,
            let c=_color {
            v.tintColor=c
        }
    }
    func applyTextColor(_ color:UIColor?, toView:UILabel?) {
        if let v=toView,
            let c=color {
            v.textColor=c
        }
        
    }
}


protocol HasUIThemeComponents {
    
    var clearsEditorSegmentedView:UIView? { get }
    var sourceAccountTableView:UIView? { get }
    var sourceAccountSegmentView:UIView? { get }
    var firstLastDatesSegmentView:UIView? { get }
    var dayOfWeekPickerSegmentView:UIView? { get }
    var occursCategoryChooserView:UIView? { get }
    var occursDateView:UIView? { get }
    var occursLabelView:UILabel? { get }
    
}

extension HasUIThemeComponents {
    var clearsEditorSegmentedView:UIView? { return nil }
    var sourceAccountTableView:UIView? { return nil }
    var sourceAccountSegmentView:UIView? { return nil }
    var firstLastDatesSegmentView:UIView? { return nil }
    var dayOfWeekPickerSegmentView:UIView? { return nil}
    var occursCategoryChooserView:UIView? { return nil }
    var occursDateView:UIView? { return nil }
    var occursLabelView:UILabel? { return nil }


    
}
