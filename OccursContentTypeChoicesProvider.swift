//
//  OccursContentTypeChoicesProvider.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 6/10/16.
//  Copyright © 2016 Coffey. All rights reserved.
//

import Foundation
import UIKit
class OccursContentTypeChoicesProvider:OccursChoicesProvider {
    
    private var _contentType:OccursControlContentType?
    
    var contentType:OccursControlContentType {
        get { return _contentType! }
        set (aValue) { _contentType=aValue }
    }
    
    deinit {
        _contentType = nil
    }
    init(contentType:OccursControlContentType,choice:Int?) {
        _contentType=contentType
        super.init(choices:[choice])

    }
    
    lazy var subChoices:OccursSingleControlArray =
        self.buildSubChoices()
    
    func buildSubChoices()->OccursSingleControlArray {
        return contentType.nextOccursControls().first!
    }
    
    lazy var stringChoices:[String] =
        self.buildStringChoices()
    
    func buildStringChoices()->[String] {
        return self.subChoices.map(){ $0.textLabel() }
    }
    
    init (contentType:OccursControlContentType) {
        _contentType=contentType
        super.init(choices:[])
    }
    
    override func choices(component:Int)->[String] {
        return self.stringChoices
    }
}
