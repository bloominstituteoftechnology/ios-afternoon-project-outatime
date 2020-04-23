//
//  DatePickerViewController.swift
//  OutaTime
//
//  Created by Brian Rouse on 4/22/20.
//  Copyright © 2020 Brian Rouse. All rights reserved.
//

import UIKit



protocol DatePickerDelegate {
    func destinationWasChosen(date: Date)
}

class DatePickerViewController: UIViewController {
    
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var delegate: DatePickerDelegate?
    
    
    
    @IBAction func cancelButtonTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func doneButtonTapped(_ sender: UIButton) {
        delegate?.destinationWasChosen(date: datePicker.date)
        dismiss(animated: true, completion: nil)
    }
    
}
