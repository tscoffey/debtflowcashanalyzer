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
    
    var editorSubtype:ItemsEditorSubEditorType { return .whenEditor }

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
    
    @IBAction func daysChanged(_ sender: AnyObject) {
        let v=Int(numberOfDaysSlider.value)
        daysTextLabel.text=String(v)
        itemsClear?.clearedAfterDays=v as NSNumber?
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
    
    func setSliderTo(_ value:Int) {
        numberOfDaysSlider.value = Float(value)
        daysTextLabel.text=String(value)
        itemsClear?.clearedAfterDays=value as NSNumber?
    }
    
    func hideUnhideDaysWidgets() {
        if itemsClear!.whenClears.needsDays() {
            self.numberOfDaysSlider.isHidden=false
            self.howManyDaysTextLabel.isHidden=false
            self.howManyDaysTextLabel.text=self.itemsClear?.howManyDaysLabelText
            self.daysTextLabel.isHidden=false
            self.setSliderTo((itemsClear?.clearedAfterDaysOrZero())!)
        } else {
            self.numberOfDaysSlider.isHidden=true
            self.howManyDaysTextLabel.isHidden=true
            self.daysTextLabel.isHidden=true
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let c=choicesView.selectedRow(inComponent: 0)
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
