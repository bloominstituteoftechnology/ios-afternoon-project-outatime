//
//  DatePickerViewController.swift
//  OutaTime
//
//  Created by Chad Parker on 2/18/20.
//  Copyright © 2020 Chad Parker. All rights reserved.
//

import UIKit

protocol DatePickerDelegate {
    func destinationDateWasChosen(_ date: Date)
}

class DatePickerViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!

    var delegate: DatePickerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func cancelButtonTapped(_ sender: UIButton) {
        dismiss(animated: true)
    }

    @IBAction func doneButtonTapped(_ sender: UIButton) {
        delegate?.destinationDateWasChosen(datePicker.date)
        dismiss(animated: true)
    }
}
