//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by Taylor Lyles on 7/24/19.
//  Copyright © 2019 Taylor Lyles. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {
	
	@IBOutlet weak var destinationTime: UILabel!
	@IBOutlet weak var presentTime: UILabel!
	@IBOutlet weak var lastTimeDeparted: UILabel!
	@IBOutlet weak var speed: UILabel!
	
	var dateFormatter: DateFormatter {
		let formatter = DateFormatter()
		formatter.dateFormat = "MMM d, yy"
		formatter.timeZone = TimeZone(secondsFromGMT: 0)
		return formatter
	}

	var currentSpeed: Int = 0
	
	
	override func viewDidLoad() {
        super.viewDidLoad()
		presentTime.text = dateFormatter.string(from: Date(timeIntervalSinceNow: 0))
		speed.text = "\(currentSpeed) MPH"
		destinationTime.text = "--- -- ----"
    }
    
//	@IBAction func setDestinationTime(_ sender: UIButton) {
//	}
	
	//MARK: - Methods
	
//	private func updateSpeed() {
//		switch speed {
//		case currentSpeed != 88 :
//			<#code#>
//		default:
//			<#code#>
//		}
//	}
	
	@IBAction func travelBack(_ sender: UIButton) {
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "ModalDestinationDatePickerSegue" {
			guard let datePicker = segue.destination as?
				DatePickerViewController else { return }
			datePicker.delegate = self
		}
	}
	
}

extension TimeCircuitsViewController: DatePickerDelegate {
	func destinationDateWasChosen(date: Date) {
		
	}
}
