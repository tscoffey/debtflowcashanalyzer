//
//  AccountMasterListControllerTableViewController.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 5/11/16.
//  Copyright © 2016 Coffey. All rights reserved.
//

import UIKit

class SourceAccountMasterListTableViewController: UITableViewController {
    
    var accountSelectedDelegate:SourceAccountSelectedDelegate?
    
    var reuseCellName:String { return "SourceAccountCell" }
    
    
    var accountsHolder:HasManyAccounts?
    
    lazy var accounts:[IsSourceAccount] =  { [unowned self] in
        return self.accountsHolder!.accountsAre.filter()
            {$0.accountType.isSourceAccount()}.map()
                {$0 as! IsSourceAccount}.sort(){$0.nameIs < $1.nameIs}
    }()
    

//    var tempNames:[String]=["A","B","C","D"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let lv=appDelegate().lookValues
        lv.applyBackgroundColor(lv.accountListTableBackgroundColor, toView:self.tableView)
        lv.applyTintColor(lv.accountListTableTintColor, toView:self.tableView)
    }
    
    override func viewDidAppear(animated: Bool) {
        

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
       return accounts.count

    }


    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let selected=self.accounts[indexPath.row]
        if let del=self.accountSelectedDelegate {
            del.didSelectSourceAccount(selected)
        }
    }
    
    override func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        if let del=self.accountSelectedDelegate {
            del.didDeselectSourceAccount()
        }
    }
    
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        cell.backgroundColor = UIColor.clearColor()
        let lv=appDelegate().lookValues
        if let c=lv.accountListTableTextColor {
            cell.textLabel?.textColor=c
        }

    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(self.reuseCellName, forIndexPath: indexPath)
        let acct=self.accounts[indexPath.row]
        cell.textLabel?.text=acct.nameIs
        return cell
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */


    // MARK: - Navigation

    /*
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.

    }
 */


}
