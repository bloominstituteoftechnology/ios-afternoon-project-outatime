//
//  DatePickerViewController.swift
//  OutaTime
//
//  Created by Shawn James on 2/26/20.
//  Copyright © 2020 Shawn James. All rights reserved.
//

import UIKit

class DatePickerViewController: UIViewController {

    // MARK: - PROPERTIES
    var delegate: DatePickerDelegate?
    
    // MARK: - OUTLETS
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
// MARK: - ACTIONS
    @IBAction func cancelButtonTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func doneButtonTapped(_ sender: UIButton) {
        delegate?.destinationDateWasChosen(date: datePicker.date)
        dismiss(animated: true, completion: nil)
    }
}

protocol DatePickerDelegate {
    func destinationDateWasChosen(date: Date)
}
