//
//  UIView+Constraints.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 6/10/16.
//  Copyright © 2016 Coffey. All rights reserved.
//

import UIKit

extension UIView {
    func constraintFromTopToTopOf(view:UIView, offset:CGFloat=0)->NSLayoutConstraint {
        return NSLayoutConstraint(item: view,
                                  attribute: NSLayoutAttribute.Top,
                                  relatedBy: NSLayoutRelation.Equal,
                                  toItem: self,
                                  attribute: NSLayoutAttribute.Top,
                                  multiplier: 1,
                                  constant: offset)
    }
    func constraintFromBottomToTopOf(view:UIView, offset:CGFloat=0)->NSLayoutConstraint {
        return NSLayoutConstraint(item: view,
                                  attribute: NSLayoutAttribute.Top,
                                  relatedBy: NSLayoutRelation.Equal,
                                  toItem: self,
                                  attribute: NSLayoutAttribute.Bottom,
                                  multiplier: 1,
                                  constant: offset)
    }
    func constraintFromTopToBottomOf(view:UIView, offset:CGFloat=0)->NSLayoutConstraint {
        return NSLayoutConstraint(item: view,
                                  attribute: NSLayoutAttribute.Bottom,
                                  relatedBy: NSLayoutRelation.Equal,
                                  toItem: self,
                                  attribute: NSLayoutAttribute.Top,
                                  multiplier: 1,
                                  constant: offset)
    }
    func constraintFromBottomToBottomOf(view:UIView, offset:CGFloat=0)->NSLayoutConstraint {
        return NSLayoutConstraint(item: view,
                                  attribute: NSLayoutAttribute.Bottom,
                                  relatedBy: NSLayoutRelation.Equal,
                                  toItem: self,
                                  attribute: NSLayoutAttribute.Bottom,
                                  multiplier: 1,
                                  constant: offset)
    }
    func constraintFromLeftToLeftOf(view:UIView, offset:CGFloat=0)->NSLayoutConstraint {
        return NSLayoutConstraint(item: view,
                                  attribute: NSLayoutAttribute.Leading,
                                  relatedBy: NSLayoutRelation.Equal,
                                  toItem: self,
                                  attribute: NSLayoutAttribute.Leading,
                                  multiplier: 1,
                                  constant: offset)
    }
    func constraintFromLeftToRightOf(view:UIView, offset:CGFloat=0)->NSLayoutConstraint {
        return NSLayoutConstraint(item: view,
                                  attribute: NSLayoutAttribute.Trailing,
                                  relatedBy: NSLayoutRelation.Equal,
                                  toItem: self,
                                  attribute: NSLayoutAttribute.Leading,
                                  multiplier: 1,
                                  constant: offset)
    }

    func constraintFromRightToLeftOf(view:UIView, offset:CGFloat=0)->NSLayoutConstraint {
        return NSLayoutConstraint(item: view,
                                  attribute: NSLayoutAttribute.Leading,
                                  relatedBy: NSLayoutRelation.Equal,
                                  toItem: self,
                                  attribute: NSLayoutAttribute.Trailing,
                                  multiplier: 1,
                                  constant: offset)
    }
    func constraintFromRightToRightOf(view:UIView, offset:CGFloat=0)->NSLayoutConstraint {
        return NSLayoutConstraint(item: view,
                                  attribute: NSLayoutAttribute.Trailing,
                                  relatedBy: NSLayoutRelation.Equal,
                                  toItem: self,
                                  attribute: NSLayoutAttribute.Trailing,
                                  multiplier: 1,
                                  constant: offset)
    }
    
    
    func constraintForWidthToWidthOf(view:UIView, multiplier:CGFloat=1)->NSLayoutConstraint {
        return NSLayoutConstraint(item: view,
                                  attribute: NSLayoutAttribute.Width,
                                  relatedBy: NSLayoutRelation.Equal,
                                  toItem: self,
                                  attribute: NSLayoutAttribute.Width,
                                  multiplier: multiplier,
                                  constant: 0)
    }
    func constraintForHeightToHeightOf(view:UIView, multiplier:CGFloat=1)->NSLayoutConstraint {
        return NSLayoutConstraint(item: view,
                                  attribute: NSLayoutAttribute.Height,
                                  relatedBy: NSLayoutRelation.Equal,
                                  toItem: self,
                                  attribute: NSLayoutAttribute.Height,
                                  multiplier: multiplier,
                                  constant: 0)
    }
    
