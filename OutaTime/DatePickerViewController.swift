//
//  DatePickerViewController.swift
//  OutaTime
//
//  Created by Nichole Davidson on 1/29/20.
//  Copyright © 2020 Nichole Davidson. All rights reserved.
//

import Foundation
protocol DatePickerDelegate {
    
    func destinationDateWasChosen(_: Date)
}

class DatePickerViewController {
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBAction func cancelTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func doneTapped(_ sender: UIBarButtonItem) {
        
        delegate?.doneTapped(_: DateFormatter)
        dismiss(animated: true, completion: nil)
    }
    
    var delegate = DatePickerDelegate?
    
    
}
