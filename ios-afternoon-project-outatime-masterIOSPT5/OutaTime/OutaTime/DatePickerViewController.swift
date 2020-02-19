//
//  DatePickerViewController.swift
//  OutaTime
//
//  Created by David Williams on 2/18/20.
//  Copyright © 2020 david williams. All rights reserved.
//

import UIKit

protocol DatePickerDelegate {
    func destinationDateWasChosen(date: Date)
}

class DatePickerViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
    }
    
    var delegate: DatePickerDelegate?
  
    
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func doneButtonTapped(_ sender: Any) {
        if let date = datePicker?.date {
            self.delegate?.destinationDateWasChosen(date: date)
        }
        dismiss(animated: true)
    }
}
