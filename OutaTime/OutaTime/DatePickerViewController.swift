//
//  DatePickerViewController.swift
//  OutaTime
//
//  Created by John Kouris on 8/11/19.
//  Copyright © 2019 John Kouris. All rights reserved.
//

import UIKit

protocol DatePickerDelegate {
    func destinationDateWasChosen(forDate date: Date)
}

class DatePickerViewController: UIViewController {
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var delegate: DatePickerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        delegate?.destinationDateWasChosen(forDate: datePicker.date)
        dismiss(animated: true, completion: nil)
    }
    

}
