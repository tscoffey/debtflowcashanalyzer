//
//  ItemWhenClearsEditorViewController.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 5/16/16.
//  Copyright © 2016 Coffey. All rights reserved.
//

import UIKit

class ItemWhenClearsEditorViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    var items_clear:ProposedItemsClear?
    var itemsClear:ProposedItemsClear? {
        get { return items_clear }
        set (aValue) {
            items_clear=aValue
            self.loadItemsClear()
        }
    }
    @IBOutlet weak var numberOfDaysSlider: UISlider!
    @IBOutlet weak var choicesView: UIPickerView!
    @IBOutlet weak var howManyDaysTextLabel: UILabel!
    @IBOutlet weak var daysTextLabel: UILabel!
    
    var editorSubtype:ItemsEditorSubEditorType { return .WhenEditor }

    var choices:[String]=[String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        choices=(itemsClear?.whenClears.buttonChoicesFor((itemsClear?.source)!))!
        self.loadItemsClear()
    }


    func loadItemsClear() {
        if self.itemsClear != nil {
            if self.choicesView != nil {
                self.choicesView.selectRow(Int((itemsClear?.whenClears.rawValue)!), inComponent: 0, animated: true)
                self.hideUnhideDaysWidgets()
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func daysChanged(sender: AnyObject) {
        let v=Int(numberOfDaysSlider.value)
        daysTextLabel.text=String(v)
        itemsClear?.clearedAfterDays=v
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return choices.count
    }
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    public func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return choices[row]
        
    }
    
    func setSliderTo(value:Int) {
        numberOfDaysSlider.value = Float(value)
        daysTextLabel.text=String(value)
        itemsClear?.clearedAfterDays=value
    }
    
    func hideUnhideDaysWidgets() {
        if itemsClear!.whenClears.needsDays() {
            self.numberOfDaysSlider.hidden=false
            self.howManyDaysTextLabel.hidden=false
            self.howManyDaysTextLabel.text=self.itemsClear?.howManyDaysLabelText
            self.daysTextLabel.hidden=false
            self.setSliderTo((itemsClear?.clearedAfterDaysOrZero())!)
        } else {
            self.numberOfDaysSlider.hidden=true
            self.howManyDaysTextLabel.hidden=true
            self.daysTextLabel.hidden=true
        }
    }
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let c=choicesView.selectedRowInComponent(0)
        itemsClear?.whenClears=ClearsDateType(rawValue:Int32(c))!
        self.hideUnhideDaysWidgets()
        
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
