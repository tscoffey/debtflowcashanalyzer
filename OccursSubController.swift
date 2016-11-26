//
//  OccursSubController.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 6/10/16.
//  Copyright © 2016 Coffey. All rights reserved.
//

import UIKit

class OccursSubController:UIViewController,HasUIThemeComponents {
    
    var purpose:OccursControlSubType!
    var style:SubControllerStyle!
    var order:Int!
    weak var inView:UIView!
    weak var relativeTo:OccursSubController?
    var format:ControlPresentationFormat!
    var choicesProvider:IsChoiceProvider?
    
    var contentType:OccursControlContentType {
        if let t=choicesProvider?.contentType {
            return t
        } else {
            return .anyLabel(label:"")
        }
    }

    lazy var control:IsOccursUIControl? = self.buildControl()
    
    func buildControl()->IsOccursUIControl {
        var c = style.buildControl(self)
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

        control=nil
    }
    
    init(purpose:OccursControlSubType,
         style:SubControllerStyle,
         order:Int,
         withinView:UIView,
         relativeTo:OccursSubController?,
         format:ControlPresentationFormat,
         choicesProvider:IsChoiceProvider?

        ) {
        self.style=style
        self.purpose=purpose
        self.order=order
        self.inView=withinView
        self.relativeTo=relativeTo
        self.format=format
        self.choicesProvider=choicesProvider
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
        appDelegate().lookTheme.applyTo(self)
        let v = (view as! IsOccursUIControl)
        v.setControlChoices(self.choicesProvider?.choices)
        style.addTarget(self, control: control)
        

//        inView.addConstraints(
//            format.buildConstraintsFor(control!, relativeTo: relativeTo, superView: inView)
//        )
    }
    
    override func viewDidAppear(_ animated:Bool) {
        if let i = self.choicesProvider?.choiceIndex {
            control!.controlSelectionIndex=i
        }
    }
    
    func buildConstraints()->[NSLayoutConstraint] {
        return format.buildConstraintsFor(control!, relativeTo: relativeTo, superView: inView, style:style)
    }
    
    func willRemoveConstraints() {
        
    }
    
    func pickerViewTextAlignment()->NSTextAlignment {
        return NSTextAlignment.center
    }
    
    var occursCategoryChooserView:UIView? {
        if self.purpose.isContentTypePicker() {
            return self.view
        } else {
            return nil
        }
    }
    
    var occursDateView:UIView? {
        if self.purpose.isDatePicker() {
            return view
        } else {
            return nil
        }
    }
    var occursLabelView:UILabel? {
        if self.purpose.isLabel() {
            return (self.view as! UILabel)
        } else {
            return nil
        }
    }
    
    func selectionIndexChanged(_ index:Int, component:OccursSubController, fromUI:Bool) {
        
    }
    
    func choicesChanged(_ choices:[Int], component:OccursSubController, fromUI:Bool) {
        
    }
    
    
    func dayOfMonthChanged(_ to:Int, sub:OccursSubController, fromUI:Bool, in:ReoccurranceBuilderViewController) {
    }
    func firstDayOfMonthChanged(_ to:Int, sub:OccursSubController, fromUI:Bool, in:ReoccurranceBuilderViewController) {
    }
    func secondDayOfMonthChanged(_ to:Int, sub:OccursSubController, fromUI:Bool, in:ReoccurranceBuilderViewController) {
    }
    
    func weekdayChanged(_ to:Int, sub:OccursSubController, fromUI:Bool, in:ReoccurranceBuilderViewController) {
    }
    func weekNumberOfMonthChanged(_ to:Int, sub:OccursSubController, fromUI:Bool, in:ReoccurranceBuilderViewController) {
    }
    func weekNumberOfQuarterChanged(_ to:Int, sub:OccursSubController, fromUI:Bool, in:ReoccurranceBuilderViewController) {
    }
    func weekNumberOfHalfYearhanged(_ to:Int, sub:OccursSubController, fromUI:Bool, in:ReoccurranceBuilderViewController) {
    }
    func weekNumberOfYearChanged(_ to:Int, sub:OccursSubController, fromUI:Bool, in:ReoccurranceBuilderViewController) {
    }
    
    func monthNumberOfQuarterChanged(_ to:Int, sub:OccursSubController, fromUI:Bool, in:ReoccurranceBuilderViewController) {
    }
    func monthNumberOfHalfYearChanged(_ to:Int, sub:OccursSubController, fromUI:Bool, in:ReoccurranceBuilderViewController) {
    }
    func monthNumberOfYearChanged(_ to:Int, sub:OccursSubController, fromUI:Bool, in:ReoccurranceBuilderViewController) {
    }
    
    func quarterOfYearChanged(_ to:Int, sub:OccursSubController, fromUI:Bool, in:ReoccurranceBuilderViewController) {
    }
    
