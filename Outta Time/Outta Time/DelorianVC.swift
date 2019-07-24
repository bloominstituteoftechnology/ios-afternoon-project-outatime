//
//  DelorianVC.swift
//  Outta Time
//
//  Created by Jeffrey Santana on 7/24/19.
//  Copyright © 2019 Jefffrey Santana. All rights reserved.
//

import UIKit

class DelorianVC: UIViewController {

	@IBOutlet weak var destinationLbl: UILabel!
	@IBOutlet weak var presentLbl: UILabel!
	@IBOutlet weak var previousLbl: UILabel!
	@IBOutlet weak var speedLbl: UILabel!
	
	private var dateFormatter: DateFormatter {
		let formatter = DateFormatter()
		formatter.dateStyle = .medium
		return formatter
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		startDelorian()
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if let datePickerVC = segue.destination as? DatePickerVC {
			datePickerVC.delegate = self
		}
	}
	
	@IBAction func travelBtnAction(_ sender: Any) {
		shiftDates()
	}
	
	private func startDelorian() {
		presentLbl.text = dateFormatter.string(from: Date())
	}
	
	private func shiftDates() {
		previousLbl.text = presentLbl.text
		presentLbl.text = destinationLbl.text
		destinationLbl.text = "--- -- ----"
	}
}

extension DelorianVC: DatePickerVCDelegate {
	func set(time: Date) {
		destinationLbl.text = dateFormatter.string(from: time)
	}
}
