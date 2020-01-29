//
//  DatePickerViewController.swift
//  OutaTime
//
//  Created by Jorge Alvarez on 12/18/19.
//  Copyright © 2019 Jorge Alvarez. All rights reserved.
//

import UIKit

protocol DatePickerDelegate {
    func destinationDateWasChosen(date: Date)
}

class DatePickerViewController: UIViewController {
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var delegate: DatePickerDelegate?
    
    @IBAction func cancelTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil) // dismisses this view controller
    }
    
    @IBAction func doneTapped(_ sender: UIBarButtonItem) {
        delegate?.destinationDateWasChosen(date: datePicker.date)
        dismiss(animated: true, completion: nil)
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        datePicker.datePickerMode = .date // super important
    
    }

}
