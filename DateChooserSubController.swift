//
//  DateChooserSubController.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 6/14/16.
//  Copyright © 2016 Coffey. All rights reserved.
//

import UIKit

class DateChooserSubController: OccursSubController {
    
    var dateView:DateView!
    var subControllers:[OccursSubController]?
    var viewStyle=SubControllerStyle.horizontalStyle
    var viewFormat=ControlPresentationFormat.scrolledVertically
    
    var controlChoices:OccursSingleControlArray  {
        var result=OccursSingleControlArray ()
        for sub in subControllers! {
            if let provider=sub.choicesProvider {
                if provider.contentType.isLabel() {
                } else {
                    result.append(provider.contentType)
                }
            }
        }
        return result
    }

    
    fileprivate lazy var dayOfMonthChoices:DayOfMonthChoicesProvider? =
        DayOfMonthChoicesProvider(contentType: OccursControlContentType.dayOfMonthChooser(value:nil), choice:nil, delegate:self)
    
    fileprivate lazy var monthOfYearChoices:MonthNumberOfYearChoicesProvider? =
        MonthNumberOfYearChoicesProvider(contentType: OccursControlContentType.monthNumberOfYearChooser(value:nil), choice:nil, delegate:self)
    fileprivate lazy var quarterChoices:QuarterChoicesProvider? =
        QuarterChoicesProvider(contentType: OccursControlContentType.quarterOfYearChooser(value:nil), choice:nil, delegate:self)
    
    fileprivate lazy var yearChoices:YearChoicesProvider? =
        YearChoicesProvider(contentType: OccursControlContentType.yearChooser(value:nil), choice:nil, delegate:self)
    
    fileprivate var _chooserType:DateChooserType?
    
    var chooserType:DateChooserType? {
        get {return _chooserType }
        set (aValue) { _chooserType = aValue }
    }
    
    fileprivate var dateChoicesHolder:IsOccursContentDataSource!
    
    fileprivate var monthChooserControl:OccursSubController?
    fileprivate var quarterChooserControl:OccursSubController?
    fileprivate var dayChooserControl:OccursSubController?
    fileprivate var yearChooserControl:OccursSubController?
    
    deinit {
        dateView=nil
        subControllers?.removeAll()
        subControllers=nil
        dayOfMonthChoices=nil
        monthOfYearChoices=nil
        yearChoices=nil
    }
    
