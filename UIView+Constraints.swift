//
//  UIView+Constraints.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 6/10/16.
//  Copyright © 2016 Coffey. All rights reserved.
//

import UIKit

extension UIView {
    func constraintFromTopToTopOf(_ view:UIView, offset:CGFloat=0)->NSLayoutConstraint {
        return NSLayoutConstraint(item: view,
                                  attribute: NSLayoutAttribute.top,
                                  relatedBy: NSLayoutRelation.equal,
                                  toItem: self,
                                  attribute: NSLayoutAttribute.top,
                                  multiplier: 1,
                                  constant: offset)
    }
    func constraintFromBottomToTopOf(_ view:UIView, offset:CGFloat=0)->NSLayoutConstraint {
        return NSLayoutConstraint(item: view,
                                  attribute: NSLayoutAttribute.top,
                                  relatedBy: NSLayoutRelation.equal,
                                  toItem: self,
                                  attribute: NSLayoutAttribute.bottom,
                                  multiplier: 1,
                                  constant: offset)
    }
    func constraintFromTopToBottomOf(_ view:UIView, offset:CGFloat=0)->NSLayoutConstraint {
        return NSLayoutConstraint(item: view,
                                  attribute: NSLayoutAttribute.bottom,
                                  relatedBy: NSLayoutRelation.equal,
                                  toItem: self,
                                  attribute: NSLayoutAttribute.top,
                                  multiplier: 1,
                                  constant: offset)
    }
    func constraintFromBottomToBottomOf(_ view:UIView, offset:CGFloat=0)->NSLayoutConstraint {
        return NSLayoutConstraint(item: view,
                                  attribute: NSLayoutAttribute.bottom,
                                  relatedBy: NSLayoutRelation.equal,
                                  toItem: self,
                                  attribute: NSLayoutAttribute.bottom,
                                  multiplier: 1,
                                  constant: offset)
    }
    func constraintFromLeftToLeftOf(_ view:UIView, offset:CGFloat=0)->NSLayoutConstraint {
        return NSLayoutConstraint(item: view,
                                  attribute: NSLayoutAttribute.leading,
                                  relatedBy: NSLayoutRelation.equal,
                                  toItem: self,
                                  attribute: NSLayoutAttribute.leading,
                                  multiplier: 1,
                                  constant: offset)
    }
    func constraintFromLeftToRightOf(_ view:UIView, offset:CGFloat=0)->NSLayoutConstraint {
        return NSLayoutConstraint(item: view,
                                  attribute: NSLayoutAttribute.trailing,
                                  relatedBy: NSLayoutRelation.equal,
                                  toItem: self,
                                  attribute: NSLayoutAttribute.leading,
                                  multiplier: 1,
                                  constant: offset)
    }

    func constraintFromRightToLeftOf(_ view:UIView, offset:CGFloat=0)->NSLayoutConstraint {
        return NSLayoutConstraint(item: view,
                                  attribute: NSLayoutAttribute.leading,
                                  relatedBy: NSLayoutRelation.equal,
                                  toItem: self,
                                  attribute: NSLayoutAttribute.trailing,
                                  multiplier: 1,
                                  constant: offset)
    }
    func constraintFromRightToRightOf(_ view:UIView, offset:CGFloat=0)->NSLayoutConstraint {
        return NSLayoutConstraint(item: view,
                                  attribute: NSLayoutAttribute.trailing,
                                  relatedBy: NSLayoutRelation.equal,
                                  toItem: self,
                                  attribute: NSLayoutAttribute.trailing,
                                  multiplier: 1,
                                  constant: offset)
    }
    
    
    func constraintForWidthToWidthOf(_ view:UIView, multiplier:CGFloat=1, constant:CGFloat=0)->NSLayoutConstraint {
        return NSLayoutConstraint(item: view,
                                  attribute: NSLayoutAttribute.width,
                                  relatedBy: NSLayoutRelation.equal,
                                  toItem: self,
                                  attribute: NSLayoutAttribute.width,
                                  multiplier: multiplier,
                                  constant: constant)
    }
    func constraintForHeightToHeightOf(_ view:UIView, multiplier:CGFloat=1, constant:CGFloat=0)->NSLayoutConstraint {
        return NSLayoutConstraint(item: view,
                                  attribute: NSLayoutAttribute.height,
                                  relatedBy: NSLayoutRelation.equal,
                                  toItem: self,
                                  attribute: NSLayoutAttribute.height,
                                  multiplier: multiplier,
                                  constant: constant)
    }
    
