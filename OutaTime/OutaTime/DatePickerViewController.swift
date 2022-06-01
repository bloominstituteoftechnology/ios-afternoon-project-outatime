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
    @IBAction func cancelButtonTapped(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func doneButtonTapped(_ sender: UIBarButtonItem) {
        
    }
    
}

