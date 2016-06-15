//
//  ControllerProtocols.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 5/17/16.
//  Copyright © 2016 Coffey. All rights reserved.
//

import Foundation
import UIKit


enum HowTitled {
    case OnTabBar, OnView, Untitled
}

protocol IsNavigable {
    
    var howTitled:HowTitled? { get set }
    
    var titleString:String? { get set }
    
    var labelToTitle:UILabel? { get }
    
    var controllerToTitle:UIViewController? { get }
    
    func setTitle()
    
}

extension IsNavigable {
    
    var howTitled:HowTitled? {
        get { return .Untitled }
        set (aValue) {}
    }
    
    var titleString:String? {
        get { return nil }
        set (aValue) {}
    }
    var labelToTitle:UILabel? { return nil }
    var controllerToTitle:UIViewController? { return nil }
    
    func setTitle() {
        if let title=self.titleString {
            if let how=self.howTitled {
                switch how {
                case .OnTabBar:
                    if let ctrl=self.controllerToTitle {
                        ctrl.title=title
                    }
                case .OnView:
                    if let label=self.labelToTitle {
                        label.text=title
                    }
                case .Untitled:
                    if let ctrl=self.controllerToTitle {
                        ctrl.title=""
                    }
                    if let label=self.labelToTitle {
                        label.text=""
                    }
                }
            }
        }
    }
}

