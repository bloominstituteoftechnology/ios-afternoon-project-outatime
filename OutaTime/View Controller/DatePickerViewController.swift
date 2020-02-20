//
//  DatePickerViewController.swift
//  OutaTime
//
//  Created by Rob Vance on 2/17/20.
//  Copyright © 2020 Rob Vance. All rights reserved.
//

import UIKit

protocol DatePickerDelegate {
    func destinationDateWasChosen(date: Date)
}

class DatePickerViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    var delegate: DatePickerDelegate?

    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBAction func doneTapped(_ sender: Any) {
        delegate?.destinationDateWasChosen(date: datePicker.date)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
