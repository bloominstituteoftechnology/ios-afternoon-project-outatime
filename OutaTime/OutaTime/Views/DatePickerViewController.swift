//
//  DatePickerViewController.swift
//  OutaTime
//
//  Created by Joel Groomer on 8/13/19.
//  Copyright © 2019 Julltron. All rights reserved.
//

import UIKit

protocol DatePickerDelegate {
    func destinationDateWasChosen(_: Date)
}

class DatePickerViewController: UIViewController {

    @IBOutlet weak var pkrDate: UIDatePicker!
    
    var delegate: DatePickerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    @IBAction func cancelTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func doneTapped(_ sender: UIBarButtonItem) {
        delegate?.destinationDateWasChosen(pkrDate.date)
        dismiss(animated: true, completion: nil)
    }
    
}
