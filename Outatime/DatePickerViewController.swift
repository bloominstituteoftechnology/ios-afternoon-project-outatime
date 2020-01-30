//
//  DatePickerViewController.swift
//  Outatime
//
//  Created by scott harris on 1/29/20.
//  Copyright © 2020 scott harris. All rights reserved.
//

import UIKit

protocol DatePickerDelegate {
    func destinationDateWasChosen(date: Date)
}

class DatePickerViewController: UIViewController {
    @IBOutlet weak var datePickerView: UIDatePicker!
    
    var delegate: DatePickerDelegate?
    
    
    @IBAction func cancelTapped(_ sender: Any) {
        dismiss(animated: true)
        
    }
    
    
    @IBAction func doneTapped(_ sender: Any) {
        let date = datePickerView.date
        delegate?.destinationDateWasChosen(date: date)
        dismiss(animated: true)
        
    }
}
