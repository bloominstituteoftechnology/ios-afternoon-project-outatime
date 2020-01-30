//
//  DatePickerViewController.swift
//  OutaTime
//
//  Created by Keri Levesque on 1/29/20.
//  Copyright © 2020 Keri Levesque. All rights reserved.
//

import UIKit
// declared protocol
protocol DatePickerDelegate {
    // single function with Date arguement
    func destinationDateWasChosen(date: Date)
}

class DatePickerViewController: UIViewController {

     
    @IBOutlet weak var datePicker: UIDatePicker!
    // optional delegate variable and set type to DatePickerDelegate
    var delegate: DatePickerDelegate?
 
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // dismiss the view by calling dismiss(animated: true, completion: nil)
       @IBAction func cancelButton(_ sender: Any) {
           dismiss(animated: true, completion: nil)
       }
    // call the delegate method to inform the delegate of the new date chosen by the user. Also call that same dismiss method from above after the delegate method call. This will inform the delegate of the change, and then dismiss the view, revealing the time circuits underneath.
       @IBAction func doneButton(_ sender: Any) {
           delegate?.destinationDateWasChosen(date: datePicker.date)
                 dismiss(animated: true, completion: nil)
       }
}
