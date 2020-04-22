//
//  DatePickerViewController.swift
//  Outatime
//
//  Created by Kelson Hartle on 4/22/20.
//  Copyright © 2020 Kelson Hartle. All rights reserved.
//

import UIKit

protocol DatePickerDelegate {
    func destinationDateWasChosen(date: Date)
    
    
}

class DatePickerViewController: UIViewController {
    
    
    // MARK: - Outlets
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    
    // MARK: - Actions
    
    @IBAction func cancelButtonTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func doneButtonTapped(_ sender: UIBarButtonItem) {
        
        delegate?.destinationDateWasChosen(date: datePicker.date)
        
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Propetries
    
    var delegate: DatePickerDelegate?
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
}
