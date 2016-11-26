//
//  SourceAccountTypeEditorViewController.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 5/17/16.
//  Copyright © 2016 Coffey. All rights reserved.
//

import UIKit

class SourceAccountTypeEditorViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {

    var choices=["Checking","Savings"]
    
    var acct:ProposedSourceAccount?
    var account:ProposedSourceAccount? {
        get { return acct }
        set (aValue) {
            acct=aValue
            self.loadAccount()
        }
    }
    @IBOutlet weak var choicesView:UIPickerView!
    
    func loadAccount() {
        if self.account != nil {
            var row=0
            switch self.account!.type {
            case .checking: row=0
            case .savings: row=1
            default:row=1
            }
            self.choicesView.selectRow(row, inComponent: 0, animated: true)
        }
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadAccount()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return choices.count
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    open func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return choices[row]
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch row {
        case 0:self.account?.type=AccountType.checking
        case 1:self.account?.type=AccountType.savings
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
