//
//  DatePickerViewController.swift
//  OutaTime
//
//  Created by Elizabeth Thomas on 2/17/20.
//  Copyright © 2020 Libby Thomas. All rights reserved.
//

import UIKit

class DatePickerViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var datePicker: UIDatePicker!
    
    // MARK: - Properties
    var delegate: DatePickerDelegate?
    
    // MARK: - IBActions
    @IBAction func cancelButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func doneButtonTapped(_ sender: Any) {
        delegate?.destinationWasChosen(date: datePicker.date)
        dismiss(animated: true)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePicker.datePickerMode = .date

    }
}

protocol DatePickerDelegate: AnyObject {
    func destinationWasChosen(date: Date)
}
