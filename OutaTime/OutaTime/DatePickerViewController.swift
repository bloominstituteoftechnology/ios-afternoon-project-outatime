//
//  DatePickerViewController.swift
//  OutaTime
//
//  Created by Waseem Idelbi on 5/30/22.
//

import UIKit

class DatePickerViewController: UIViewController {
    
//MARK: - IBOutlets
    @IBOutlet weak var datePicker: UIDatePicker!
    
//MARK: - IBActions
    @IBAction func cancelButtonTapped(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func doneButtonTapped(_ sender: UIBarButtonItem) {
        
    }
    
}

