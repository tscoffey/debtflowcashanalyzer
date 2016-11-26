//
//  ItemMethodClearsEditorViewController.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 5/16/16.
//  Copyright © 2016 Coffey. All rights reserved.
//

import UIKit

class ItemMethodClearsEditorViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    var items_clear:ProposedItemsClear?
    var itemsClear:ProposedItemsClear? {
        get { return items_clear }
        set (aValue) {
            items_clear=aValue
            self.loadItemsClear()
        }
    }
    @IBOutlet weak var choicesView: UIPickerView!
    var choices:[String]=[String]()
    var editorSubtype:ItemsEditorSubEditorType { return .methodEditor }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        choices=(itemsClear?.howClears.buttonChoicesFor((itemsClear?.source)!))!
        self.loadItemsClear()
    }
    
    func loadItemsClear() {
        if self.itemsClear != nil {
            if self.choicesView != nil {
                self.choicesView.selectRow(Int((itemsClear?.howClears.rawValue)!), inComponent: 0, animated: true)
            }
        }
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
        let c=choicesView.selectedRow(inComponent: 0)
        itemsClear?.howClears=ClearsMethodType(rawValue:Int32(c))!
        
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
