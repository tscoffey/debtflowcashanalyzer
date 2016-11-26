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
    case tableStyle,
    horizontalStyle,
    verticalStyle,
    segmentedStyle,
    menuStyle,
    dateStyle,
    labelStyle
    
    func buildControl(_ subControl:OccursSubController)->IsOccursUIControl {
        switch self {
        case .tableStyle:
            let view=UITableView(frame: CGRect.zero)
            view.translatesAutoresizingMaskIntoConstraints=false
            view.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")

            return view

        case .menuStyle:
            let view=UIDropDown(frame: CGRect.zero)
            view.translatesAutoresizingMaskIntoConstraints=false
            view.font=UIFont.systemFont(ofSize: 13)

            return view
        case .segmentedStyle:
            let view=UISegmentedControl(frame: CGRect.zero)
            view.translatesAutoresizingMaskIntoConstraints=false
            view.apportionsSegmentWidthsByContent=true

            return view
        case .verticalStyle:
            let view=UIPickerView(frame:CGRect.zero)
            view.translatesAutoresizingMaskIntoConstraints=false

            return view
        case .horizontalStyle:
            let view=HorizontalPickerView(frame:CGRect.zero)
            view.translatesAutoresizingMaskIntoConstraints=false

            return view
        case .labelStyle:
            let view=UILabel(frame: CGRect.zero)
            view.translatesAutoresizingMaskIntoConstraints=false
            view.font=UIFont.italicSystemFont(ofSize: 13)
            view.textColor=view.tintColor

            return view
        case .dateStyle:
            let view=DateView(frame:CGRect.zero)
            view.translatesAutoresizingMaskIntoConstraints=false

            return view
            
        default: break
        }
        return UILabel() as IsOccursUIControl
        
    }
    
    func defaultHeight() -> CGFloat {
        switch self {
        case .menuStyle: return 20
        case .segmentedStyle: return 20
        case .horizontalStyle:
            return 20
        case .verticalStyle: return 80
        case .tableStyle: return 80
        case .labelStyle: return 20
        case .dateStyle: return 70
        default: return 60
        }
    }
    func defaultWidth() -> CGFloat {
        switch self {
        case .menuStyle: return 100
        case .segmentedStyle: return 100
        case .horizontalStyle: return 100
        case .verticalStyle: return 100
        case .tableStyle: return 100
        case .labelStyle: return 100
        case .dateStyle: return 100            
        default: return 60
        }
    }
    
    func addTarget(_ target:OccursSubController?, control:IsOccursUIControl?) {
        if let c=control {
            switch self {
            case .segmentedStyle: c.addSelectTarget(target, selector: Selector("segmentChanged:"))
            default: break
            }
        }
    }

}
