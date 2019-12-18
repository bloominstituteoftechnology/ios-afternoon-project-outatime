//
//  DatePickerViewController.swift
//  Outatime
//
//  Created by Tobi Kuyoro on 18/12/2019.
//  Copyright © 2019 Tobi Kuyoro. All rights reserved.
//

import UIKit

protocol DatePickerDelegate {
    func destinationDateWasChosen(date: Date)
}

class DatePickerViewController: UIViewController {
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var delegate: DatePickerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func cancelTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func doneTapped(_ sender: Any) {
        delegate?.destinationDateWasChosen(date: datePicker.date)
        dismiss(animated: true, completion: nil)
    }
}
