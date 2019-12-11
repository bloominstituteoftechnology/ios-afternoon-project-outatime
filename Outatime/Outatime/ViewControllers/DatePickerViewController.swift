//
//  DatePickerViewController.swift
//  Outatime
//
//  Created by Chris Price on 12/10/19.
//  Copyright © 2019 Chris Price. All rights reserved.
//

import UIKit

class DatePickerViewController: UIViewController {

    @IBOutlet weak var datePicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func cancelTapped(_ sender: Any) {
    }
    
    @IBOutlet weak var doneTapped: NSLayoutConstraint!
    
}
