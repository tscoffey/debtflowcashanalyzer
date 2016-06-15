//
//  SubControllerStyle.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 6/10/16.
//  Copyright © 2016 Coffey. All rights reserved.
//

import Foundation
import UIKit

enum SubControllerStyle {
    case TableStyle,
    HorizontalStyle,
    VerticalStyle,
    SegmentedStyle,
    MenuStyle,
    DateStyle,
    LabelStyle
    
    func buildControl()->IsSubControl {
        switch self {
        case .VerticalStyle:
            var view=UIPickerView(frame:CGRectZero)
            view.translatesAutoresizingMaskIntoConstraints=false
            return view
        case .HorizontalStyle:
            var view=HorizontalPickerView(frame:CGRectZero)
            view.translatesAutoresizingMaskIntoConstraints=false
            return view
        case .LabelStyle:
            var view=UILabel(frame: CGRectZero)
            view.translatesAutoresizingMaskIntoConstraints=false
            view.font=UIFont.systemFontOfSize(13)
            view.textColor=view.tintColor
            return view
        case .DateStyle:
            var view=DateView(frame:CGRectZero)
            view.translatesAutoresizingMaskIntoConstraints=false
            view.backgroundColor=UIColor.coralColor()
            return view
            
        default: return UILabel() as! IsSubControl
        }
        
    }
    
    func defaultHeight() -> CGFloat {
        switch self {
        case .HorizontalStyle: return 20
        case .VerticalStyle: return 80
        case .LabelStyle: return 20
        case .DateStyle: return 80

        default: return 60
        }
    }
    func defaultWidth() -> CGFloat {
        switch self {
        case .HorizontalStyle: return 100
        case .VerticalStyle: return 100
        case .LabelStyle: return 100
        case .DateStyle: return 100
            
        default: return 60
        }
    }

}
