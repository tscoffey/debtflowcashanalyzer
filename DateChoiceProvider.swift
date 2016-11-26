//
//  DateChoiceProvider.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 6/24/16.
//  Copyright © 2016 Coffey. All rights reserved.
//

import Foundation
class DateChoiceProvider:OccursChoicesProvider {
    
    fileprivate var _date:Date?
    
    
    init(contentType:OccursControlContentType, date:Date?, delegate:IsSubControlChoiceDelegate?) {
        _date=date
        super.init(contentType:contentType, choice:nil, delegate:delegate)
    }
    
    init (contentType:OccursControlContentType) {
        _date=nil
        super.init(contentType:contentType,choice:nil, delegate:nil)
    }
    
    var dateChoice:Date? { return _date }
    
    override func setDateChoice(_ date:Date, component:OccursSubController, fromUI:Bool) {
        _date=date
        if let d = _delegate {
            d.didSelectDate(date, component: component, fromUI: fromUI)
        }
    }

    override func applyChoiceIndexToDataSource(_ index:Int, data:IsOccursContentDataSource?) {

    }
    override func applyChoiceToDataSource(_ data:IsOccursContentDataSource?) {
        let new=self.contentType.applyDateValue(self.dateChoice, into: data)
        self.contentType=new
    }
    
    override func eraseChoiceInDataSource(_ data: IsOccursContentDataSource?) {
        let new=self.contentType.applyDateValue(nil, into: data)
        self.contentType=new
    }
    
    
}

