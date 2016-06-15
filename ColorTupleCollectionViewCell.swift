//
//  ColorTupleCollectionViewCell.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 5/18/16.
//  Copyright © 2016 Coffey. All rights reserved.
//

import UIKit

class ColorTupleCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var squareView: UIView!
    
    var bgColor:UIColor {
        get { return squareView.backgroundColor! }
        set (aValue) { squareView.backgroundColor=aValue }
    }
}
