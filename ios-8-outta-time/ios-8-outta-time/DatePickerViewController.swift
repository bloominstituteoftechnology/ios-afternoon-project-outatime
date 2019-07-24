//
//  DatePickerViewController.swift
//  ios-8-outta-time
//
//  Created by Alex Shillingford on 7/24/19.
//  Copyright © 2019 Alex Shillingford. All rights reserved.
//

import UIKit

protocol DatePickerDelegate: AnyObject {
    func destinationDateWasChosen(_ destinationDate: Date)
}

class DatePickerViewController: UIViewController {
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    var delegate: DatePickerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        doneButton.layer.cornerRadius = 1.0
        cancelButton.layer.cornerRadius = 1.0
    }
    

    @IBAction func doneButtonTapped(_ sender: UIButton) {
        delegate?.destinationDateWasChosen(datePicker.date)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelButtonTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }

}
