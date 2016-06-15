//
//  ReoccurranceBuilderViewController.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 6/10/16.
//  Copyright © 2016 Coffey. All rights reserved.
//

import UIKit

class ReoccurranceBuilderViewController: UIViewController {
    
    @IBOutlet weak var subViews:UIView!
    lazy var subControllerStyle:SubControllerStyle = SubControllerStyle.HorizontalStyle
    
    var occursData:IsOccursContentDataSource!
    lazy var subControllers:[OccursSubController] = { [unowned self] in return [OccursSubController]() }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }




    
    func presentationFormat()->ControlPresentationFormat {
        return ControlPresentationFormat.ScrolledVertically
    }
    
    func subControllerChoiceSelected(sub:OccursSubController, index:Int) {
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

extension ReoccurranceBuilderViewController {
    
    func buildSubConstraints() {
        var prev:UIView?
        
        for sub in self.subControllers {
            sub.willRemoveConstraints()
        }
        
        subViews.removeConstraints(subViews.constraints)
        for sub in self.subControllers {
            subViews.addConstraints(sub.buildConstraints())
        }
    }
}

//
//
// SubControllers handling
//
//
extension ReoccurranceBuilderViewController {
    
    func addSubController(sub:OccursSubController) {
        self.subControllers.append(sub)
    }
    

    func buildController(order:Int,
                         contentType:OccursControlContentType,
                         relativeTo:OccursSubController?,
                         style:SubControllerStyle)->OccursSubController {
        switch contentType.occursControlSubType() {
        case .ContentTypePicker:
            return self.buildOccursContentTypeController(order, contentType: contentType, relativeTo:relativeTo, style: style)
        case .DayOfMonthPicker:
            return self.buildDayOfMonthController(order, contentType: contentType, relativeTo:relativeTo, style: style)
        case .WeekdayPicker:
            return self.buildWeekdayController(order, contentType: contentType, relativeTo:relativeTo, style: style)
        case .MonthNumberOfQuarterPicker:
            return self.buildMonthOfQuarterController(order, contentType: contentType, relativeTo:relativeTo, style: style)
        case .MonthOfYearPicker:
            return self.buildMonthOfYearController(order, contentType: contentType, relativeTo:relativeTo, style: style)
//        case .DatePicker:
//            return self.buildFullDateController(order, contentType: contentType, relativeTo:relativeTo, style: style)
        case .StaticLabel:
            return self.buildLabel(order, contentType: contentType, relativeTo:relativeTo)
        default:
            return self.buildOccursContentTypeController(order, contentType: contentType, relativeTo:relativeTo, style: style)
            
        }
    }
    
    func buildControllers(order:Int, contentType:OccursControlContentType, relativeTo:OccursSubController?) -> [OccursSubController] {
        let next=contentType.nextOccursControls()
        if contentType.isCategoryItem() {
            if next.count == 1 {
                return [self.buildController(order,
                    contentType: contentType,
                    relativeTo: relativeTo,
                    style: self.presentationFormat().controllerStyleFor(contentType))]
            }
            var subs=[OccursSubController]()
            var relative=relativeTo
            var nextOrder=order
            for control in next {
                let sub=self.buildController(nextOrder,
                                             contentType: control.first!,
                                             relativeTo: relative,
                                             style: self.presentationFormat().controllerStyleFor(control.first!))
                subs.append(sub)
                relative=sub
                nextOrder=nextOrder+1
            }
            return subs
        }
        return [self.buildController(order,
            contentType: contentType,
            relativeTo: relativeTo,
            style: self.presentationFormat().controllerStyleFor(contentType))]
    }
    
    func addControllers(order:Int, contentType:OccursControlContentType, relativeTo:OccursSubController?) {
        for sub in self.buildControllers(order, contentType: contentType, relativeTo: relativeTo) {
            self.addSubController(sub)
        }
    }
}

//
//
// Specific OccursSubController type builds
//
//
extension ReoccurranceBuilderViewController {
    
    func buildOccursContentTypeController(order:Int,
                                          contentType:OccursControlContentType,
                                          relativeTo:OccursSubController?,
                                          style:SubControllerStyle)->OccursSubController {
        
        var choicesHolder=OccursContentTypeChoicesProvider(contentType: contentType, choice: nil)
        var controller=OccursSubController(purpose: contentType.occursControlSubType(),
                                           style: style,
                                           order: order,
                                           withinView: subViews,
                                           relativeTo: relativeTo,
                                           format: self.presentationFormat(),
                                           occursData: occursData,
                                           choicesProvider: choicesHolder,
                                           choiceDelegate: OccursContentTypeChoiceDelegate(holder:choicesHolder, data:occursData),
                                           delegate:self
        )
        return controller
    }
    
    func buildDayOfMonthController(order:Int,
                                   contentType:OccursControlContentType,
                                   relativeTo:OccursSubController?,
                                   style:SubControllerStyle)->OccursSubController {
        
        var choicesHolder=DayOfMonthChoicesProvider(contentType: contentType, choice: nil)
        var controller=OccursSubController(purpose: contentType.occursControlSubType(),
                                           style: style,
                                           order: order,
                                           withinView: subViews,
                                           relativeTo: relativeTo,
                                           format: self.presentationFormat(),
                                           occursData: occursData,
                                           choicesProvider: choicesHolder,
                                           choiceDelegate: DayOfMonthChoiceDelegate(holder:choicesHolder, data:occursData),
                                           delegate:self
        )
        return controller
    }
    
    func buildWeekdayController(order:Int,
                                contentType:OccursControlContentType,
                                relativeTo:OccursSubController?,
                                style:SubControllerStyle)->OccursSubController {
        
        var choicesHolder=WeekdayChoicesProvider(contentType: contentType, choice: nil)
        var controller=OccursSubController(purpose: contentType.occursControlSubType(),
                                           style: style,
                                           order: order,
                                           withinView: subViews,
                                           relativeTo: relativeTo,
                                           format: self.presentationFormat(),
                                           occursData: occursData,
                                           choicesProvider: choicesHolder,
                                           choiceDelegate: WeekdayChoiceDelegate(holder:choicesHolder, data:occursData),
                                           delegate:self
        )
        return controller
    }
    
    func buildMonthOfQuarterController(order:Int,
                                       contentType:OccursControlContentType,
                                       relativeTo:OccursSubController?,
                                       style:SubControllerStyle)->OccursSubController {
        
        var choicesHolder=MonthOfQuarterChoicesProvider(contentType: contentType, choice: nil)
        var controller=OccursSubController(purpose: contentType.occursControlSubType(),
                                           style: style,
                                           order: order,
                                           withinView: subViews,
                                           relativeTo: relativeTo,
                                           format: self.presentationFormat(),
                                           occursData: occursData,
                                           choicesProvider: choicesHolder,
                                           choiceDelegate: MonthOfQuarterChoiceDelegate(holder:choicesHolder, data:occursData),
                                           delegate:self
        )
        return controller
    }
    
    func buildMonthOfYearController(order:Int,
                                    contentType:OccursControlContentType,
                                    relativeTo:OccursSubController?,
                                    style:SubControllerStyle)->OccursSubController {
        
        var choicesHolder=MonthOfYearChoicesProvider(contentType: contentType, choice: nil)
        var controller=OccursSubController(purpose: contentType.occursControlSubType(),
                                           style: style,
                                           order: order,
                                           withinView: subViews,
                                           relativeTo: relativeTo,
                                           format: self.presentationFormat(),
                                           occursData: occursData,
                                           choicesProvider: choicesHolder,
                                           choiceDelegate: MonthOfYearChoiceDelegate(holder:choicesHolder, data:occursData),
                                           delegate:self
        )
        return controller
    }
    
    




    
    func buildLabel(order:Int,
                    contentType:OccursControlContentType,
                    relativeTo:OccursSubController?)->OccursSubController {
        var choicesHolder=contentType.textLabel()
        var controller=OccursSubController(purpose: contentType.occursControlSubType(),
                                           style: .LabelStyle,
                                           order: order,
                                           withinView: subViews,
                                           relativeTo: relativeTo,
                                           format: self.presentationFormat(),
                                           occursData: occursData,
                                           choicesProvider: choicesHolder,
                                           choiceDelegate:nil,
                                           delegate:nil
        )
        let label=controller.control?.controlView as! UILabel
        label.text=contentType.textLabel()
        label.textAlignment=NSTextAlignment.Center
        return controller
    }
    
}

//
//
// Subview handling
//
//
extension ReoccurranceBuilderViewController {
    
    func addSubviews(startAt:Int) {
        if startAt < self.subControllers.count {
            for i in startAt...self.subControllers.count - 1 {
                self.subViews.addSubview(subControllers[i].view)
            }
        }
    }
}
