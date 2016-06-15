//
//  ClearsTypes.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 5/9/16.
//  Copyright © 2016 Coffey. All rights reserved.
//

enum ClearsMethodType:Int32 {
    case ClearsAutomatically, ClearsManually, CategoryDetermines, AccountDetermines
    
    func buttonChoicesFor(source:ProposedItemsClearsSource) -> [String] {
        switch source {
            case .FromPlannedSpending: return ["Automatically", "Manually", "Use Category", "Use Account"]
            default: return ["Automatically", "Manually"]
        }
    }
}

enum ClearsAmountType:Int32 {
    case ClearsForExactAmount, ClearsForVariableAmount, CategoryDetermines, AccountDetermines
    
    func buttonChoicesFor(source:ProposedItemsClearsSource) -> [String] {
        switch source {
        case .FromPlannedSpending: return ["Exact Amount", "Variable Amount", "Use Category", "Use Account"]
        default: return ["Exact Amount", "Variable Amount"]
        }
    }
}

enum ClearsDateType:Int32 {
    case ClearsOnSendDate, ClearsDaysAfterSendDate,  ClearsDaysBeforeDueDate, ClearsOnDueDate, ClearsDaysAfterDueDate, CategoryDetermines, AccountDetermines
    
    func buttonChoicesFor(source:ProposedItemsClearsSource) -> [String] {
        switch source {
        case .FromPlannedSpending: return ["On Send Date", "After Send Date", "Before Due Date", "On Due Date", "After Due Date", "Use Category", "Use Account"]
        default: return ["On Send Date", "After Send Date", "Before Due Date", "On Due Date", "After Due Date"]
        }
    }
    
    func clearedDaysSigned(unsignedValue:Int) -> Int {
        switch self {
            case .ClearsDaysBeforeDueDate: return 0 - unsignedValue
            default: return unsignedValue
        }
    }
    
    func needsDays() -> Bool {
        switch self {
        case .ClearsDaysAfterSendDate, .ClearsDaysBeforeDueDate, .ClearsDaysAfterDueDate : return true
        default: return false
        }
    }
}

