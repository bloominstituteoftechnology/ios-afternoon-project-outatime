//
//  DatePickerViewController.swift
//  OutaTime
//
//  Created by Ry Bautista on 7/24/19.
//  Copyright © 2019 Ry Bautista All rights reserved.
//

import UIKit

class DatePickerViewController: UIViewController {
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var delegate: DatePickerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func cancelButtonTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func doneButtonPressed(_ sender: UIButton) {
        let date = datePicker.date
        delegate?.destinationDateWasChosen(date: date)
        dismiss(animated: true, completion: nil)
    }
    
}

protocol DatePickerDelegate {
    func destinationDateWasChosen(date: Date)
}
