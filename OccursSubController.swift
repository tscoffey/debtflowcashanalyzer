//
//  OccursSubController.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 6/10/16.
//  Copyright © 2016 Coffey. All rights reserved.
//

import UIKit

class OccursSubController:UIViewController {
    
    var purpose:OccursControlSubType!
    var style:SubControllerStyle!
    var order:Int!
    weak var inView:UIView!
    weak var relativeTo:OccursSubController?
    var format:ControlPresentationFormat!
    var choicesProvider:IsChoiceProvider?
    var choiceDelegate:IsSubControlChoiceDelegate?
    var delegate:ReoccurranceBuilderViewController?
    lazy var control:IsSubControl? = self.buildControl()
    
    func buildControl()->IsSubControl {
        var c = style.buildControl()
        c.setControlDataSource(self)
        c.setControlDelegate(self)
        return c

    }
    deinit {
        purpose=nil
        order=nil
        style=nil
        inView=nil
        relativeTo=nil
        format=nil
        choicesProvider=nil
        choiceDelegate=nil
        delegate=nil
        control=nil
    }
    
    init(purpose:OccursControlSubType,
         style:SubControllerStyle,
         order:Int,
         withinView:UIView,
         relativeTo:OccursSubController?,
         format:ControlPresentationFormat,
         occursData:IsOccursContentDataSource,
         choicesProvider:IsChoiceProvider?,
         choiceDelegate:IsSubControlChoiceDelegate?,
         delegate:ReoccurranceBuilderViewController?
        ) {
        self.style=style
        self.purpose=purpose
        self.order=order
        self.inView=withinView
        self.relativeTo=relativeTo
        self.format=format
        self.choicesProvider=choicesProvider
        self.choiceDelegate=choiceDelegate
        self.delegate=delegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func loadView() {
        view=control!.controlView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        inView.addConstraints(
//            format.buildConstraintsFor(control!, relativeTo: relativeTo, superView: inView)
//        )
    }
    
    override func viewWillAppear(animated:Bool) {
        if let i = self.choicesProvider?.choiceIndex(0) {
            control!.controlSelectionIndex=i
        }
    }
    
    func buildConstraints()->[NSLayoutConstraint] {
        return format.buildConstraintsFor(control!, relativeTo: relativeTo, superView: inView, style:style)
    }
    
    func willRemoveConstraints() {
        
    }
    

}

//
//
// Constraints 
//
//
extension OccursSubController {
    

    
}

//
//
// UIViews for constraint anchoring
//
//
extension OccursSubController {
    func bottomMostViewForAnchoring()->UIView? { return self.view }
    func topMostViewForAnchoring()->UIView? { return self.view }
    func leftMostViewForAnchoring()->UIView? { return self.view }
    func rightMostViewForAnchoring()->UIView? { return self.view }
}

//
// UIPickerView datasource and delegate
//
extension OccursSubController:UIPickerViewDataSource {
    func numberOfComponentsInPickerView(pickerView:UIPickerView)->Int {
        return 1
    }
    func pickerView(pickerView: UIPickerView,
                    numberOfRowsInComponent component: Int) -> Int {
        return self.choicesProvider!.choices(component).count
    }
}
extension OccursSubController:UIPickerViewDelegate {
    func pickerView(pickerView: UIPickerView,
                    titleForRow row: Int,
                    forComponent component: Int) -> String? {
        return self.choicesProvider!.choices(component)[row]
    }
    func pickerView(pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let s=self.choicesProvider!.choices(component)[row]
        var ns=NSMutableAttributedString(string:s)
        var range = NSRange()
        range.location=0
        range.length=s.characters.count
        ns.addAttribute(NSFontAttributeName, value: UIFont.systemFontOfSize(13),
                        range: range
        )
        return ns
    }
    func pickerView(pickerView: UIPickerView,
                    didSelectRow row: Int,
                                 inComponent component: Int) {
        self.choiceDelegate?.didSelectIndex(row, component:component)
        delegate?.subControllerChoiceSelected(self, index: row)
    }
}

//
// HorizontalPickerView datasource and delegate
//
extension OccursSubController:HorizontalPickerViewDataSource {
    func numberOfRowsInHorizontalPickerView (pickerView: HorizontalPickerView) -> Int {
        return self.choicesProvider!.choices(0).count
    }
    
}
extension OccursSubController:HorizontalPickerViewDelegate {
    
    func textFontForHorizontalPickerView (pickerView: HorizontalPickerView) -> UIFont {
        return UIFont.systemFontOfSize(13)
    }
    func textColorForHorizontalPickerView (pickerView: HorizontalPickerView) -> UIColor {
        return UIView().tintColor
    }
    
    func horizontalPickerView (pickerView: HorizontalPickerView, titleForRow: Int) -> String {
        if titleForRow >= 0 {
        let c=self.choicesProvider!.choices(0)
        if c.count > titleForRow {
            return c[titleForRow]
        } else {
            return ""
        }
        } else { return "" }

    }
    func horizontalPickerView (pickerView: HorizontalPickerView, didSelectRow: Int) {
        self.choiceDelegate?.didSelectIndex(didSelectRow, component:0)
        delegate?.subControllerChoiceSelected(self, index: didSelectRow)

        
    }
    
}


