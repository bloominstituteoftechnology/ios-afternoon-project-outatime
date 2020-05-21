//
//  DatePickerViewController.swift
//  OutaTime
//
//  Created by Mike Nichols on 5/20/20.
//  Copyright © 2020 Mike Nichols. All rights reserved.
//

import UIKit

protocol DatePickerDelegate {
    func destinationDateWasChosen(_ date: Date)
}

class DatePickerViewController: UIViewController {
    
    var delegate: DatePickerDelegate?
    
    @IBOutlet weak var datePicker: destinationDatePickerView!

    @IBAction func cancel() {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func done() {
        let destinationDate = datePicker.date
        delegate?.destinationDateWasChosen(destinationDate)
        dismiss(animated: true, completion: nil)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

    
    }
    

}
