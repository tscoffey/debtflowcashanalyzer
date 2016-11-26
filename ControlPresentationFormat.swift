//
//  ControlPresentationFormat.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 6/10/16.
//  Copyright © 2016 Coffey. All rights reserved.
//

import UIKit

enum ControlPresentationFormat:IsSubControlBoundsProvider {
    case scrolledHorizontally,
    scrolledVertically,
    pageView
    
    
    func buildConstraintsFor(_ control:IsOccursUIControl,
                             relativeTo:OccursSubController?,
                             superView:UIView,
                             style:SubControllerStyle,
                             boundsProvider:IsSubControlBoundsProvider?=nil) ->[NSLayoutConstraint] {
        
        var constraints=[NSLayoutConstraint]()
        var relativeView:UIView?=nil
        var bounds:IsSubControlBoundsProvider
        if let relTo=relativeTo {
            relativeView=self.viewToAnchorTo(relTo)
        }
        if let b=boundsProvider {
            bounds=b
        } else {
            bounds=self
        }
        switch self {
        case .scrolledVertically:
            if relativeView != nil {
                constraints.append(
                    relativeView!.constraintFromBottomToTopOf(control.controlView,
                        offset:bounds.verticalOffsetFor(self, style: style))
                )
            } else {
                constraints.append(
                        superView.constraintFromTopToTopOf(control.controlView,
                            offset:bounds.verticalOffsetFor(self, style: style))
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
        case .scrolledHorizontally:
            if relativeView != nil {
                constraints.append(
                    relativeView!.constraintFromRightToLeftOf(control.controlView,
                        offset:bounds.horizontalOffsetFor(self, style: style))
                )
            } else {
                constraints.append(
                    superView.constraintFromLeftToLeftOf(control.controlView,
                        offset:bounds.horizontalOffsetFor(self, style: style))
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
    func widthPercentage(_ style:SubControllerStyle)->CGFloat {
        switch style {
        case .dateStyle: return 0.9
        default: return 0.7
        }
    }
    func heightPercentage(_ style:SubControllerStyle)->CGFloat {
        switch style {
        case .dateStyle: return 1.0
        default: return 0.6
        }
    }
    func defaultHeight()->CGFloat {
        return 80
    }
    func defaultWidth()->CGFloat {
        return 100
    }

    
    func controllerStyleFor(_ type:OccursControlContentType) -> SubControllerStyle {
        if type.isLabel() { return SubControllerStyle.labelStyle }
        if type.isDateChooser() { return SubControllerStyle.dateStyle }
        let subType=type.occursControlSubType()
        switch self {
            case .scrolledVertically:
                switch subType {
                default:return SubControllerStyle.horizontalStyle
                }
            case .scrolledHorizontally:
                switch subType {
                default: return SubControllerStyle.verticalStyle
                }
            default: return SubControllerStyle.horizontalStyle
        }
    }
    
    func viewToAnchorTo(_ subController:OccursSubController) -> UIView? {
        switch self {
        case .scrolledHorizontally: return subController.rightMostViewForAnchoring()
        case .scrolledVertically: return subController.bottomMostViewForAnchoring()
        default: return nil
        }
    }
}
