//
//  LargeAccountListAndEditViewController.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 5/12/16.
//  Copyright © 2016 Coffey. All rights reserved.
//

import UIKit

enum AccountEditorSubEditorType:Int {
    case nameEditor, typeEditor, clearsSendsEditor
    
    func editorDescription() -> String {
        switch self {
        case .nameEditor: return "Account name"
        case .typeEditor: return "Type of account"
        case .clearsSendsEditor: return "How account clears and sends items"
        }
    }
}
class NormalSourceAccountListAndEditViewController: UIViewController,SourceAccountSelectedDelegate,IsNavigable {

    var accountsHolder:HasManyAccounts?
    var selected:IsSourceAccount?

    var prevChoiceContainerView:UIView?

    @IBOutlet weak var clearSendsEditorContainer: UIView!
    var clearsSendsEditorController:ItemsClearEditorViewController?
    
    @IBOutlet weak var accountsListContainer: UIView!
    var accountsListController:SourceAccountMasterListTableViewController?
    
    @IBOutlet weak var accountEditChoices: UISegmentedControl!
    
    @IBOutlet weak var editorDescription:UILabel!

    @IBOutlet weak var accountNameEditorContainer: UIView!
    var accountNameEditorController:SourceAccountNameEditorViewController?

    
    @IBOutlet weak var accountTypeEditorContainer: UIView!
    var accountTypeEditorController:SourceAccountTypeEditorViewController?
    
    
    var editorSubtype:AccountEditorSubEditorType?
    
    var how_titled:HowTitled = .onView
    var title_string="Source Accounts"



    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {

        
        let lv=appDelegate().lookValues
        lv?.applyBackgroundColor(lv?.accountEditorSegmentedOptionsBackgroundColor, toView: self.accountEditChoices)
        lv?.applyTintColor(lv?.accountEditorSegmentedOptionsTintColor, toView: self.accountEditChoices)
        self.accountNameEditorContainer.isHidden=true
        self.accountTypeEditorContainer.isHidden=true
        self.clearSendsEditorContainer.isHidden=true
        self.editorDescription.isHidden=true
        self.accountEditChoices.isHidden=true
        self.setTitle()
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func presentEditorFor(_ choice:Int) {
        var newChoiceContainerView:UIView?
        switch choice {
        case 0: newChoiceContainerView=self.accountNameEditorContainer
        case 1: newChoiceContainerView=self.accountTypeEditorContainer
        case 2: newChoiceContainerView=self.clearSendsEditorContainer
            
        default: newChoiceContainerView=nil
        }
        if let new=newChoiceContainerView {
            if prevChoiceContainerView != nil && prevChoiceContainerView != new {
                UIView.animate(withDuration: 0.5,
                                           animations: {
                                            new.alpha=1
                                            self.prevChoiceContainerView!.alpha=0

                })
            } else {
                new.alpha=1
            }
            
            prevChoiceContainerView=new
        }
        self.editorSubtype=AccountEditorSubEditorType(rawValue:choice)
        self.editorDescription.text=self.editorSubtype!.editorDescription()

    }
    
    @IBAction func editChoicesChanged(_ sender: AnyObject) {
        self.presentEditorFor(accountEditChoices.selectedSegmentIndex)
    }


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if let id=segue.identifier {
            switch id {
                case "toAccountsListTable":
                    self.accountsListController=(segue.destination as! SourceAccountMasterListTableViewController)
                    self.accountsListController?.accountsHolder=self.accountsHolder
                    self.accountsListController?.accountSelectedDelegate=self
                case "toAccountNameEditor":
                    self.accountNameEditorController=(segue.destination as! SourceAccountNameEditorViewController)
                case "toAccountTypeEditor":
                    self.accountTypeEditorController=(segue.destination as! SourceAccountTypeEditorViewController)
                case "toClearsSendsEditor":
                    self.clearsSendsEditorController=(segue.destination as! ItemsClearEditorViewController)
                    if let c=self.clearsSendsEditorController {
                        c.howTitled = .untitled
                        c.titleString="Account Clear+Send Settings"
                        c.itemsClear=ProposedItemsClear(source:.fromSourceAccount)
                }
                default: break
            }
        }
    }

    func loadAccount() {
        
        if self.selected != nil {
            let p=ProposedSourceAccount(from: selected!)
            let ct=ProposedItemsClear(from:selected!)
            self.accountNameEditorController?.account=p
            self.accountTypeEditorController?.account=p
            self.clearsSendsEditorController?.itemsClear=ct
            self.accountNameEditorContainer.isHidden=false
            self.accountTypeEditorContainer.isHidden=false
            self.clearSendsEditorContainer.isHidden=false
            self.editorDescription.isHidden=false
            self.accountEditChoices.isHidden=false
            self.presentEditorFor(accountEditChoices.selectedSegmentIndex)
        }
        
    }
    func didSelectSourceAccount(_ account:IsSourceAccount) {
        self.selected=account
        self.loadAccount()
    }
    
    func didDeselectSourceAccount() {
        self.selected=nil
        self.loadAccount()
    }

}

extension NormalSourceAccountListAndEditViewController {
    
    var howTitled:HowTitled? {
        get { return how_titled }
        set (aValue) {how_titled = aValue!}
    }
    
    var titleString:String? {
        get { return title_string }
        set (aValue) {title_string = aValue!}
    }
    var labelToTitle:UILabel? { return nil }
    var controllerToTitle:UIViewController? { return self }
    
}
