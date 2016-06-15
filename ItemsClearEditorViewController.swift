//
//  ItemsClearEditorViewController.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 5/16/16.
//  Copyright © 2016 Coffey. All rights reserved.
//

import UIKit

enum ItemsEditorSubEditorType:Int {
    case MethodEditor, AmountEditor, WhenEditor, SendEditor
    
    func editorDescriptionFor(source:ProposedItemsClearsSource) -> String {
        var desc:[String]
        switch self {
            case .AmountEditor:
                desc=["How does the amount clear?", "How do amounts clear?", "How do amounts clear?"]
            case .MethodEditor:
                desc=["How does this clear?", "How do items clear?", "How do items clear?"]
            case .WhenEditor:
                desc=["When does this clear?", "When do these items clear?", "When do these items clear?"]
            case .SendEditor:
                desc=["How is this paid?", "How are items paid?", "How are items paid?"]
        }
        return desc[source.rawValue]
    }
}

class ItemsClearEditorViewController: UIViewController, IsNavigable, HasUIThemeComponents {

    var items_clear:ProposedItemsClear?
    var itemsClear:ProposedItemsClear? {
        get { return items_clear }
        set (aValue) {
            items_clear=aValue
            self.loadItemsClear()
        }
    }
    
    var prevChoiceContainerView:UIView?

    
    @IBOutlet weak var editorLabel: UILabel!
    
    @IBOutlet weak var amountClearsContainerView: UIView!

    @IBOutlet weak var methodClearsContainerView: UIView!
    
    @IBOutlet weak var whenClearsContainerView: UIView!

    @IBOutlet weak var sendMethodContainerView: UIView!
    
    @IBOutlet weak var clearsSegmentedChoices: UISegmentedControl!
    
    @IBOutlet weak var editorDescription: UILabel!
    
    var methodClearsController:ItemMethodClearsEditorViewController?
    var amountClearsController:ItemAmountClearsEditorViewController?
    var whenClearsController:ItemWhenClearsEditorViewController?
    var sendMethodController:ItemSendMethodEditorViewController?
    
    var editorSubtype:ItemsEditorSubEditorType?
    
    var clearsEditorSegmentedView: UIView? { return self.clearsSegmentedChoices }
        
    var how_titled:HowTitled = .OnView
    var title_string="Clear+Send Settings"


    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        editorLabel.text=itemsClear?.editorLabelText
    }
   

    override func viewWillAppear(animated: Bool) {
        
        self.clearsSegmentedChoices.selectedSegmentIndex=0
        self.methodClearsContainerView.alpha=0
        self.amountClearsContainerView.alpha=0
        self.whenClearsContainerView.alpha=0
        self.sendMethodContainerView.alpha=0
        appDelegate().lookTheme.applyTo(self)
        self.setTitle()
        
        
    }
    
    func loadItemsClear() {
        if self.itemsClear != nil {

            if let vc=self.methodClearsController { vc.itemsClear=self.itemsClear }
            if let vc=self.amountClearsController { vc.itemsClear=self.itemsClear }
            if let vc=self.whenClearsController { vc.itemsClear=self.itemsClear }
            if let vc=self.sendMethodController { vc.itemsClear=self.itemsClear }
        }
    }
    override func viewDidAppear(animated: Bool) {


        self.presentEditorFor(0)

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func presentEditorFor(choice:Int) {
        var newChoiceContainerView:UIView?
        switch choice {
            case 0:
                newChoiceContainerView = self.methodClearsContainerView
            case 1:
                newChoiceContainerView = self.amountClearsContainerView
            case 2:
                newChoiceContainerView = self.whenClearsContainerView
            case 3:
                newChoiceContainerView = self.sendMethodContainerView
            default: newChoiceContainerView=nil
        }
        if let new=newChoiceContainerView {
            if prevChoiceContainerView != nil {
                UIView.animateWithDuration(0.5,
                    animations: {
                        new.alpha=1
                        self.prevChoiceContainerView!.alpha=0
                })
            } else {
                new.alpha=1
            }
            
            prevChoiceContainerView=new
            self.editorSubtype=ItemsEditorSubEditorType(rawValue:choice)
            self.editorDescription.text=self.editorSubtype!.editorDescriptionFor(itemsClear!.source)
        }

        
    }
    @IBAction func clearsChoicesChanged(sender: AnyObject) {
        self.presentEditorFor(clearsSegmentedChoices.selectedSegmentIndex)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let id=segue.identifier {
            switch id {
                case "toAmountClearsEditor":
                    self.amountClearsController=segue.destinationViewController as! ItemAmountClearsEditorViewController
                    self.amountClearsController!.itemsClear=self.itemsClear
                case "toMethodClearsEditor":
                    self.methodClearsController=segue.destinationViewController as! ItemMethodClearsEditorViewController
                    self.methodClearsController!.itemsClear=self.itemsClear
                case "toWhenClearsEditor":
                    self.whenClearsController=segue.destinationViewController as! ItemWhenClearsEditorViewController
                    self.whenClearsController!.itemsClear=self.itemsClear
                case "toSendMethodEditor":
                    self.sendMethodController=segue.destinationViewController as! ItemSendMethodEditorViewController
                    self.sendMethodController!.itemsClear=self.itemsClear
            default:
                let x=1
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

extension ItemsClearEditorViewController {
    
    var howTitled:HowTitled? {
        get { return how_titled }
        set (aValue) {how_titled = aValue!}
    }
    
    var titleString:String? {
        get { return title_string }
        set (aValue) {title_string = aValue!}
    }
    var labelToTitle:UILabel? { return editorLabel }
    var controllerToTitle:UIViewController? { return self }
    
}
