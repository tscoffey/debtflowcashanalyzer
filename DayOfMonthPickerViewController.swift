//
//  DayOfMonthPickerViewController.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 5/19/16.
//  Copyright © 2016 Coffey. All rights reserved.
//

import UIKit

class DayOfMonthPickerViewController: UIViewController,HorizontalPickerViewDelegate,HorizontalPickerViewDataSource {

    @IBOutlet weak var pickerContainer:UIView?
    var dayPicker:HorizontalPickerView?
    
    var day:Int=1
    var dayChosen:Int {
        get { return day }
        set (aValue) { day=aValue}
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        if let c=self.pickerContainer {
            dayPicker=HorizontalPickerView(frame:c.frame)
            if let p=self.dayPicker {
                
                c.addSubview(p)
                p.delegate=self
                p.dataSource=self
            }
        
        }
    }
    
    func numberOfRowsInHorizontalPickerView(pickerView: HorizontalPickerView) -> Int {
        return 31
    }
    func horizontalPickerView (pickerView: HorizontalPickerView, titleForRow: Int) -> String {
        return String(titleForRow+1)
    }
    func horizontalPickerView (pickerView: HorizontalPickerView, didSelectRow: Int) {
        day=didSelectRow+1            
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