    init( dateChooser:DateChooserType,
         purpose:OccursControlSubType,
         style:SubControllerStyle,
         order:Int,
         withinView:UIView,
         relativeTo:OccursSubController?,
         format:ControlPresentationFormat,
         choicesProvider:IsChoiceProvider?,
         dateChoices:IsOccursContentDataSource
         
        ) {
        
        _chooserType = dateChooser
        dateChoicesHolder=dateChoices
        super.init(purpose: purpose, style: style, order: order, withinView: withinView, relativeTo: relativeTo, format: .scrolledVertically,  choicesProvider: choicesProvider)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addSubviews()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func buildControl() -> IsOccursUIControl {
        dateView=super.buildControl() as! DateView
        subControllers=[OccursSubController]()
        if let type=self.chooserType {
            switch type {
            case .fullDate:
                self.buildMonthControl()
                self.buildDayControl()
                self.buildYearControl()
            case .monthAndYearOnly:
                self.buildMonthControl()
                self.buildYearControl()
            case .quarterAndYearOnly:
                self.buildQuarterControl()
                self.buildYearControl()
            case .yearOnly:
                self.buildYearControl()
            }
        }
        return dateView
    }
    
    func buildDayControl() {
        var relativeTo:OccursSubController?=nil
        if subControllers!.count > 0 {
            relativeTo=subControllers!.last
        }
        let controller=OccursSubController(purpose: OccursControlSubType.dayOfMonthPicker,
                                           style: viewStyle,
                                           order: subControllers!.count,
                                           withinView: dateView,
                                           relativeTo: relativeTo,
                                           format: viewFormat,
                                           choicesProvider: self.dayOfMonthChoices
        )
        subControllers!.append(controller)
        dayChooserControl=controller
        dayOfMonthChoices?.initChoiceIndexTo(0, data: dateChoicesHolder)
    }
    
    func buildMonthControl() {
        var relativeTo:OccursSubController?=nil
        if subControllers!.count > 0 {
            relativeTo=subControllers!.last
        }
        var controller=OccursSubController(purpose: OccursControlSubType.monthNumberOfYearPicker,
                                           style: viewStyle,
                                           order: subControllers!.count,
                                           withinView: dateView,
                                           relativeTo: relativeTo,
                                           format: viewFormat,
                                           choicesProvider: self.monthOfYearChoices
        )
        subControllers!.append(controller)
        monthChooserControl=controller
        monthOfYearChoices?.initChoiceIndexTo(0, data: dateChoicesHolder)
    }
    func buildQuarterControl() {
        var relativeTo:OccursSubController?=nil
        if subControllers!.count > 0 {
            relativeTo=subControllers!.last
        }
        var controller=OccursSubController(purpose: OccursControlSubType.quarterOfYearPicker,
                                           style: viewStyle,
                                           order: subControllers!.count,
                                           withinView: dateView,
                                           relativeTo: relativeTo,
                                           format: viewFormat,
                                           choicesProvider: self.quarterChoices
        )
        subControllers!.append(controller)
        quarterChooserControl=controller
        quarterChoices?.initChoiceIndexTo(0, data: dateChoicesHolder)
    }
    func buildYearControl() {
        var relativeTo:OccursSubController?=nil
        if subControllers!.count > 0 {
            relativeTo=subControllers!.last
        }
        var controller=OccursSubController(purpose: OccursControlSubType.yearPicker,
                                           style: viewStyle,
                                           order: subControllers!.count,
                                           withinView: dateView,
                                           relativeTo: relativeTo,
                                           format: viewFormat,
                                           choicesProvider: self.yearChoices
        )
        subControllers!.append(controller)
        yearChooserControl=controller
        yearChoices?.initChoiceIndexTo(0, data: dateChoicesHolder)
    }
    
    func setDayChoice(_ value:Int) {
        self.dayOfMonthChoices?.setDayChoice(value, component: dayChooserControl!)
    }
    
    func setMonthChoice(_ value:Int) {
        self.monthOfYearChoices?.setMonthChoice(value, component: monthChooserControl!)
    }
    
    func setYearChoice(_ value:Int) {
        self.yearChoices?.setYearChoice(value, component: yearChooserControl!)
    }
    
    func addSubviews() {
        for sub in self.subControllers! {
            dateView.addSubview(sub.view)
        }
    }
    func buildSubConstraints() {
        
        for sub in self.subControllers! {
            sub.willRemoveConstraints()
        }
        
        dateView.removeConstraints(dateView.constraints)
        for sub in self.subControllers! {
            dateView.addConstraints(sub.buildConstraints())
        }
    }
    override func buildConstraints()->[NSLayoutConstraint] {
        self.buildSubConstraints()
        return format.buildConstraintsFor(control!, relativeTo: relativeTo, superView: inView, style:style)
    }
    
    override func pickerViewTextAlignment()->NSTextAlignment {
        return NSTextAlignment.center
    }

    
    override func willRemoveConstraints() {
        
    }
    
    func setDayChoices(_ days:[Int]) {
       
    
    }
    
    func currentDate()->Date {
        return Date.buildDate(self.getYearChosen(), month: self.getMonthChosen(), day: self.getDayChosen())
    }
    func sendDateChoice() {
        let date=self.currentDate()
        choicesProvider?.setDateChoice(date, component: self, fromUI: false)
    }
    
    func getYearChosen()->Int {
        return dateChoicesHolder.year!
    }
    func getMonthNumberOfQuarterChosen()->Int {
        return dateChoicesHolder.monthOfQuarter!
    }
    func getQuarterChosen()->Int {
        return dateChoicesHolder.quarterOfYear!
    }
    
    func getMonthChosen()->Int {
        if let t=self.chooserType {
            switch t {
            case .quarterAndYearOnly:
                let q=self.getQuarterChosen()
                let m=self.getMonthNumberOfQuarterChosen()
                let month=(q - 1) * 3 + m
                return month
            default:
                return dateChoicesHolder.monthOfYear!
            }
        }
        return dateChoicesHolder.monthOfYear!
    }
    func getDayChosen()->Int {
        return dateChoicesHolder.dayOfMonth!
    }
    
    func updateControlsForChosenMonth(_ month:Int?) {
        if let control = dayChooserControl, let m = month {
            var days=0...0
            let year=self.getYearChosen()
            if [1,3,5,7,8,10,12].contains(m) {
                days=(1...31)
            } else {
                if m == 2 {
                    if year % 4 == 0 {
                        days=(1...29)
                    } else {
                        days=(1...28)
                    }
                } else {
                    days=(1...30)
                }
            }
            var mapped=days.map(){ $0 }
            control.choicesProvider?.setNumberChoices(mapped, component: control, fromUI: false)
        }        
    }
    func updateControlsForChosenYear(_ year:Int?) {
        self.updateControlsForChosenMonth(self.getMonthChosen())
    }
    
    override func selectionIndexChanged(_ index:Int, component:OccursSubController, fromUI:Bool) {
        
        switch component.choicesProvider!.contentType {
        case .monthNumberOfYearChooser:
            self.updateControlsForChosenMonth(self.getMonthChosen())
            
        case .dayOfMonthChooser:
            break
        case .quarterOfYearChooser:
            break
        case .yearChooser:
            self.updateControlsForChosenYear(self.getYearChosen())
        default:break
        }
        self.sendDateChoice()
    }
    
    
    override func dayOfMonthChanged(_ to:Int, sub:OccursSubController, fromUI:Bool, in:ReoccurranceBuilderViewController) {
        self.selectionIndexChanged(0, component: sub, fromUI: fromUI)
    }
    
    override func weekdayChanged(_ to:Int, sub:OccursSubController, fromUI:Bool, in:ReoccurranceBuilderViewController) {
        let monthBias=self.currentDate().weekdayBiasOfMonthFor()
        var firstDayInMonth = to - monthBias + 1
        if firstDayInMonth < 1 {
            firstDayInMonth = firstDayInMonth + 7
        }
        var lastDayInMonth = firstDayInMonth + 21
        if self.currentDate().daysInMonthFor() - 7 >= lastDayInMonth {
            lastDayInMonth = lastDayInMonth + 7
        }
        let days=(stride(from: firstDayInMonth, to: lastDayInMonth+1, by: 7)).map(){ $0 }
        self.setDayChoices(days)
    }
    
    override  func choicesChanged(_ choices:[Int], component:OccursSubController, fromUI:Bool) {
        switch component.choicesProvider!.contentType {
        case .monthNumberOfYearChooser:
            monthChooserControl!.control?.needsDisplay()
        case .dayOfMonthChooser:
            dayChooserControl!.control?.needsDisplay()
        case .quarterOfYearChooser:
            quarterChooserControl!.control?.needsDisplay()
        case .yearChooser:
            yearChooserControl!.control?.needsDisplay()
        default:break
        }

        
        
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}


//
//
// Constraints
//
//
extension DateChooserSubController:IsSubControlChoiceDelegate {
    
    func didSelectIndex(_ index:Int, component:OccursSubController, fromUI:Bool) {
        component.choicesProvider?.applyChoiceToDataSource(dateChoicesHolder!)
        if !fromUI {
            component.control?.controlSelectionIndex=index
        }
        self.selectionIndexChanged(index, component: component, fromUI: fromUI)
        
    }
    
    func didChangeChoices(_ choices:[Int], component:OccursSubController, fromUI:Bool) {
        if !fromUI {
            component.control?.needsDisplay()
        
        }
    }


    

    
}

