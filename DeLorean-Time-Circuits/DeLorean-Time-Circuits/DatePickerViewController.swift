//
//  DatePickerViewController.swift
//  DeLorean-Time-Circuits
//
//  Created by Kat Milton on 6/12/19.
//  Copyright © 2019 Kat Milton. All rights reserved.
//

import UIKit

protocol DatePickerDelegate: AnyObject {
    func dateDidSelect(from date1: Date, to date2: Date) -> Date
    func destinationDateWasChosen(date: Date)
}


class DatePickerViewController: UIViewController {
    
    @IBOutlet var datePicker: UIDatePicker!
    
    

    var duration: TimeInterval {
        
        let monthString = datePicker.datePickerMode.rawValue
        print(monthString)
        return Double(monthString)
//        let dateString = selectedRow(inComponent: 1)
//        let yearString = selectedRow(inComponent: 2)
//        let month = Int(monthString[index] + 1)
//        let date = Int(dateString)
//        let year = Int(yearString)
//        let timeToAccelerate = TimeInterval((date * 12) + (year * 365) )
////        let timeUntilArrival = TimeInterval(minutes * 60 + seconds)
//        return timeToAccelerate
        
    }
    
   
//
//    lazy var datePickerData: [[String]] = {
//        let month: [String] =
//        let month: [String] = Array(arrayLiteral: "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December").map { String($0) }
//        let date: [String]
//
//
//        if month == ["February"] {
//            date = Array(1...28).map { String($0) }
//        } else if month == ["April" || "June" || "September" || "November"] {
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    weak var datePickerDelegate: DatePickerDelegate?
    
 

    
    @IBAction func cancelButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func doneButtonPressed(_ sender: UIButton) {
        datePickerDelegate?.destinationDateWasChosen(date: datePicker.date)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func gatherTime(sender: UIDatePicker) {
        
        
    }
    
    
}

extension DatePickerViewController: DatePickerDelegate {
    func dateDidSelect(from date1: Date, to date2: Date) -> Date {
        let amountOfTimeToTraverse = date2.timeIntervalSince(date1)
        let today = Date()
        if amountOfTimeToTraverse < 0 {
            return today
        } else {
            return today.addingTimeInterval(amountOfTimeToTraverse)
        }
        
    }
    
    func destinationDateWasChosen(date: Date) {
        
    }
    
    
    
    
}

extension DatePickerViewController: TimeCircuitsDelegate {
    func dateDidUpdate(timeRemaining: TimeInterval) {
        
    }
    
    func timeCircuitComplete() {
        
    }
    
    
    
    
}
//extension UIDatePicker: UIPickerViewDelegate {
//
//    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//
//    }
//}

