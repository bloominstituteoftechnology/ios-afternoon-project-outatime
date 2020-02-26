//
//  DatePickerViewController.swift
//  Outatime
//
//  Created by Lambda_School_Loaner_259 on 2/26/20.
//  Copyright © 2020 DeVitoC. All rights reserved.
//

import UIKit

protocol DatePickerDelegate {
    func destinationDateWasChosen(date: Date)
}

class DatePickerViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet var setDatePicker: UIDatePicker!
    
    
    // MARK: - Properties
    var delegate: DatePickerDelegate?
    
    // MARK: - IBActions
    @IBAction func cancelButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func doneButton(_ sender: Any) {
        delegate?.destinationDateWasChosen(date: setDatePicker.date)
        dismiss(animated: true, completion: nil)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setDatePicker.datePickerMode = .date

        // Do any additional setup after loading the view.
    }
}
