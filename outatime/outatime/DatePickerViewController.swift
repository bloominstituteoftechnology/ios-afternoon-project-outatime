//
//  DatePickerViewController.swift
//  outatime
//
//  Created by LaFleur on 12/12/19.
//  Copyright © 2019 David Schwinne. All rights reserved.
//

import UIKit

protocol DatePickerDelegate {
    
    func destinationDateWasChosen(date: Date)
}

class DatePickerViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    
    var delegate: DatePickerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func doneButtonTapped(_ sender: Any) {
        delegate?.destinationDateWasChosen(date: datePicker.date)
        dismiss(animated: true, completion: nil)
    }
}
