//
//  FirstLastDatesPickerViewController.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 5/19/16.
//  Copyright © 2016 Coffey. All rights reserved.
//

import UIKit

class FirstLastDatesPickerViewController: UIViewController,HasUIThemeComponents,IsNavigable {

    @IBOutlet weak var firstLastChooser:UISegmentedControl?
    @IBOutlet weak var dateChooser:UIDatePicker?
    
    var how_titled:HowTitled = .onView
    var title_string="First+Last Dates"
    
    var dates_holder:HasFirstLastDates?
    
    var datesHolder:HasFirstLastDates? {
        get { return dates_holder }
        set (aValue) { dates_holder=aValue
                        self.loadDate()
        }
    }
    
    var firstLastDatesSegmentView: UIView? { return self.firstLastChooser }
    
    var whichDate=0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        appDelegate().lookTheme.applyTo(self)
        self.loadDate()
        self.setTitle()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func firstLastChosen(_ sender: AnyObject) {
        self.whichDate=firstLastChooser!.selectedSegmentIndex
        self.loadDate()
    }
    
    @IBAction func dateChanged(_ sender: AnyObject) {
        if var holder=self.datesHolder {
            switch whichDate {
                case 0: holder.firstDateIs=dateChooser!.date
                case 1: holder.lastDateIs=dateChooser!.date
                default:break
            }
        }
    }
    
    func setMinimumMaximumDates() {
        var minDate:Date
        var maxDate:Date
        var defaultMinimum=Date.buildDate(2000, month: 1, day: 1)
        var defaultMaximum=Date.buildDate(2100, month:12, day:31)
        switch whichDate {
            case 0: minDate=defaultMinimum
            case 1:
                if let holder=self.datesHolder {
                    if let first=holder.firstDateIs {
                        minDate=first.addDaysToDate(1)
                    } else {
                        minDate=defaultMinimum
                    }
                } else {
                    minDate=defaultMinimum
                }
            default:
                minDate=defaultMinimum
        }
        
        switch whichDate {
            case 0:
                if let holder=self.datesHolder {
                    if let last=holder.lastDateIs {
                        maxDate=last.subtractDaysFromDate(1)
                    } else {
                        maxDate=defaultMaximum
                    }
                } else {
                    maxDate=defaultMaximum
                }
            case 1:
                maxDate=defaultMaximum
            default:
                maxDate=defaultMaximum
            
        }
        if let chooser=self.dateChooser {
            chooser.minimumDate=minDate
            chooser.maximumDate=maxDate
        }
    }
    func getNeededDate()-> Date? {
        if let holder=self.datesHolder {
            switch whichDate {
            case 0: return holder.firstDateIs as Date?
            case 1: return holder.lastDateIs as Date?
            default: return nil
            }
        } else {
            return nil
        }
    }
    
    func loadDate() {
        if let date=self.getNeededDate() {
            self.dateChooser?.date=date
            self.setMinimumMaximumDates()
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

extension FirstLastDatesPickerViewController {
    
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
