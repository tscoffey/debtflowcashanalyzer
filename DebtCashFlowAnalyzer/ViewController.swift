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
        let del=UIApplication.shared.delegate as! AppDelegate
        del.currentMediator=StubbedMediator()
        
        self.title="Testing Launcher"


        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let id=segue.identifier {
            switch id {
                
            case "toClearSettings":
                let vc=segue.destination as! ItemsClearEditorViewController
                vc.itemsClear=ProposedItemsClear(source:.fromSourceAccount)
                vc.itemsClear?.sendsMethod=ItemSendMethodType.pulledFromAccount
                vc.itemsClear?.whenClears=ClearsDateType.clearsDaysAfterDueDate
                vc.itemsClear?.amountClears=ClearsAmountType.clearsForVariableAmount
                vc.itemsClear?.howClears=ClearsMethodType.accountDetermines
            case "toAccountListEditor":
                let vc=segue.destination as! NormalSourceAccountListAndEditViewController
                vc.accountsHolder=PhonyAccountHolder()
            case "toDatePicker":
                
                let vc=segue.destination as! FirstLastDatesPickerViewController
                vc.datesHolder=PhonyDateHolder( first: Date.buildDate(2016, month: 3, day: 20), last: Date.buildDate(2018, month: 12, day: 31))
            case "toOccursBuilder":
                let vc=segue.destination as! OccursVerticalViewController
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
