//
//  DatePickerViewController.swift
//  OutaTime
//
//  Created by Chris Dobek on 3/25/20.
//  Copyright © 2020 Chris Dobek. All rights reserved.
//

import UIKit




class DatePickerViewController: UIViewController {

     var delegate: DatePickerDelegate?
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBAction func cancelButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func doneButton(_ sender: Any) {
        delegate?.destinationDateWasChosen(datePicker.date)
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}


protocol DatePickerDelegate {
    func destinationDateWasChosen(_: Date)
}
