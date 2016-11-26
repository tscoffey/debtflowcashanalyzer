//
//  ClearsTypes.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 5/9/16.
//  Copyright © 2016 Coffey. All rights reserved.
//

enum ClearsMethodType:Int32 {
    case clearsAutomatically, clearsManually, categoryDetermines, accountDetermines
    
    func buttonChoicesFor(_ source:ProposedItemsClearsSource) -> [String] {
        switch source {
            case .fromPlannedSpending: return ["Automatically", "Manually", "Use Category", "Use Account"]
            default: return ["Automatically", "Manually"]
        }
    }
}

enum ClearsAmountType:Int32 {
    case clearsForExactAmount, clearsForVariableAmount, categoryDetermines, accountDetermines
    
    func buttonChoicesFor(_ source:ProposedItemsClearsSource) -> [String] {
        switch source {
        case .fromPlannedSpending: return ["Exact Amount", "Variable Amount", "Use Category", "Use Account"]
        default: return ["Exact Amount", "Variable Amount"]
        }
    }
}

enum ClearsDateType:Int32 {
    case clearsOnSendDate, clearsDaysAfterSendDate,  clearsDaysBeforeDueDate, clearsOnDueDate, clearsDaysAfterDueDate, categoryDetermines, accountDetermines
    
    func buttonChoicesFor(_ source:ProposedItemsClearsSource) -> [String] {
        switch source {
        case .fromPlannedSpending: return ["On Send Date", "After Send Date", "Before Due Date", "On Due Date", "After Due Date", "Use Category", "Use Account"]
        default: return ["On Send Date", "After Send Date", "Before Due Date", "On Due Date", "After Due Date"]
        }
    }
    
    func clearedDaysSigned(_ unsignedValue:Int) -> Int {
        switch self {
            case .clearsDaysBeforeDueDate: return 0 - unsignedValue
            default: return unsignedValue
        }
    }
    
    func needsDays() -> Bool {
        switch self {
        case .clearsDaysAfterSendDate, .clearsDaysBeforeDueDate, .clearsDaysAfterDueDate : return true
        default: return false
        }
    }
}

