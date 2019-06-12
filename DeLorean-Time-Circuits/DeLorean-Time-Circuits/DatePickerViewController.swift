//
//  DatePickerViewController.swift
//  DeLorean-Time-Circuits
//
//  Created by Kat Milton on 6/12/19.
//  Copyright © 2019 Kat Milton. All rights reserved.
//

import UIKit

protocol DatePickerDelegate {
    func dateDidSelect(duration: TimeInterval)
}

class DatePickerViewController: UIDatePicker {

//    var duration: TimeInterval {
//        let monthString = selectedRow(inComponent: 0)
//        let dateString = selectedRow(inComponent: 1)
//        let yearString = selectedRow(inComponent: 2)
//        let month = Int(minuteString)
//        let date = Int(dateString)
//        let year = Int(yearString)
////        let timeUntilArrival = TimeInterval(minutes * 60 + seconds)
//        return totalSeconds
//    }
//    
//    lazy var datePickerData: [[String]] = {
//        let month: [String] = Array("January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December").map { String($0) }
//        let date: [String]
//       
//        
//        if month == ["February"] {
//            date = Array(1...28).map { String($0) }
//        } else if month == ["April"] || ["June"] || ["September"] || ["November"] {
//            date = Array(1...30).map { String($0) }
//        } else {
//            date = Array(1...31).map { String($0) }
//        }
//        
//        let year = Array(0...4000).map { String($0) }
//        
//        let data: [[String]] = [month, date, year]
//        return data
//        
//    }()
//    
//    
////    weak var delegate: DatePickerDelegate?
//    

}
