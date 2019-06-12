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
    func destinationDateWasChosen(date: Date)
}


class DatePickerViewController: UIViewController {
    
    @IBOutlet var datePicker: UIDatePicker!
    

//    var duration: TimeInterval {
//        let monthString = selectedRow(inComponent: 0)
//        let dateString = selectedRow(inComponent: 1)
//        let yearString = selectedRow(inComponent: 2)
//        let month = Int(monthString[index] + 1)
//        let date = Int(dateString)
//        let year = Int(yearString)
//        let timeToAccelerate = TimeInterval((date * 12) + (year * 365) )
////        let timeUntilArrival = TimeInterval(minutes * 60 + seconds)
//        return timeToAccelerate
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
    var delegate: DatePickerDelegate?

    
    @IBAction func cancelButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func doneButtonPressed(_ sender: UIButton) {
        
    }
}


