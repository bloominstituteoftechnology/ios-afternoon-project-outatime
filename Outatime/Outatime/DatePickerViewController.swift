//
//  DatePickerViewController.swift
//  Outatime
//
//  Created by ronald huston jr on 4/22/20.
//  Copyright © 2020 HenryQuante. All rights reserved.
//

import UIKit

protocol DatePickerDelegate {
    func destinationDateSelected(date: Date)
}

class DatePickerViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    
    var delegate: DatePickerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func done(_ sender: Any) {
        
        let backToDate = datePicker.date
        
        delegate?.destinationDateSelected(date: backToDate)
        
        dismiss(animated: true, completion: nil)
    }

}
