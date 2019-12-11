//
//  DatePickerViewController.swift
//  OutaTime
//
//  Created by alfredo on 12/10/19.
//  Copyright © 2019 alfredo. All rights reserved.
//

import UIKit
protocol DatePickerDelegate{
    func destinationDateWasChosen(date: Date)
}
class DatePickerViewController: UIViewController {
    //MARK: - IBOutlets
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var delegate: DatePickerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    //MARK: - IBActions
    //For the cancel IBAction, simply dismiss the view by calling dismiss(animated: true, completion: nil). This will transition the view away and reveal the time circuits view underneath.
    @IBAction func cancelButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    //For the done IBAction, call the delegate method to inform the delegate of the new date chosen by the user. Also call that same dismiss method from above after the delegate method call. This will inform the delegate of the change, and then dismiss the view, revealing the time circuits underneath.
    @IBAction func doneButton(_ sender: Any) {
        delegate?.destinationDateWasChosen(date: datePicker.date)
        dismiss(animated: true, completion: nil)
    }
}