    func yearChanged(_ to:Int, sub:OccursSubController, fromUI:Bool, in:ReoccurranceBuilderViewController) {
    }
    
    func firstDateChanged(_ to:Date, sub:OccursSubController, fromUI:Bool, in:ReoccurranceBuilderViewController) {
    }
    
    func lastDateChanged(_ to:Date, sub:OccursSubController, fromUI:Bool, in:ReoccurranceBuilderViewController) {
    }
    
}


//
//
// UI look
//
//
extension OccursSubController {

    var backgroundColor:UIColor? {
        if let f=self.format {
            switch f {
            case .scrolledVertically:
                if order % 2 == 0 {
                    return nil
                } else {
                    return UIColor.antiqueWhiteColor()
                }
            default: return nil
            }
        } else {
            return nil
        }
    }

    
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
//
// UISegmentedControl {
extension OccursSubController {
    func segmentChanged(_ sender:UISegmentedControl?) {
        if let s=sender {
            let row=s.selectedSegmentIndex
            self.choicesProvider?.setChoiceIndex(row, component: self, fromUI: true)

        }
        
    }
}

//
// UIPickerView datasource and delegate
//
extension OccursSubController:UIPickerViewDataSource {
    func numberOfComponents(in pickerView:UIPickerView)->Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView,
                    numberOfRowsInComponent component: Int) -> Int {
        return self.choicesProvider!.choices.count
    }
}
extension OccursSubController:UIPickerViewDelegate {
    
    
    func pickerView(_ pickerView: UIPickerView,
                    titleForRow row: Int,
                    forComponent component: Int) -> String? {
        return self.choicesProvider!.choices[row]
    }

    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var label:UILabel
        if view == nil {
            label=UILabel()
        } else {
            label = view as! UILabel
        }
        label.font = UIFont.systemFont(ofSize: 10)
        label.text = self.choicesProvider!.choices[row]
        label.textColor=self.view.tintColor
        label.textAlignment=self.pickerViewTextAlignment()
        return label
    }
    func pickerView(_ pickerView: UIPickerView,
                    didSelectRow row: Int,
                                 inComponent component: Int) {
        self.choicesProvider?.setChoiceIndex(row, component: self, fromUI: true)

    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 14
    }
}

//
// HorizontalPickerView datasource and delegate
//
extension OccursSubController:HorizontalPickerViewDataSource {
    func numberOfRowsInHorizontalPickerView (_ pickerView: HorizontalPickerView) -> Int {
        return self.choicesProvider!.choices.count
    }
    
}
extension OccursSubController:HorizontalPickerViewDelegate {
    
    func textFontForHorizontalPickerView (_ pickerView: HorizontalPickerView) -> UIFont {
        return UIFont.systemFont(ofSize: 13)
    }
    func textColorForHorizontalPickerView (_ pickerView: HorizontalPickerView) -> UIColor {
        return appDelegate().lookTheme.lookValues.occursCategoryChooserTintColor!
    }
    
    func horizontalPickerView (_ pickerView: HorizontalPickerView, titleForRow: Int) -> String {
        if titleForRow >= 0 {
        let c=self.choicesProvider!.choices
        if c.count > titleForRow {
            return c[titleForRow]
        } else {
            return ""
        }
        } else { return "" }

    }
    func horizontalPickerView (_ pickerView: HorizontalPickerView, didSelectRow: Int) {
        self.choicesProvider?.setChoiceIndex(didSelectRow, component: self, fromUI: true)


        
    }
    func useTwoLineModeForHorizontalPickerView (_ pickerView: HorizontalPickerView) -> Bool {
        return false
    }
    
}

//
//
// DKDropMenuDelegate
//
//
extension OccursSubController:DKDropMenuDelegate {
    func itemSelectedWithIndex(_ index: Int, name:String) {
        self.choicesProvider?.setChoiceIndex(index, component: self, fromUI: true)


        
    }
    
}

//
//
// UIDropDownDelegate
//
//
extension OccursSubController:UIDropDownDelegate {
    func dropDown(_ dropDown: UIDropDown, didSelectOption option: String, atIndex row: Int) {
        self.choicesProvider?.setChoiceIndex(row, component: self, fromUI: true)

    }
    
}

//
//
// UITableViewDataSource, Delegate
//
//
extension OccursSubController:UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.choicesProvider?.choices.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "Cell")!
        cell.textLabel!.text=self.choicesProvider!.choices[(indexPath as NSIndexPath).row]
        cell.textLabel!.font=UIFont.systemFont(ofSize: 13)
        cell.textLabel?.textAlignment=NSTextAlignment.center
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}

extension OccursSubController:UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.choicesProvider?.setChoiceIndex((indexPath as NSIndexPath).row, component: self, fromUI: true)

    }
    
}


