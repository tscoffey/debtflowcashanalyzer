//
//  OccursVerticalViewController.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 6/10/16.
//  Copyright © 2016 Coffey. All rights reserved.
//

import UIKit

class OccursVerticalViewController: ReoccurranceBuilderViewController {


    
    override func viewDidLoad() {
        super.viewDidLoad()
        


        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let sub=self.addControllers(0,
                                contentType: .generalCategories,
                                relativeTo: nil)
        self.addSubviews(0)
        self.buildSubConstraints()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        
        if let sub=subControllers.first {
//            sub.choicesProvider?.setContentTypeChoice(.TwiceA, component: sub)
        }
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
