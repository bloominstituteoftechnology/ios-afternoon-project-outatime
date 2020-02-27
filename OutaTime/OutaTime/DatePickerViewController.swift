//
//  DatePickerViewController.swift
//  OutaTime
//
//  Created by Harmony Radley on 2/26/20.
//  Copyright © 2020 Harmony Radley. All rights reserved.
//

import UIKit

protocol DatePickerDelegate {
    func destinationDateWasChosen(date: Date  )
}


class DatePickerViewController: UIViewController {
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBAction func cancelButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func doneButton(_ sender: Any) {
        delegate?.destinationDateWasChosen(date: datePicker.date)
        dismiss(animated: true, completion: nil)
    }
    
    
    var delegate: DatePickerDelegate?
    
}
