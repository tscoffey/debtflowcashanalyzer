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
    
    override init(contentType:OccursControlContentType,choice:Int?, delegate:IsSubControlChoiceDelegate?) {
        super.init(contentType:contentType, choice:choice, delegate:delegate)
    }
    
    init (contentType:OccursControlContentType) {
        super.init(contentType:contentType,choice:nil, delegate:nil)
    }
    override func buildContentTypeSubChoices()->OccursSingleControlArray {
        if contentType.isCategoryItem() {
            return contentType.nextOccursControls().first!
        } else {
            return []
        }
    }
    
    override func buildStringChoices()->[String] {
        return self.contentTypeSubChoices!.map(){ $0.textLabel() }
    }
    
    override func applyChoiceIndexToDataSource(_ index:Int,data:IsOccursContentDataSource?) {
        self.contentType.applyContentType(self.contentTypeSubChoices![index], into: data)
    }
    override func applyChoiceToDataSource(_ data:IsOccursContentDataSource?) {
        self.contentType.applyContentType(self.contentTypeSubChoices![self.choiceIndex!], into: data)
    }
    override func eraseChoiceInDataSource(_ data: IsOccursContentDataSource?) {
        self.contentType.applyContentType(nil, into: data)
    }

    
    override func setContentTypeChoice(_ value:OccursControlContentType, component:OccursSubController) {
        var index = value.indexIn(self.contentTypeSubChoices!)
        if index >= 0 {
            self.setChoiceIndex(index, component: component, fromUI: false)
        }
    }

    

}
