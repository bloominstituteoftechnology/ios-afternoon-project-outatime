//
//  DatePickerViewController.swift
//  Outa Time
//
//  Created by Dillon P on 8/13/19.
//  Copyright © 2019 Dillon P. All rights reserved.
//

import UIKit

protocol DatePickerDelegate {
    func destinationWasChosen(date: Date)
}

class DatePickerViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    
    var delegate: DatePickerDelegate?
    
    var destination: Date {
        return datePicker.date
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func cancelTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func doneTapped(_ sender: Any) {
        delegate?.destinationWasChosen(date: destination)
        dismiss(animated: true, completion: nil)
    }
    
    
}

extension DatePickerViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        delegate?.destinationWasChosen(date: destination)
    }
}
