//
//  ControlPresentationFormat.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 6/10/16.
//  Copyright © 2016 Coffey. All rights reserved.
//

import UIKit

enum ControlPresentationFormat {
    case ScrolledHorizontally,
    ScrolledVertically,
    PageView
    
    
    func buildConstraintsFor(control:IsSubControl, relativeTo:OccursSubController?, superView:UIView, style:SubControllerStyle) ->[NSLayoutConstraint] {
        
        var constraints=[NSLayoutConstraint]()
        var relativeView:UIView?=nil
        if let relTo=relativeTo {
            relativeView=self.viewToAnchorTo(relTo)
        }
        switch self {
        case .ScrolledVertically:
            if relativeView != nil {
                constraints.append(
                    relativeView!.constraintFromBottomToTopOf(control.controlView, offset:self.intergapSize())
                )
            } else {
                constraints.append(
                        superView.constraintFromTopToTopOf(control.controlView, offset:self.intergapSize())
                )
            }
            constraints.append(
                    superView.constraintForCenterXToCenterXOf(control.controlView)
                )
            constraints.append(
                    superView.constraintForWidthToWidthOf(control.controlView,multiplier:self.widthPercentage(style))
                )
            constraints.append(
                    control.controlView.constraintForHeightEqualing(style.defaultHeight())
                )
        case .ScrolledHorizontally:
            if relativeView != nil {
                constraints.append(
                    relativeView!.constraintFromRightToLeftOf(control.controlView, offset:self.intergapSize())
                )
            } else {
                constraints.append(
                    superView.constraintFromLeftToLeftOf(control.controlView, offset:self.intergapSize())
                )
            }
            constraints.append(
                superView.constraintForCenterYToCenterYOf(control.controlView)
            )
            constraints.append(
                superView.constraintForHeightToHeightOf(control.controlView,multiplier:self.heightPercentage(style))
            )
            constraints.append(
                control.controlView.constraintForWidthEqualing(style.defaultWidth())
            )

        default: let x=1
        }
        return constraints
    }
    
    func intergapSize()->CGFloat { return 8 }
    func widthPercentage(style:SubControllerStyle)->CGFloat {
        switch style {
        case .DateStyle: return 0.9
        default: return 0.7
        }
    }
    func heightPercentage(style:SubControllerStyle)->CGFloat {
        switch style {
        case .DateStyle: return 1.0
        default: return 0.6
        }
    }
    func defaultHeight()->CGFloat { return 80 }
    func defaultWidth()->CGFloat { return 100 }

    
    func controllerStyleFor(type:OccursControlContentType) -> SubControllerStyle {
        if type.isLabel() { return SubControllerStyle.LabelStyle }
        if type.isDateChooser() { return SubControllerStyle.DateStyle }
        let subType=type.occursControlSubType()
        switch self {
            case .ScrolledVertically:
                switch subType {
                default:return SubControllerStyle.HorizontalStyle
                }
            case .ScrolledHorizontally:
                switch subType {
                default: return SubControllerStyle.VerticalStyle
                }
            default: return SubControllerStyle.HorizontalStyle
        }
    }
    
    func viewToAnchorTo(subController:OccursSubController) -> UIView? {
        switch self {
        case .ScrolledHorizontally: return subController.rightMostViewForAnchoring()
        case .ScrolledVertically: return subController.bottomMostViewForAnchoring()
        default: return nil
        }
    }
}
