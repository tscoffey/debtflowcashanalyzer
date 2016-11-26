//
//  OccursChoicesProvider.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 6/10/16.
//  Copyright © 2016 Coffey. All rights reserved.
//

import UIKit

class OccursChoicesProvider:IsChoiceProvider {
    
    internal var _delegate:IsSubControlChoiceDelegate!
    
    fileprivate var _contentType:OccursControlContentType?
    
    var contentType:OccursControlContentType {
        get { return _contentType! }
        set (aValue) { _contentType=aValue }
    }
    
    fileprivate var _choiceIndex:Int?

    fileprivate lazy var _numberChoices:[Int]? = self.buildNumberSubChoices()
    
    func buildNumberSubChoices() -> [Int] { return [] }
    
    var numberSubChoices: [Int]? {
        get { return _numberChoices }
    }
    
    var numberChoice:Int? {
        if let choices=self.numberSubChoices {
            var index:Int
            if let i=self.choiceIndex {
                index = i
            } else {
                index = 0
            }
            return choices[index]
        } else {
            return nil
        }
    }
    
    
    var choice:String? {
        if let i = self.choiceIndex {
            return self.choices[i]
        } else {
            return nil
        }
    }
    var choiceIndex:Int? {
        get { return _choiceIndex }
    }
    
    var _choices:[String]?
    
    func buildStringChoices() -> [String] { return [] }
    
    var choices:[String] {
        if _choices == nil {
            _choices = self.buildStringChoices()
        }
        return _choices!
    }
    
    lazy var _contentTypeSubChoices:[OccursControlContentType]? = self.buildContentTypeSubChoices()
    
    func buildContentTypeSubChoices()->[OccursControlContentType] { return [] }

    var contentTypeSubChoices: [OccursControlContentType]? {
        get { return _contentTypeSubChoices }
    }

    
    init(contentType:OccursControlContentType, choice:Int?, delegate:IsSubControlChoiceDelegate?) {
        _contentType=contentType
        _choiceIndex = choice
        _delegate=delegate
        
    }
    
    deinit {
        _contentType = nil
        _choiceIndex = nil
        _numberChoices = nil
        _contentTypeSubChoices=nil
        _choices = nil
        _delegate=nil

    }
    
    func setChoiceIndex(_ index:Int, component:OccursSubController, fromUI:Bool) {
        _choiceIndex=index
        if let d = _delegate {
            d.didSelectIndex(index, component: component, fromUI: fromUI)
        }
    }
    
    func setNumberChoices(_ choices:[Int], component:OccursSubController, fromUI:Bool) {
        _numberChoices=choices
        _choices = self.buildStringChoices()
        if let d = _delegate {
            d.didChangeChoices(choices, component: component, fromUI: fromUI)
        }
    }
    
    func setDateChoice(_ date:Date, component:OccursSubController, fromUI:Bool) {}
    func setContentTypeChoice(_ value:OccursControlContentType, component:OccursSubController) {}

    func applyChoiceIndexToDataSource(_ index:Int,data:IsOccursContentDataSource?) {
        let new=self.contentType.applyNumberValue(self.numberSubChoices![index], into: data)
        self.contentType=new
    }
    func applyChoiceToDataSource(_ data:IsOccursContentDataSource?) {
        let new=self.contentType.applyNumberValue(self.choiceIndex!, into: data)
        self.contentType=new
    }
    func eraseChoiceInDataSource(_ data:IsOccursContentDataSource?) {
        let new=self.contentType.applyNumberValue(nil, into: data)
        self.contentType=new

        
    }
    
    func initChoiceIndexTo(_ index: Int, data: IsOccursContentDataSource) {
        self._choiceIndex = index
        self.applyChoiceToDataSource(data)
        _choiceIndex = nil
    }
}
