//
//  OccursVerticalViewController.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 6/10/16.
//  Copyright © 2016 Coffey. All rights reserved.
//

import UIKit

class OccursVerticalViewController: ReoccurranceBuilderViewController {


    
    override func viewDidLoad() {
        super.viewDidLoad()
        


        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        let sub=self.addControllers(0,
                                contentType: .GeneralCategories,
                                relativeTo: nil)
        self.addSubviews(0)
        self.buildSubConstraints()
    }

    
    override  func subControllerChoiceSelected(sub:OccursSubController, index:Int) {
        
        if sub.order == subControllers.count - 1 {
            if let p=sub.purpose {
                switch p {
                case OccursControlSubType.ContentTypePicker:
                    let c=(sub.choicesProvider as! OccursContentTypeChoicesProvider).subChoices
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
                while subControllers.count > i + 1 {
                    let last=subControllers.last!.view
                    subControllers.removeLast()
                    last.removeFromSuperview()
                }
                self.subControllerChoiceSelected(sub, index:index)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
