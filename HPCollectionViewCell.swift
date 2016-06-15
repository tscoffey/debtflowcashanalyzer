//
//  HPCollectionViewCell.swift
//  HorizontalPickerDemo
//
//  Created by Bernd Rabe on 13.12.15.
//  Copyright © 2015 RABE_IT Services. All rights reserved.
//

import UIKit

struct HPCollectionViewCellConstants {
    static let reuseIdentifier = "HPCollectionViewCell"
}

protocol HPCollectionViewCellDelegate {
    func fontForCollectionViewCell (cvCell: HPCollectionViewCell) -> UIFont
    func textColorForCollectionViewCell (cvCell: HPCollectionViewCell) -> UIColor
    func useTwolineModeForCollectionViewCell (cvCell: HPCollectionViewCell) -> Bool
}

class HPCollectionViewCell: UICollectionViewCell {
    
    private var textColor: UIColor = UIColor.lightGrayColor()
    
    var text: String? {
        didSet {
            label.text = text ?? ""
        }
    }
    
    override var selected: Bool {
        didSet {
            label.textColor = selected ? tintColor : textColor
        }
    }
    
    var delegate: HPCollectionViewCellDelegate? {
        didSet {
            guard let delegate = self.delegate else {
                return
            }
            
            label.font          = delegate.fontForCollectionViewCell(self)
            textColor           = delegate.textColorForCollectionViewCell(self)
            label.textColor     = textColor
            
            let useTwoLineMode  = delegate.useTwolineModeForCollectionViewCell(self)
            label.numberOfLines = useTwoLineMode ? 2 : 1
            label.lineBreakMode = useTwoLineMode ? .ByWordWrapping : .ByTruncatingTail
        }
    }
    
    lazy var label: UILabel = {
        let label = UILabel(frame: self.bounds)
        label.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
        label.backgroundColor  = UIColor.clearColor()
        label.textAlignment    = .Center
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor         = UIColor.clearColor()
        
        var perspective         = CATransform3DIdentity
        perspective.m34         = -1.0 / 750.0
        contentView.layer.sublayerTransform = perspective
        
        contentView.addSubview(label)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
