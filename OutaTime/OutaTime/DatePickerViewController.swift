//
//  DatePickerViewController.swift
//  OutaTime
//
//  Created by Lambda_School_Loaner_201 on 10/8/19.
//  Copyright © 2019 Christian Lorenzo. All rights reserved.
//

import UIKit


protocol DatePickerDelegate {
    func destinationDateWasChosen(for date: Date)
}




class DatePickerViewController: UITableViewController {
    
    
    var delegate: DatePickerDelegate?
    
//Outlet
    @IBOutlet weak var datePickerOutlet: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
//Buttons
    @IBAction func cancelButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func doneButton(_ sender: UIButton) {
        delegate?.destinationDateWasChosen(for: datePickerOutlet.date)
        dismiss(animated: true, completion: nil)
    }

    
}
