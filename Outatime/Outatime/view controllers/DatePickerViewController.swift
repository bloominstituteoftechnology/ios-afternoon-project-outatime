//
//  DatePickerViewController.swift
//  Outatime
//
//  Created by Bryan Cress on 5/20/20.
//  Copyright © 2020 Bryan Cress. All rights reserved.
//

import UIKit

protocol DatePickerDelegate {
    
    func destinationDateWasChosen(date: Date)
    
  }

class DatePickerViewController: UIViewController {
    
    var delegate: DatePickerDelegate?
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBAction func cancelButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func donebutton(_ sender: UIBarButtonItem) {
        delegate?.destinationDateWasChosen(date: datePicker.date)
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
