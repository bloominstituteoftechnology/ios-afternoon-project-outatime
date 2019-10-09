//
//  DatePickerViewController.swift
//  Outa time
//
//  Created by Nicolas Rios on 8/25/19.
//  Copyright © 2019 Nicolas Rios. All rights reserved.
//

import UIKit

protocol DatePickerDelegate {
    func destinationDate(date: Date)
}

class DatePickerViewController: UIViewController {


    @IBOutlet weak var datePicker: UIDatePicker!


    
    var delegate: DatePickerDelegate?


    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }

    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        
        delegate?.destinationDate(date: datePicker.date)
        dismiss(animated: true, completion: nil)
    }
}
