//
//  DatePickerViewController.swift
//  OutaTime
//
//  Created by Alex Rhodes on 8/19/19.
//  Copyright © 2019 Alex Rhodes. All rights reserved.
//

import UIKit

protocol DatePickerDelegate {
    
    func destinationDateWasChosed(date: Date)
}

class DatePickerViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    
    var delegate: DatePickerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        datePicker.setValue(UIColor.white, forKey: "textColor")
    }
    @IBAction func cancelButtonTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveButtonTapped(_ sender: UIBarButtonItem) {
        let date = datePicker.date
        delegate?.destinationDateWasChosed(date: date)
        dismiss(animated: true, completion: nil)
    }
}