    func constraintForCenterXToCenterXOf(view:UIView, offset:CGFloat=0)->NSLayoutConstraint {
        return NSLayoutConstraint(item: view,
                                  attribute: NSLayoutAttribute.CenterX,
                                  relatedBy: NSLayoutRelation.Equal,
                                  toItem: self,
                                  attribute: NSLayoutAttribute.CenterX,
                                  multiplier: 1,
                                  constant: offset)
    }
    func constraintForCenterYToCenterYOf(view:UIView, offset:CGFloat=0)->NSLayoutConstraint {
        return NSLayoutConstraint(item: view,
                                  attribute: NSLayoutAttribute.CenterY,
                                  relatedBy: NSLayoutRelation.Equal,
                                  toItem: self,
                                  attribute: NSLayoutAttribute.CenterY,
                                  multiplier: 1,
                                  constant: offset)
    }
    
    func constraintForLeftEqualing(value:CGFloat=0)->NSLayoutConstraint {
        return NSLayoutConstraint(item: self,
                                  attribute: NSLayoutAttribute.Leading,
                                  relatedBy: NSLayoutRelation.Equal,
                                  toItem: nil,
                                  attribute: NSLayoutAttribute.NotAnAttribute,
                                  multiplier: 1,
                                  constant: value)
    }
    func constraintForRightEqualing(value:CGFloat=0)->NSLayoutConstraint {
        return NSLayoutConstraint(item: self,
                                  attribute: NSLayoutAttribute.Trailing,
                                  relatedBy: NSLayoutRelation.Equal,
                                  toItem: nil,
                                  attribute: NSLayoutAttribute.NotAnAttribute,
                                  multiplier: 1,
                                  constant: value)
    }
    func constraintForTopEqualing(value:CGFloat=0)->NSLayoutConstraint {
        return NSLayoutConstraint(item: self,
                                  attribute: NSLayoutAttribute.Top,
                                  relatedBy: NSLayoutRelation.Equal,
                                  toItem: nil,
                                  attribute: NSLayoutAttribute.NotAnAttribute,
                                  multiplier: 1,
                                  constant: value)
    }
    func constraintForBottomEqualing(value:CGFloat=0)->NSLayoutConstraint {
        return NSLayoutConstraint(item: self,
                                  attribute: NSLayoutAttribute.Bottom,
                                  relatedBy: NSLayoutRelation.Equal,
                                  toItem: nil,
                                  attribute: NSLayoutAttribute.NotAnAttribute,
                                  multiplier: 1,
                                  constant: value)
    }




    func constraintForWidthEqualing(value:CGFloat=0)->NSLayoutConstraint {
        return NSLayoutConstraint(item: self,
                                  attribute: NSLayoutAttribute.Width,
                                  relatedBy: NSLayoutRelation.Equal,
                                  toItem: nil,
                                  attribute: NSLayoutAttribute.NotAnAttribute,
                                  multiplier: 1,
                                  constant: value)
    }
    func constraintForHeightEqualing(value:CGFloat=0)->NSLayoutConstraint {
        return NSLayoutConstraint(item: self,
                                  attribute: NSLayoutAttribute.Height,
                                  relatedBy: NSLayoutRelation.Equal,
                                  toItem: nil,
                                  attribute: NSLayoutAttribute.NotAnAttribute,
                                  multiplier: 1,
                                  constant: value)
    }

}
