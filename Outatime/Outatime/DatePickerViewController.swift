//
//  DatePickerViewController.swift
//  Outatime
//
//  Created by Juan M Mariscal on 2/17/20.
//  Copyright © 2020 Juan M Mariscal. All rights reserved.
//

import UIKit

protocol DatePickerDelegate: AnyObject {
    func destinationWasChosen(date: Date)
}

class DatePickerViewController: UIViewController {

    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    weak var delegate: DatePickerDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func cancelBtnTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func doneBtnTapped(_ sender: Any) {
        delegate?.destinationWasChosen(date: datePicker.date)
        
        dismiss(animated: true, completion: nil)
    }
    
}

