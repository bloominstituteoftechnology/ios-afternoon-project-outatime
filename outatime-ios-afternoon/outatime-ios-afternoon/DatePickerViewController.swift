//
//  DatePickerViewController.swift
//  outatime-ios-afternoon
//
//  Created by Alex Shillingford on 6/12/19.
//  Copyright © 2019 Alex Shillingford. All rights reserved.
//

import UIKit

protocol DatePickerDelegate {
    func destinationWasChosen(_ destinationDate: Date)
}

class DatePickerViewController: UIViewController {
    
    @IBOutlet weak var datePickerOutlet: UIDatePicker!
    var delegate: DatePickerDelegate?
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func cancelButtonPressed(_ sender: UIButton) {
        
    }
    
    @IBAction func doneButtonPressed(_ sender: UIButton) {
        
    }
    
    
}
