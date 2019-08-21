//
//  DatePickerViewController.swift
//  OutaTime
//
//  Created by Ciara Beitel on 8/21/19.
//  Copyright © 2019 Ciara Beitel. All rights reserved.
//

import UIKit

protocol DatePickerDelegate {
    func destinationDateWasChosen(_: Date)
}

class DatePickerViewController: UIViewController {
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBAction func cancelTapped(_ sender: Any) {
    }
    
    @IBAction func doneTapped(_ sender: Any) {
    }
    
    var delegate: DatePickerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
