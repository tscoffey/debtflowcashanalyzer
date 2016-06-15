//
//  File.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 5/11/16.
//  Copyright © 2016 Coffey. All rights reserved.
//

import UIKit


protocol HasUILookValues {
    
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

}

extension HasUILookValues {
    var clearsEditorSegmentedOptionsBackgroundColor:UIColor? { return nil  }
    var clearsEditorSegmentedOptionsTintColor:UIColor? { return UIColor.salmonColor() }
    
    var accountListTableBackgroundColor:UIColor? {return UIColor.chocolateColor() }
    var accountListTableTintColor:UIColor? { return nil }
    var accountListTableTextColor:UIColor? { return UIColor.whiteColor() }
    
    var accountEditorSegmentedOptionsBackgroundColor:UIColor? { return nil  }
    var accountEditorSegmentedOptionsTintColor:UIColor? { return UIColor.plumColor() }
    
    var firstLastDatesEditorSegmentedOptionsBackgroundColor:UIColor? { return UIColor.moccasinColor() }
    var firstLastDatesEditorSegmentedOptionsTintColor:UIColor? { return UIColor.firebrickColor() }
    
    var dayOfWeekSegmentedOptionsBackgroundColor:UIColor? { return nil }
    var dayOfWeekSegmentedOptionsTintColor:UIColor? { return UIColor.darkVioletColor() }



}

extension HasUILookValues {
    
    func applyBackgroundColor(color:UIColor?, toView:UIView?) {
        if let v=toView,
            c=color {
            v.backgroundColor=c
        }
        
    }
    func applyTintColor(color:UIColor?, toView:UIView?) {
        if let v=toView,
            c=color {
            v.tintColor=c
        }
    }
}


protocol HasUIThemeComponents {
    
    var clearsEditorSegmentedView:UIView? { get }
    var sourceAccountTableView:UIView? { get }
    var sourceAccountSegmentView:UIView? { get }
    var firstLastDatesSegmentView:UIView? { get }
    var dayOfWeekPickerSegmentView:UIView? { get }
    
}

extension HasUIThemeComponents {
    var clearsEditorSegmentedView:UIView? { return nil }
    var sourceAccountTableView:UIView? { return nil }
    var sourceAccountSegmentView:UIView? { return nil }
    var firstLastDatesSegmentView:UIView? { return nil }
    var dayOfWeekPickerSegmentView:UIView? { return nil}
    
}
