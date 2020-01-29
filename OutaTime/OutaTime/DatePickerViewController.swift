//
//  DatePickerViewController.swift
//  OutaTime
//
//  Created by Chris Gonzales on 1/29/20.
//  Copyright © 2020 Chris Gonzales. All rights reserved.
//

import UIKit

protocol DatePickerDelegate{
    func destinationDateWasChosen(date: Date)
}

class DatePickerViewController: UIViewController {

    var delegate: DatePickerDelegate?
       
    
    @IBOutlet weak var datePicker: UIDatePicker!
    

    @IBAction func cancelTapped(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func doneTapped(_ sender: UIButton) {
       
        delegate?.destinationDateWasChosen(date: datePicker.date)
        dismiss(animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    
    
    

}
