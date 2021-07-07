//
//  DatePickerViewController.swift
//  OutaTime
//
//  Created by Taylor Lyles on 7/24/19.
//  Copyright © 2019 Taylor Lyles. All rights reserved.
//

import UIKit

protocol DatePickerDelegate {
	func destinationDateWasChosen(date: Date)
}

class DatePickerViewController: UIViewController {
	
	var delegate: DatePickerDelegate?

	@IBOutlet weak var datePicker: UIDatePicker!
	
	override func viewDidLoad() {
        super.viewDidLoad()

    }
	
	
	@IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
		dismiss(animated: true, completion: nil)
	}
	@IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
		delegate?.destinationDateWasChosen(date: datePicker.date)
		dismiss(animated: true, completion: nil)
	}
	

}