    func constraintForCenterXToCenterXOf(_ view:UIView, offset:CGFloat=0)->NSLayoutConstraint {
        return NSLayoutConstraint(item: view,
                                  attribute: NSLayoutAttribute.centerX,
                                  relatedBy: NSLayoutRelation.equal,
                                  toItem: self,
                                  attribute: NSLayoutAttribute.centerX,
                                  multiplier: 1,
                                  constant: offset)
    }
    func constraintForCenterYToCenterYOf(_ view:UIView, offset:CGFloat=0)->NSLayoutConstraint {
        return NSLayoutConstraint(item: view,
                                  attribute: NSLayoutAttribute.centerY,
                                  relatedBy: NSLayoutRelation.equal,
                                  toItem: self,
                                  attribute: NSLayoutAttribute.centerY,
                                  multiplier: 1,
                                  constant: offset)
    }
    
    func constraintForLeftEqualing(_ value:CGFloat=0)->NSLayoutConstraint {
        return NSLayoutConstraint(item: self,
                                  attribute: NSLayoutAttribute.leading,
                                  relatedBy: NSLayoutRelation.equal,
                                  toItem: nil,
                                  attribute: NSLayoutAttribute.notAnAttribute,
                                  multiplier: 1,
                                  constant: value)
    }
    func constraintForRightEqualing(_ value:CGFloat=0)->NSLayoutConstraint {
        return NSLayoutConstraint(item: self,
                                  attribute: NSLayoutAttribute.trailing,
                                  relatedBy: NSLayoutRelation.equal,
                                  toItem: nil,
                                  attribute: NSLayoutAttribute.notAnAttribute,
                                  multiplier: 1,
                                  constant: value)
    }
    func constraintForTopEqualing(_ value:CGFloat=0)->NSLayoutConstraint {
        return NSLayoutConstraint(item: self,
                                  attribute: NSLayoutAttribute.top,
                                  relatedBy: NSLayoutRelation.equal,
                                  toItem: nil,
                                  attribute: NSLayoutAttribute.notAnAttribute,
                                  multiplier: 1,
                                  constant: value)
    }
    func constraintForBottomEqualing(_ value:CGFloat=0)->NSLayoutConstraint {
        return NSLayoutConstraint(item: self,
                                  attribute: NSLayoutAttribute.bottom,
                                  relatedBy: NSLayoutRelation.equal,
                                  toItem: nil,
                                  attribute: NSLayoutAttribute.notAnAttribute,
                                  multiplier: 1,
                                  constant: value)
    }




    func constraintForWidthEqualing(_ value:CGFloat=0)->NSLayoutConstraint {
        return NSLayoutConstraint(item: self,
                                  attribute: NSLayoutAttribute.width,
                                  relatedBy: NSLayoutRelation.equal,
                                  toItem: nil,
                                  attribute: NSLayoutAttribute.notAnAttribute,
                                  multiplier: 1,
                                  constant: value)
    }
    func constraintForHeightEqualing(_ value:CGFloat=0)->NSLayoutConstraint {
        return NSLayoutConstraint(item: self,
                                  attribute: NSLayoutAttribute.height,
                                  relatedBy: NSLayoutRelation.equal,
                                  toItem: nil,
                                  attribute: NSLayoutAttribute.notAnAttribute,
                                  multiplier: 1,
                                  constant: value)
    }

}
