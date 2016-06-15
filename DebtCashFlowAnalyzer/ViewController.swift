//
//  ItemsClearEditorStarterViewController.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 5/16/16.
//  Copyright © 2016 Coffey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let del=UIApplication.sharedApplication().delegate as! AppDelegate
        del.currentMediator=StubbedMediator()
        
        self.title="Testing Launcher"


        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(animated: Bool) {

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let id=segue.identifier {
            switch id {
                
            case "toClearSettings":
                let vc=segue.destinationViewController as! ItemsClearEditorViewController
                vc.itemsClear=ProposedItemsClear(source:.FromSourceAccount)
                vc.itemsClear?.sendsMethod=ItemSendMethodType.PulledFromAccount
                vc.itemsClear?.whenClears=ClearsDateType.ClearsDaysAfterDueDate
                vc.itemsClear?.amountClears=ClearsAmountType.ClearsForVariableAmount
                vc.itemsClear?.howClears=ClearsMethodType.AccountDetermines
            case "toAccountListEditor":
                let vc=segue.destinationViewController as! NormalSourceAccountListAndEditViewController
                vc.accountsHolder=PhonyAccountHolder()
            case "toDatePicker":
                
                let vc=segue.destinationViewController as! FirstLastDatesPickerViewController
                vc.datesHolder=PhonyDateHolder( first: buildDate(2016, month: 3, day: 20), last: buildDate(2018, month: 12, day: 31))
            case "toOccursBuilder":
                let vc=segue.destinationViewController as! OccursVerticalViewController
                vc.occursData=OccursData.monthlyOn(10)
            default: break
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
