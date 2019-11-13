//
//  DatePickerViewController.swift
//  OutaTime
//
//  Created by Donella Barcelo on 11/13/19.
//  Copyright © 2019 Donella Barcelo. All rights reserved.
//

import UIKit

protocol DatePickerDelegate: class {
    func destinationDateWasChosen(date: Date)
}

class DatePickerViewController: UIViewController {
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var destinationDate: Date?
    var delegate: DatePickerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateViews()
    }
    
    func updateViews() {
        guard let destinationDate = destinationDate else { return }
        datePicker.setDate(destinationDate, animated: false)
    }

    @IBAction func cancelButtonTapped(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func doneButtonTapped(_ sender: Any) {
        delegate?.destinationDateWasChosen(date: datePicker.date)
        dismiss(animated: true)
    }
}
