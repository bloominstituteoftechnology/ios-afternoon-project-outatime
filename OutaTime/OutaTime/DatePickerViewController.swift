//
//  DatePickerViewController.swift
//  OutaTime
//
//  Created by Bronson Mullens on 4/28/20.
//  Copyright © 2020 Bronson Mullens. All rights reserved.
//

import UIKit

class DatePickerViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var datePicker: UIDatePicker!
    
    // MARK: - IBActions
    @IBAction func cancelButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func doneButtonTapped(_ sender: Any) {
        delegate?.destinationDateWasChosen(date: datePicker.date)
        dismiss(animated: true, completion: nil)
    }
    
    var delegate: DatePickerDelegate?

}

protocol DatePickerDelegate {
    func destinationDateWasChosen(date: Date)
}
