//
//  DatePickerViewController.swift
//  OutaTime
//
//  Created by Alex Rhodes on 7/24/19.
//  Copyright © 2019 Alex Rhodes. All rights reserved.
//

import UIKit

protocol DatePickerDelegate {
    func destinationDateWasChosen(date: Date)
}

class DatePickerViewController: UIViewController {
    

    @IBOutlet weak var datePicker: UIDatePicker!
    
    var delegate: DatePickerDelegate?
    
    
    @IBAction func cancelButtoonTapped(_ sender: UIBarButtonItem) {
    }
    
    @IBAction func doneButtonTapped(_ sender: UIBarButtonItem) {
    }
}
