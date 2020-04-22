//
//  DatePickerViewController.swift
//  OutaTime
//
//  Created by Vincent Hoang on 4/22/20.
//  Copyright © 2020 Vincent Hoang. All rights reserved.
//

import UIKit

protocol DatePickerViewDelegate {
    func setDestinationDate(_ date: Date)
}

class DatePickerViewController: UIViewController {
    @IBOutlet var datePicker: UIDatePicker!
    
    var delegate: DatePickerViewDelegate?
    
    @IBAction func cancelButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func doneButtonPressed(_ sender: UIButton) {
        delegate?.setDestinationDate(datePicker.date)
        dismiss(animated: true, completion: nil)
    }
}
