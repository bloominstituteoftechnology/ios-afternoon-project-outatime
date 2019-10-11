//
//  DatePickerViewController.swift
//  Out of time
//
//  Created by Alex Thompson on 10/8/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

protocol DatePickerDelegate {
    func destinationDateWasChosen(date: Date)
}

class DatePickerViewController: UIViewController {
    
    var delegate: DatePickerDelegate?

    @IBOutlet weak var datePickerItem: UIDatePicker!
    
    
    override func viewDidLoad() {
           super.viewDidLoad()

           // Do any additional setup after loading the view.
    }
       
    @IBAction func doneButtonTapped(_ sender: UIBarButtonItem) {
        delegate?.destinationDateWasChosen(date: datePickerItem.date)
        dismiss(animated: true, completion: nil)
        
    }
    
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        print("here")
        dismiss(animated: true, completion: nil)
        
    }
    


}
