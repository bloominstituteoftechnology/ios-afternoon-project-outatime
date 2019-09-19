//
//  DatePickerViewController.swift
//  OutaTime
//
//  Created by Jesse Ruiz on 9/18/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

protocol DatePickerDelegate {
    func destinationDateWasChosen(date: Date)
}

class DatePickerViewController: UIViewController {
    
    var delegate: DatePickerDelegate?

    // MARK: - Outlet
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARL: - Action
    
    @IBAction func cancelButtonTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveButtonTapped(_ sender: UIBarButtonItem) {
        delegate?.destinationDateWasChosen(date: datePicker.date)
//        guard let newDateChosen = delegate?.destinationDateWasChosen(date: datePicker.date) else { return }
//        return newDateChosen
        dismiss(animated: true, completion: nil)
    }
}
