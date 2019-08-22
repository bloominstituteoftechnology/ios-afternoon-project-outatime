//
//  DatePickerViewController.swift
//  OutaTimeB
//
//  Created by Percy Ngan on 8/21/19.
//  Copyright © 2019 Lamdba School. All rights reserved.
//

import UIKit

protocol DatePickerDelegate {
	func destinationDateWasChosen(date: Date)
	}


class DatePickerViewController: UIViewController {


	@IBOutlet weak var datePicker: UIDatePicker!


	var delegate: DatePickerDelegate?


	override func viewDidLoad() {
        super.viewDidLoad()

		datePicker.setValue(UIColor.white, forKey: "textColor")

    }


	@IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
		dismiss(animated: true, completion: nil)
	}
	

	@IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
		let date = datePicker.date
		delegate?.destinationDateWasChosen(date: date)
		dismiss(animated: true, completion: nil)
	}
	



}
