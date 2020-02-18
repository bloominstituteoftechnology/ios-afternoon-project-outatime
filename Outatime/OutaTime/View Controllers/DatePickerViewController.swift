//
//  DatePickerViewController.swift
//  OutaTime
//
//  Created by Elizabeth Thomas on 2/17/20.
//  Copyright © 2020 Libby Thomas. All rights reserved.
//

import UIKit

class DatePickerViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var datePicker: UIDatePicker!
    
    // MARK: - Properties

    
    // MARK: - IBActions
    @IBAction func cancelButtonTapped(_ sender: UIBarButtonItem) {
        
    }
    
    @IBAction func doneButtonTapped(_ sender: UIBarButtonItem) {
        
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePicker.datePickerMode = .date

    }
}
