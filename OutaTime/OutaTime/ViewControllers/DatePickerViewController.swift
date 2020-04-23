//
//  DatePickerViewController.swift
//  OutaTime
//
//  Created by Marissa Gonzales on 3/25/20.
//  Copyright © 2020 Joe Veverka. All rights reserved.
//

import UIKit

protocol DatePickerDelegate {
    func destinationDateWasChosen(_ destinationDate: Date)
}

class DatePickerViewController: UIViewController {
    
    @IBOutlet weak var datePicker: UIDatePicker!
    var delegate: DatePickerDelegate?
    var destinationDate: Date?
    
    @IBAction func saveDateButton(_ sender: Any) {
        
        delegate?.destinationDateWasChosen(Date())
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelDateButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    func updateViews() {
        
        guard let destinationDate = destinationDate else { return }
        datePicker.setDate(destinationDate, animated: true)
    }
}
