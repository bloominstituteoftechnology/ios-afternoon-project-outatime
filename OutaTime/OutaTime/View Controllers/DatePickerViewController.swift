//
//  DatePickerViewController.swift
//  OutaTime
//
//  Created by Jarren Campos on 2/17/20.
//  Copyright © 2020 Jarren Campos. All rights reserved.
//

import UIKit

protocol DatePickerDelegate {
    func destinationDateWasChosen(_ date: Date)
}


class DatePickerViewController: UIViewController {
    
    //MARK: -IBOutlets
    @IBOutlet var datePicker: UIDatePicker!
    
    var delegate: DatePickerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        datePicker.datePickerMode = .dateAndTime
    }
    
    
    //MARK: - IBActions
    @IBAction func cancelButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func doneButton(_ sender: UIButton) {
        delegate?.destinationDateWasChosen(datePicker.date)
        dismiss(animated: true, completion: nil)
    }
}

