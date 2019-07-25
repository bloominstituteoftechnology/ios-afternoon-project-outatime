//
//  DatePickerViewController.swift
//  OutaTime
//
//  Created by Blake Andrew Price on 7/24/19.
//  Copyright © 2019 Blake Andrew Price. All rights reserved.
//

import UIKit

class DatePickerViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    @IBAction func cancelButtonTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func doneButtonTapped(_ sender: UIBarButtonItem) {
        delegate?.destinationDateWasChosen(date: datePicker.date)
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    var delegate: DatePickerDelegate?

}


protocol DatePickerDelegate {
    func destinationDateWasChosen(date: Date)
}
