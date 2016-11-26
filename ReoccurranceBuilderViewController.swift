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
    lazy var subControllerStyle:SubControllerStyle = SubControllerStyle.horizontalStyle
    
    lazy var occursData:ProposedReoccurrance? = ProposedReoccurrance()
    lazy var subControllers:[OccursSubController] = { [unowned self] in return [OccursSubController]() }()
    
    var controlChoices:OccursSingleControlArray  {
        var result=OccursSingleControlArray ()
        for sub in subControllers {
            if let provider=sub.choicesProvider {
                if provider.contentType.isLabel() {
                } else {
                    result.append(provider.contentType)
                }
            }
        }
        return result
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }




    
    func presentationFormat()->ControlPresentationFormat {
        return ControlPresentationFormat.scrolledVertically
    }
    
    func subControllerChoiceSelected(_ sub:OccursSubController, index:Int) {
        
        if sub.order == subControllers.count - 1 {
            if let p=sub.purpose {
                switch p {
                case OccursControlSubType.contentTypePicker:
                    let c=sub.choicesProvider!.contentTypeSubChoices!
                    let next=c[index]
                    var last=sub.order+1
                    self.addControllers(subControllers.count, contentType: next,relativeTo: sub)
                    self.addSubviews(last)
                    self.buildSubConstraints()
                default: break
                }
            }
        } else {
            if sub.purpose.isContentTypePicker() {
                var i = sub.order
                while subControllers.count > i! + 1 {
                    subControllers.last?.choicesProvider?.eraseChoiceInDataSource(occursData!)
                    let last=subControllers.last!.view
                    subControllers.removeLast()
                    last?.removeFromSuperview()
                }
                self.subControllerChoiceSelected(sub, index:index)
            } else {
                let subs=subControllers.filter(){ $0.order != sub.order }
                if sub.contentType.isNumberChooser() {
                    for each in subs {
                        switch sub.contentType {
                        case .dayOfMonthChooser(let new):
                            each.dayOfMonthChanged(new!, sub:sub, fromUI:true, in:self)
                        case .weekdayChooser(let new):
                            each.weekdayChanged(new!, sub:sub, fromUI:true, in:self)
                        case .monthNumberOfQuarterChooser(let new):
                            each.monthNumberOfQuarterChanged(new!, sub:sub, fromUI:true, in:self)
                        case .quarterOfYearChooser(let new):
                            each.quarterOfYearChanged(new!, sub:sub, fromUI:true, in:self)
                        case .yearChooser(let new):
                            each.yearChanged(new!, sub:sub, fromUI:true, in:self)

                        default: break
                        }
                    }
                }
                
            }
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
// IsChoiceProvider for various controls
//
//

extension ReoccurranceBuilderViewController {
    func choiceProviderOfSubType(_ ofSubType:OccursControlSubType) -> IsChoiceProvider? {
        
        for sub in subControllers {
            
            if sub.purpose.isEqualTo(ofSubType) {
                return sub.choicesProvider
            }
            
        }
        return nil
    }
    func choiceProviderOfType(_ ofType:OccursControlContentType)->IsChoiceProvider? {
        for sub in subControllers {
            
            if sub.contentType.isEqualTo(ofType) {
                return sub.choicesProvider
            }
            
        }
        return nil
    }
    var dayOfMonthHolder:IsChoiceProvider? { return self.choiceProviderOfSubType(.dayOfMonthPicker) }
    var weekdayHolder:IsChoiceProvider? { return self.choiceProviderOfSubType(.weekdayPicker) }
    var monthOfYearHolder:IsChoiceProvider? { return self.choiceProviderOfSubType(.monthNumberOfYearPicker) }
    var yearHolder:IsChoiceProvider? { return self.choiceProviderOfSubType(.yearPicker)}
    var monthNumberOfQuarterHolder:IsChoiceProvider? { return self.choiceProviderOfSubType(.monthNumberOfQuarterPicker)}
    var quarterOfYearHolder:IsChoiceProvider? { return self.choiceProviderOfSubType(.quarterOfYearPicker)}
        var firstDateHolder:IsChoiceProvider? {
            return self.choiceProviderOfType(.firstDateChooser(type:DateChooserType.fullDate,value:nil))
    }
    var lastDateHolder:IsChoiceProvider? {
        return self.choiceProviderOfType(.lastDateChooser(type:DateChooserType.fullDate,value:nil))
    }
    
}
extension ReoccurranceBuilderViewController {
    
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
    
    func addSubController(_ sub:OccursSubController) {
        self.subControllers.append(sub)
    }
    

    func buildController(_ order:Int,
                         contentType:OccursControlContentType,
                         relativeTo:OccursSubController?,
                         style:SubControllerStyle)->OccursSubController {
        let subType=contentType.occursControlSubType()
        switch subType {
        case .contentTypePicker:
            return self.buildOccursContentTypeController(order, contentType: contentType, relativeTo:relativeTo, style: style)
        case .staticLabel:
            return self.buildLabel(order, contentType: contentType, relativeTo:relativeTo)
        default:
            return self.buildChooserController(order, contentType: contentType, relativeTo:relativeTo, style: style)
            
        }
    }
    
    func buildControllers(_ order:Int, contentType:OccursControlContentType, relativeTo:OccursSubController?) -> [OccursSubController] {
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
    
    func addControllers(_ order:Int, contentType:OccursControlContentType, relativeTo:OccursSubController?) {
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
    
    func buildOccursContentTypeController(_ order:Int,
                                          contentType:OccursControlContentType,
                                          relativeTo:OccursSubController?,
                                          style:SubControllerStyle)->OccursSubController {
        
        var choicesHolder=OccursContentTypeChoicesProvider(contentType: contentType, choice: nil, delegate:self)
        
        var controller=OccursSubController(purpose: contentType.occursControlSubType(),
                                           style: SubControllerStyle.segmentedStyle,
                                           order: order,
                                           withinView: subViews,
                                           relativeTo: relativeTo,
                                           format: self.presentationFormat(),
                                           choicesProvider: choicesHolder
                                           
        )
        choicesHolder.initChoiceIndexTo(0,data:occursData!)
        return controller
    }
    
    func buildChooserController(_ order:Int,
                                contentType:OccursControlContentType,
                                relativeTo:OccursSubController?,
                                style:SubControllerStyle)->OccursSubController {
        
        let purpose=contentType.occursControlSubType()
        var chooserType:DateChooserType?
        switch contentType {
            case .firstDateChooser(let t, let d): chooserType=t
            case .lastDateChooser(let t, let d): chooserType=t
            default:chooserType = nil
        }
        var choicesHolder=purpose.buildChoicesProvider(contentType)
        var controller=purpose.buildSubController(style,
                                           order: order,
                                           withinView: subViews,
                                           relativeTo: relativeTo,
                                           format: self.presentationFormat(),
                                           choicesProvider: choicesHolder,
                                           dateChooserType:chooserType,
                                           dateChoices:occursData!)
        
        choicesHolder.initChoiceIndexTo(0,data:occursData!)
        
        return controller!
    }
    

    func buildLabel(_ order:Int,
                    contentType:OccursControlContentType,
                    relativeTo:OccursSubController?)->OccursSubController {
        var choicesHolder=contentType.textLabel()
        var controller=OccursSubController(purpose: contentType.occursControlSubType(),
                                           style: .labelStyle,
                                           order: order,
                                           withinView: subViews,
                                           relativeTo: relativeTo,
                                           format: self.presentationFormat(),
                                           choicesProvider: choicesHolder
                                           
        )
        let label=controller.control?.controlView as! UILabel
        label.text=contentType.textLabel()
        label.textAlignment=NSTextAlignment.center
        return controller
    }
    
}

//
//
// IsSubControlChoiceDelegate
//
//

extension ReoccurranceBuilderViewController:IsSubControlChoiceDelegate {
    
    func didSelectIndex(_ index:Int, component:OccursSubController, fromUI:Bool) {
        component.choicesProvider?.applyChoiceToDataSource(occursData)
        if !fromUI {
            component.control?.controlSelectionIndex=index
        }
        self.subControllerChoiceSelected(component, index: index)
    }
    
    func didChangeChoices(_ choices:[Int], component:OccursSubController, fromUI:Bool) {
        if !fromUI {
            component.control?.needsDisplay()            
        }
    }
    
    func didSelectDate(_ date:Date, component:OccursSubController, fromUI:Bool) {
        component.choicesProvider?.applyChoiceToDataSource(occursData)
        
    }

}

//
//
// Subview handling
//
//
extension ReoccurranceBuilderViewController {
    
    func addSubviews(_ startAt:Int) {
        if startAt < self.subControllers.count {
            for i in startAt...self.subControllers.count - 1 {
                self.subViews.addSubview(subControllers[i].view)
            }
        }
    }
}
