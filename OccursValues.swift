//
//  OccursValues.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 4/22/16.
//  Copyright © 2016 Coffey. All rights reserved.
//

import Foundation
import CoreData

typealias OccursDataTriple=(Int,Int,Int)

class OccursValues: NSManagedObject {
    
    static var entityName="OccursValues"
    
    class func values(value1:Int, value2:Int, value3:Int, insertIntoContext context:NSManagedObjectContext) -> OccursValues {
        let newOne=NSEntityDescription.insertNewObjectForEntityForName(entityName, inManagedObjectContext: context) as! OccursValues
        newOne.dataValue1=Int32(value1)
        newOne.dataValue2=Int32(value2)
        newOne.dataValue3=Int32(value3)
        return newOne
        
    }
    class func values(value1:Int, value2:Int, value3:Int,insertIntoReoccurrance reoccurs:Reoccurrance) -> OccursValues {
        return self.values(value1, value2: value2, value3:value3, insertIntoContext: reoccurs.managedObjectContext!)
        
    }
    class func values(values:OccursDataTriple, insertIntoReoccurrance reoccurs:Reoccurrance) -> OccursValues {
        return self.values(values.0, value2: values.1, value3:values.2, insertIntoContext: reoccurs.managedObjectContext!)

    }
    
    func dataTriple()->OccursDataTriple {
        return (Int(self.dataValue1),Int(self.dataValue2),Int(self.dataValue3))
    }



}
