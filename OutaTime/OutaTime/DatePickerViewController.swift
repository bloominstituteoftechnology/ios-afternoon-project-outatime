//
//  DatePickerViewController.swift
//  OutaTime
//
//  Created by Nonye on 4/22/20.
//  Copyright © 2020 Nonye Ezekwo. All rights reserved.
//

import UIKit

class DatePickerViewController: UIViewController {
 
    var delegate: DatePickerDelegate?
    
//MARK: OUTLETS
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func cancelButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func doneButton(_ sender: UIButton) {
        delegate?.destinationDateWasChosen(datePicker.date)
        dismiss(animated: true, completion: nil)
    }
    
}
protocol DatePickerDelegate {
    func destinationDateWasChosen(_: Date)
}
