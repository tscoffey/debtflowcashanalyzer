//
//  String+Weekday.swift
//  DebtCashFlowAnalyzer
//
//  Created by Tim on 6/12/16.
//  Copyright © 2016 Coffey. All rights reserved.
//

extension String {
    static func nameOfDayOfMonth(index:Int)->String {

        var suffix:String
        if index > 3 && index <= 20 { suffix="th" }
        else {
            var mod10 = index % 10
            switch mod10 {
            case 1: suffix="st"
            case 2: suffix="nd"
            case 3: suffix="rd"
            default: suffix="th"
            }
        }
        return String(index)+suffix

    }

    static func nameOfDayOfWeekIndex(index:Int)->String {
        return (["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"])[index]
    }
    static func nameOfMonthOfYear(index:Int)->String {
        return (["January","February","March","April","May","June","July","August","September","October","November","December"])[index-1]
    }

}
