//
//  DateChooserSubController.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 6/14/16.
//  Copyright © 2016 Coffey. All rights reserved.
//

import UIKit

enum DateChooserType {
    case MonthDayYear, MonthYearOnly, YearOnly
}

class DateChooserSubController: OccursSubController {
    
    var dateView:DateView!
    var subControllers:[OccursSubController]?
    
    private lazy var dayOfMonthChoices:DayOfMonthChoicesProvider? =
        DayOfMonthChoicesProvider(contentType: OccursControlContentType.DayOfMonthChooser)
    
    private lazy var monthOfYearChoices:MonthOfYearChoicesProvider? =
        MonthOfYearChoicesProvider(contentType: OccursControlContentType.MonthOfYearChooser)
    
    private lazy var yearChoices:YearChoicesProvider? =
        YearChoicesProvider(contentType: OccursControlContentType.YearChooser)
    
    public var chooserType:DateChooserType?
    
    lazy var dateOccursData:OccursData?=OccursData.empty()
    
    deinit {
        dateView=nil
        subControllers?.removeAll()
        subControllers=nil
        dayOfMonthChoices=nil
        monthOfYearChoices=nil
        yearChoices=nil
        dateOccursData=nil
    }
    
    init( dateChooser:DateChooserType,
         purpose:OccursControlSubType,
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
        
        self.chooserType = dateChooser
        super.init(purpose: purpose, style: style, order: order, withinView: withinView, relativeTo: relativeTo, format: format, occursData: occursData, choicesProvider: choicesProvider, choiceDelegate: choiceDelegate, delegate: delegate)
        
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
    
    override func buildControl() -> IsSubControl {
        dateView=super.buildControl() as! DateView
        subControllers=[OccursSubController]()
        if let type=self.chooserType {
            switch type {
            case .MonthDayYear:
                self.buildMonthControl()
                self.buildDayControl()
                self.buildYearControl()
            case .MonthYearOnly:
                self.buildMonthControl()
                self.buildYearControl()
            case .YearOnly:
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
        var controller=OccursSubController(purpose: OccursControlSubType.DayOfMonthPicker,
                                           style: SubControllerStyle.VerticalStyle,
                                           order: subControllers!.count,
                                           withinView: dateView,
                                           relativeTo: relativeTo,
                                           format: ControlPresentationFormat.ScrolledHorizontally,
                                           occursData: dateOccursData!,
                                           choicesProvider: self.dayOfMonthChoices,
                                           choiceDelegate: DayOfMonthChoiceDelegate(holder:self.dayOfMonthChoices!, data:dateOccursData!),
                                           delegate:nil
        )
        subControllers!.append(controller)
    }
    
    func buildMonthControl() {
        var relativeTo:OccursSubController?=nil
        if subControllers!.count > 0 {
            relativeTo=subControllers!.last
        }
        var controller=OccursSubController(purpose: OccursControlSubType.MonthOfYearPicker,
                                           style: SubControllerStyle.VerticalStyle,
                                           order: subControllers!.count,
                                           withinView: dateView,
                                           relativeTo: relativeTo,
                                           format: ControlPresentationFormat.ScrolledHorizontally,
                                           occursData: dateOccursData!,
                                           choicesProvider: self.monthOfYearChoices,
                                           choiceDelegate: MonthOfYearChoiceDelegate(holder:self.monthOfYearChoices!, data:dateOccursData!),
                                           delegate:nil
        )
        subControllers!.append(controller)
    }
    func buildYearControl() {
        var relativeTo:OccursSubController?=nil
        if subControllers!.count > 0 {
            relativeTo=subControllers!.last
        }
        var controller=OccursSubController(purpose: OccursControlSubType.YearPicker,
                                           style: SubControllerStyle.VerticalStyle,
                                           order: subControllers!.count,
                                           withinView: dateView,
                                           relativeTo: relativeTo,
                                           format: ControlPresentationFormat.ScrolledHorizontally,
                                           occursData: dateOccursData!,
                                           choicesProvider: self.yearChoices,
                                           choiceDelegate: YearChoiceDelegate(holder:self.yearChoices!, data:dateOccursData!),
                                           delegate:nil
        )
        subControllers!.append(controller)
    }
    
    func setDayChoice(value:Int) {
        self.dayOfMonthChoices?.setDayChoice(value)
    }
    
    func setMonthChoice(value:Int) {
        self.monthOfYearChoices?.setMonthChoice(value)
    }
    
    func setYearChoice(value:Int) {
        self.yearChoices?.setYearChoice(value)
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
    
    override func willRemoveConstraints() {
        
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
extension OccursSubController {
    

    
}

