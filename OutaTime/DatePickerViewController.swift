//
//  DatePickerViewController.swift
//  OutaTime
//
//  Created by Dawn Jones on 4/28/20.
//  Copyright © 2020 Dawn Jones. All rights reserved.
//

import UIKit

protocol DatePickerDelegate {
    func destinationDateWasChosen(date: Date)
}

class DatePickerViewController: UIViewController {
    
    @IBOutlet weak var timeTravelPicker: UIDatePicker!
    
    var delegate: DatePickerDelegate?
    
    @IBAction func cancelTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func doneTapped(_ sender: Any) {
        delegate?.destinationDateWasChosen(date: timeTravelPicker.date)
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
