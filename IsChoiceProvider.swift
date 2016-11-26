//
//  IsChoiceProvider.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 6/10/16.
//  Copyright © 2016 Coffey. All rights reserved.
//

import Foundation

protocol IsChoiceProvider {
    var choice:String? { get }
    var choiceIndex:Int? { get }
    var choices:[String] { get }
    var contentType:OccursControlContentType { get set }
    var numberSubChoices:[Int]? { get }
    var numberChoice:Int? { get }
    var contentTypeSubChoices:[OccursControlContentType]? { get }
    

    func setChoiceIndex(_ index:Int, component:OccursSubController, fromUI:Bool)
    func setNumberChoices(_ choices:[Int], component:OccursSubController, fromUI:Bool)
    
    var dateChoice:Date? { get }
    func setDateChoice(_ date:Date, component:OccursSubController, fromUI:Bool)
    func setContentTypeChoice(_ value:OccursControlContentType, component:OccursSubController)
    
    func applyChoiceToDataSource(_ data:IsOccursContentDataSource?)
    func eraseChoiceInDataSource(_ data:IsOccursContentDataSource?)
    
    func initChoiceIndexTo(_ index:Int, data:IsOccursContentDataSource)
    
}
extension IsChoiceProvider {
    var numberSubChoices:[Int]? {
        get { return nil }
    }
    var numberChoice:Int? { return nil }
    var contentTypeSubChoices:[OccursControlContentType]? {
        get { return nil }
    }
    
    func setChoiceIndex(_ index:Int, component:OccursSubController, fromUI:Bool) {}
    func setNumberChoices(_ choices:[Int], component:OccursSubController, fromUI:Bool) {}
    
    var dateChoice:Date? { return nil }
    func setDateChoice(_ date:Date, component:OccursSubController, fromUI:Bool) {}
    func setContentTypeChoice(_ value:OccursControlContentType, component:OccursSubController) {}
    
    func applyChoiceToDataSource(_ data:IsOccursContentDataSource?) {}
    func eraseChoiceInDataSource(_ data:IsOccursContentDataSource?) {}
    func initChoiceIndexTo(_ index:Int, data:IsOccursContentDataSource) {}


}
