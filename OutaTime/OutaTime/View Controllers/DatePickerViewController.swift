//
//  DatePickerViewController.swift
//  OutaTime
//
//  Created by Lambda_School_Loaner_204 on 10/16/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

protocol DatePickerDelegate {
    func destinationDateWasChosen(_ destinationDate: Date)
}

class DatePickerViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    
    var datePickerDelegate: DatePickerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func doneTapped(_ sender: UIBarButtonItem) {
        datePickerDelegate?.destinationDateWasChosen(datePicker.date)
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func cancelTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }

}
