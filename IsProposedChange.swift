//
//  IsProposedChange.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 5/16/16.
//  Copyright © 2016 Coffey. All rights reserved.
//

protocol IsProposedChange {
    func isEditingNew() -> Bool
    func isEditingOld() -> Bool
    func isValidAsProposed() -> Bool
}

