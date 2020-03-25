//
//  DatePickerViewController.swift
//  OutaTime
//
//  Created by Isaac Lyons on 9/18/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

protocol DatePickerDelegate {
    func destinationDateWasChosen(_ date: Date)
}

class DatePickerViewController: UIViewController {
    
    //MARK: Outlets
    @IBOutlet weak var datePicker: UIDatePicker!
    
    //MARK: Properties
    var delegate: DatePickerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //MARK: Actions

    @IBAction func cancelTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func doneTapped(_ sender: UIBarButtonItem) {
        delegate?.destinationDateWasChosen(datePicker.date)
        dismiss(animated: true, completion: nil)
    }
}
