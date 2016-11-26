//
//  IsSubControlBoundsProvider.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 6/18/16.
//  Copyright © 2016 Coffey. All rights reserved.
//

import Foundation
import UIKit

protocol IsSubControlBoundsProvider {
    
    func widthPercentageFor(_ format:ControlPresentationFormat, style:SubControllerStyle) -> CGFloat?
    func heightPercentageFor(_ format:ControlPresentationFormat, style:SubControllerStyle) -> CGFloat?
    func widthValueFor(_ format:ControlPresentationFormat, style:SubControllerStyle) -> CGFloat?
    func heightValueFor(_ format:ControlPresentationFormat, style:SubControllerStyle) -> CGFloat?
    func horizontalOffsetFor(_ format:ControlPresentationFormat, style:SubControllerStyle) -> CGFloat
    func verticalOffsetFor(_ format:ControlPresentationFormat, style:SubControllerStyle) -> CGFloat
}

extension IsSubControlBoundsProvider {
    func widthPercentageFor(_ format:ControlPresentationFormat, style:SubControllerStyle) -> CGFloat? {
        return format.widthPercentage(style)
    }
    func heightPercentageFor(_ format:ControlPresentationFormat, style:SubControllerStyle) -> CGFloat? {
        return format.heightPercentage(style)
    }
    func widthValueFor(_ format:ControlPresentationFormat, style:SubControllerStyle) -> CGFloat? {
        return style.defaultWidth()
    }
    func heightValueFor(_ format:ControlPresentationFormat, style:SubControllerStyle) -> CGFloat? {
        return style.defaultHeight()
    }
    func horizontalOffsetFor(_ format:ControlPresentationFormat, style:SubControllerStyle) -> CGFloat {
        return format.intergapSize()
    }
    func verticalOffsetFor(_ format:ControlPresentationFormat, style:SubControllerStyle) -> CGFloat {
        return format.intergapSize()
    }
}
