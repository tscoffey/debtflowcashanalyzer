//
//  ColorTupleTableViewController.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 5/18/16.
//  Copyright © 2016 Coffey. All rights reserved.
//

import UIKit
fileprivate func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l < r
  case (nil, _?):
    return true
  default:
    return false
  }
}

fileprivate func <= <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l <= r
  default:
    return !(rhs < lhs)
  }
}


class ColorTupleTableViewController: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource {

    var colorTuples:[ColorTuple]!
    var tuplesByGroup=Dictionary<Int, [ColorTuple]>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        colorTuples=allColorTuples().sorted(){
            if $0.group < $1.group { return true }
            if $0.group == $1.group { return $0.name < $1.name }
            return false
            
        }
        
        let max=colorTuples.last?.group
        var i=0
        while i <= max {
            tuplesByGroup[i]=[ColorTuple]()
            i=i+1
        }

        for each in colorTuples {
            tuplesByGroup[each.group]?.append(each)
        }
        
        let x=1
    

        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        let keys=tuplesByGroup.keys
        let x=keys.count
        return x
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let all=tuplesByGroup[section]
        if all == nil {
            return 0
        } else {
            let x = all?.count
            return x!
        }
        
    }
    
    // The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:

   func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
        let cell=collectionView.dequeueReusableCell(withReuseIdentifier: "ColorCell", for: indexPath) as! ColorTupleCollectionViewCell
        let tuple=tuplesByGroup[(indexPath as NSIndexPath).section]![(indexPath as NSIndexPath).row]

        cell.bgColor=tuple.color
        cell.label.text=tuple.name
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
