//
//  DatePickerViewController.swift
//  OutaTime
//
//  Created by Osha Washington on 12/10/19.
//  Copyright © 2019 Osha Washington. All rights reserved.
//

import UIKit

protocol DatePickerDelegate {
    func destinationDateWasChosen(_ date: Date)
}

class DatePickerViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    
    var delegate: DatePickerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
    dismiss(animated: true, completion: nil)
    }
    
    @IBAction func doneButtonTapped(_ sender: Any) {
        delegate?.destinationDateWasChosen(datePicker.date)
        dismiss(animated: true, completion: nil)
    }
        

}
