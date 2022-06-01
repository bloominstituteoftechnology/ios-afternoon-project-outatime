//
//  DatePickerViewController.swift
//  OutaTime
//
//  Created by Waseem Idelbi on 5/30/22.
//

import UIKit

protocol DatePickerDelegate {
    func destinationDateWasChosen(date: Date)
}

class DatePickerViewController: UIViewController {
    
//MARK: - Properties
    var delegate: DatePickerDelegate?
    
//MARK: - IBOutlets
    @IBOutlet weak var datePicker: UIDatePicker!
    
//MARK: - IBActions
    // Cancel Button
    @IBAction func cancelButtonTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    //Done Button
    @IBAction func doneButtonTapped(_ sender: UIBarButtonItem) {
        delegate?.destinationDateWasChosen(date: datePicker.date)
        dismiss(animated: true)
    }
    
}

