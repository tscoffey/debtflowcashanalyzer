//
//  DayOfWeekPickerViewController.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 5/19/16.
//  Copyright © 2016 Coffey. All rights reserved.
//

import UIKit

class DayOfWeekPickerViewController: UIViewController,HasUIThemeComponents {
    
    var day_of_week:Int=0
    var dayOfWeek:Int {
        get { return day_of_week }
        set (aValue) { day_of_week = aValue
                        self.loadView()
        }
    }
    
    @IBOutlet weak var dayOfWeekControlNormal:UISegmentedControl?
    
    @IBOutlet weak var dayOfWeekControlCompact:UISegmentedControl?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        appDelegate().lookTheme.applyTo(self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    func whichDayOfWeekControl()->UISegmentedControl? {
        if let c=self.dayOfWeekControlNormal { return c }
        if let c=self.dayOfWeekControlCompact { return c }
        return nil
    }
   
    func loadDayOfWeek() {
        if let c=self.whichDayOfWeekControl() {
            c.selectedSegmentIndex=day_of_week
        }
    }

    @IBAction func dayOfWeekCompactChanged(sender: AnyObject) {
        if let c=self.whichDayOfWeekControl() {
            self.day_of_week=c.selectedSegmentIndex
        }
    }
    @IBAction func dayOfWeekNormalChanged(sender: AnyObject) {
        if let c=self.whichDayOfWeekControl() {
            self.day_of_week=c.selectedSegmentIndex
        }
    }
}

extension DayOfWeekPickerViewController {
    
    var dayOfWeekPickerSegmentView:UIView? { return self.whichDayOfWeekControl() }
}
