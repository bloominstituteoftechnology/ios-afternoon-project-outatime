//
//  DatePickerViewController.swift
//  OutaTime
//
//  Created by Jonalynn Masters on 9/18/19.
//  Copyright © 2019 Jonalynn Masters. All rights reserved.
//

import UIKit

//MARK: delegate protocol
protocol DatePickerDelegate: AnyObject {
    func destinationDateWasChosen(date: Date)
}

class DatePickerViewController: UIViewController {

    //MARK: Properties
    weak var delegate: DatePickerDelegate?
    
    //MARK: Outlets
    @IBOutlet var datePicker: UIDatePicker!
    
    
    //MARK: View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: IBActions
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func doneButtonTapped(_ sender: Any) {
        print("done")
        delegate?.destinationDateWasChosen(date: datePicker.date)
        dismiss(animated: true, completion: nil)
    }
}
