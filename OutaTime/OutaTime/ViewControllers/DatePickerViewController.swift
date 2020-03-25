//
//  DatePickerViewController.swift
//  OutaTime
//
//  Created by Hunter Oppel on 3/25/20.
//  Copyright © 2020 LambdaSchool. All rights reserved.
//

import UIKit

// MARK: Delegate

protocol DatePickerDelegate {
    func destinationDatewasChosen(date: Date)
}

class DatePickerViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    //MARK: - Properties
    
    var delegate: DatePickerDelegate?
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - Actions
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func done(_ sender: Any) {
        delegate?.destinationDatewasChosen(date: datePicker.date)
        dismiss(animated: true, completion: nil)
    }
}
