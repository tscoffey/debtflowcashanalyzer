//
//  ItemClearsProtocols.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 5/16/16.
//  Copyright © 2016 Coffey. All rights reserved.
//

import Foundation

protocol HasItemClearsTypes {
    var itemHowClearsIs:ClearsMethodType { get set }
    var itemAmountClearsIs:ClearsAmountType { get set }
    var itemWhenClearsIs:ClearsDateType { get set }
    var clearsAfterDaysIs:NSNumber? { get set }
    var itemSendMethodTypeIs:ItemSendMethodType { get set }
}
