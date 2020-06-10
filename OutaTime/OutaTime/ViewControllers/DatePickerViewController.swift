//
//  DatePickerViewController.swift
//  OutaTime
//
//  Created by Cora Jacobson on 6/8/20.
//  Copyright © 2020 Cora Jacobson. All rights reserved.
//

import UIKit

protocol DatePickerDelegate {
    func destinationDateWasChosen(_ date: Date)
}

class DatePickerViewController: UIViewController {

    @IBOutlet weak var destinationDatePicker: UIDatePicker!
    
    var delegate: DatePickerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func cancelButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func doneButton(_ sender: UIBarButtonItem) {
        delegate?.destinationDateWasChosen(destinationDatePicker.date)
        dismiss(animated: true, completion: nil)
    }

}
