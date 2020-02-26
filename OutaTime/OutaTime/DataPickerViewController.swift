//
//  DatePickerViewController.swift
//  OutaTime
//
//  Created by Samuel Esserman on 2/26/20.
//  Copyright © 2020 Samuel Esserman. All rights reserved.
//

import UIKit

protocol DatePickerDelegate {
    func destinationDateWasChosen(date: Date)
}

class DatePickerViewController: UIViewController {
    @IBOutlet weak var datePickerView: UIDatePicker!
    
    var delegate: DatePickerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

      
    }
    
    @IBAction func cancelTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func doneTapped(_ sender: Any) {
        let date = datePickerView.date
        delegate?.destinationDateWasChosen(date: date)
        dismiss(animated: true, completion: nil)
    }
}
