//
//  DatePickerViewController.swift
//  OutaTime
//
//  Created by Shawn Gee on 2/25/20.
//  Copyright © 2020 Swift Student. All rights reserved.
//

import UIKit

protocol DestinationDatePickerDelegate: AnyObject {
    func destinationWasChosen(_ date: Date)
}

class DatePickerViewController: UIViewController {

    //MARK: - IBOutlets
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    //MARK: - IBActions
    
    
    @IBAction func cancelButtonTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func doneButtonTapped(_ sender: UIBarButtonItem) {
        delegate?.destinationWasChosen(datePicker.date)
        dismiss(animated: true, completion: nil)
    }
    
    //MARK: - Properties
    
    weak var delegate: DestinationDatePickerDelegate?
    var startingDate: Date?
    
    override func viewDidLoad() {
        if let startingDate = startingDate {
            datePicker.setDate(startingDate, animated: false)
        }
    }

}
