//
//  DatePickerVC.swift
//  Outta Time
//
//  Created by Jeffrey Santana on 7/24/19.
//  Copyright © 2019 Jefffrey Santana. All rights reserved.
//

import UIKit

protocol DatePickerVCDelegate: AnyObject {
	func set(time: Date)
}

class DatePickerVC: UIViewController {

	@IBOutlet weak var datePickerView: UIView!
	@IBOutlet weak var datePicker: UIDatePicker!
	
	weak var delegate: DatePickerVCDelegate?
	
	override func viewDidLoad() {
        super.viewDidLoad()
		
		updateViews()
		createTapGesture()
    }

	@IBAction func datePickerChanged(_ sender: UIDatePicker) {
		delegate?.set(time: sender.date)
	}
	
	private func updateViews() {
		datePicker.setValue(UIColor.white, forKey: "textColor")
		datePickerView.layer.cornerRadius = 10
		datePickerView.clipsToBounds = true
	}
	
	private func createTapGesture() {
		let tap = UITapGestureRecognizer(target: self, action: #selector(dismissOnTouch(_:)))
		view.addGestureRecognizer(tap)
	}
	
	@objc func dismissOnTouch(_ sender: UITapGestureRecognizer) {
		dismiss(animated: true, completion: nil)
	}
}

