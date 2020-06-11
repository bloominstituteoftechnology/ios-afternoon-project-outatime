//
//  DatePickerViewController.swift
//  OutaTime
//
//  Created by Norlan Tibanear on 6/9/20.
//  Copyright © 2020 Norlan Tibanear. All rights reserved.
//

import UIKit

protocol DatePickerDelegate {
    func destinationDateWasChosen(date: Date)
}


class DatePickerViewController: UIViewController {
    
    
    // Outlets
    @IBOutlet var pickerView: UIDatePicker!
    
    var delegate: DatePickerDelegate?
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

    
    
    @IBAction func cancelBtn(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func doneBtn(_ sender: UIButton) {
        delegate?.destinationDateWasChosen(date: pickerView.date)
        dismiss(animated: true, completion: nil)
    }
    
    
    
} // END
