//
//  DatePickerViewController.swift
//  Outatime
//
//  Created by Andrew Ruiz on 7/24/19.
//  Copyright © 2019 Andrew Ruiz. All rights reserved.
//

import UIKit

protocol DatePickerDelegate: AnyObject {
    func destinationDateWasChosen(date: Date)
}

class DatePickerViewController: UIViewController {
    
    #warning("How come you don't need to inherit from UIPickerView? Why can you use datePicker in UIViewController?")
    @IBOutlet weak var datePicker: UIDatePicker!
    
    weak var delegate: DatePickerDelegate? //Not sure if it's supposed to be weak or what that does.

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func doneButtonTapped(_ sender: Any) {
        delegate?.destinationDateWasChosen(date: datePicker.date)
        print(datePicker.date) // Just to test
        dismiss(animated: true, completion: nil)
    }
    
}
