//
//  AccountNameEditorViewController.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 5/17/16.
//  Copyright © 2016 Coffey. All rights reserved.
//

import UIKit

class SourceAccountNameEditorViewController: UIViewController,UITextFieldDelegate {

    var acct:ProposedSourceAccount?
    var account:ProposedSourceAccount? {
        get { return acct }
        set (aValue) {
            acct=aValue
            self.loadAccount()
        }
    }
    
    @IBOutlet weak var nameLabel:UITextField!
    
    func loadAccount() {
        if self.account != nil {
            self.nameLabel.text=self.account?.name
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
    
        
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if let t=self.nameLabel.text {
            if t.characters.count  > 0 {
                self.account?.name=t
            }
        }
        return true
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
