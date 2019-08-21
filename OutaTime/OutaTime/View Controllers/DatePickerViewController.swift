//
//  DatePickerViewController.swift
//  OutaTime
//
//  Created by brian vilchez on 8/21/19.
//  Copyright © 2019 brian vilchez. All rights reserved.
//

import UIKit
protocol DatePickerDelegate {
    func destinationWasChosen(date:Date)
}

class DatePickerViewController: UIViewController {
    //MARK: - Properties
    var delegate: DatePickerDelegate?
    @IBOutlet weak var datePicker:UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveButton(_ sender:UIBarButtonItem) {
        delegate?.destinationWasChosen(date: datePicker.date)
    }
    
    @IBAction func cancelButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
}
extension DatePickerViewController {
    func showAlerts() {
    
    }
}
