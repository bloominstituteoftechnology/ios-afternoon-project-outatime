//
//  DatePickerViewController.swift
//  
//
//  Created by John McCants on 6/9/20.
//

import UIKit

class DatePickerViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    var delegate : DatePickerDelegate?
    var date : Date?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func datePickerTapped(_ sender: UIDatePicker) {
    }
    @IBAction func cancelTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func doneTapped(_ sender: Any) {
        delegate?.destinationDateWasChosen(date: datePicker.date)
        dismiss(animated: true, completion: nil)
    
    }
    
}
