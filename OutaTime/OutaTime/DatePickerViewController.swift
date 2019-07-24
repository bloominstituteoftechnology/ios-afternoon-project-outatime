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

	@IBOutlet weak var datePicker: UIDatePicker!
	
	override func viewDidLoad() {
        super.viewDidLoad()

    }
	
	
	@IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
	}
	@IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
	}
	

}
