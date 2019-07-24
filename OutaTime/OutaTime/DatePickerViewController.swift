//
//  DatePickerViewController.swift
//  OutaTime
//
//  Created by Bradley Yin on 7/24/19.
//  Copyright © 2019 bradleyyin. All rights reserved.
//

import UIKit

protocol DatePickerDelegate{
    func destinationDateWasChosen(date: Date)
    
}

class DatePickerViewController: UIViewController {
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var delegate : DatePickerDelegate?
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func doneButtonTapped(_ sender: UIBarButtonItem) {
        delegate?.destinationDateWasChosen(date: datePicker.date)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelButtonTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
   

}
