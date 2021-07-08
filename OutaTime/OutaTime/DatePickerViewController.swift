//
//  DatePickerViewController.swift
//  OutaTime
//
//  Created by Gi Pyo Kim on 9/18/19.
//  Copyright © 2019 GIPGIP Studio. All rights reserved.
//

import UIKit

protocol DatePickerDelegate {
    func destinationDateWasChosen (date: Date)
}

class DatePickerViewController: UIViewController {
    
    // MARK: - Properties
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var delegate: DatePickerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePicker.setValue(UIColor.white, forKey: "textColor")

    }
    
    @IBAction func cancelButtonTabbed(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func doneButtonTabbed(_ sender: UIBarButtonItem) {
        delegate?.destinationDateWasChosen(date: datePicker.date)
        dismiss(animated: true, completion: nil)
    }
    
}
