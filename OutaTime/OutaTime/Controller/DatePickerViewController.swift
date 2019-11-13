//
//  DatePickerViewController.swift
//  OutaTime
//
//  Created by Chad Rutherford on 11/13/19.
//  Copyright © 2019 Chad Rutherford. All rights reserved.
//

import UIKit

class DatePickerViewController: UIViewController {
    
    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
    // MARK: - Outlets
    @IBOutlet weak var datePicker: UIDatePicker!
    
    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
    // MARK: - Properties
    weak var delegate: DatePickerDelegate?
    
    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
    // MARK: - View Controller Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
    // MARK: - Actions
    @IBAction func cancelTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    @IBAction func doneTapped(_ sender: UIBarButtonItem) {
        delegate?.destinationDateWasChosen(datePicker.date)
        dismiss(animated: true)
    }
}
