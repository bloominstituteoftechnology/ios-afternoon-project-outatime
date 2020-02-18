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
    @IBAction func cancelButtonTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func doneButtonTapped(_ sender: UIBarButtonItem) {
        let date = datePicker.date
        delegate?.destinationWasChosen(date)
        dismiss(animated: true)
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePicker.datePickerMode = .date

    }
}

protocol DatePickerDelegate {
    func destinationWasChosen(_: Date)
}
