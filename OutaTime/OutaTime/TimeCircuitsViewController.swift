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
	var timer: Timer?
	var reversing: Bool = false
	
	
	override func viewDidLoad() {
        super.viewDidLoad()
		presentTime.text = dateFormatter.string(from: Date(timeIntervalSinceNow: 0))
		speed.text = "\(currentSpeed) MPH"
		destinationTime.text = "--- -- ----"
    }
    
//	@IBAction func setDestinationTime(_ sender: UIButton) {
//	}
	
	//MARK: - Methods
	
	
	func startTimer() {
		timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { (timer) in
			self.updateSpeed()
		}
	}
	
	func resetTimer() {
		timer?.invalidate()
		timer = nil
	}
	
	@IBAction func travelBack(_ sender: UIButton) {
		startTimer()
	}
	
	func updateSpeed() {
		if currentSpeed != 88 && !reversing {
			currentSpeed += 1
			speed.text = "\(currentSpeed) MPH"
		} else if currentSpeed != 0 && reversing {
			currentSpeed -= 1
			speed.text = "\(currentSpeed) MPH"
		} else if currentSpeed == 0 && reversing {
			self.resetTimer()
			presentTime.text = lastTimeDeparted.text
			lastTimeDeparted.text = "--- -- ----"
			
			showAlert(newDate: presentTime.text ?? "")
		} else {
			self.resetTimer()
			lastTimeDeparted.text = presentTime.text
			presentTime.text = destinationTime.text
		}
	}
	
	func showAlert(newDate: String) {
		
		let alertController = UIAlertController(title: "Time travel was sucessful! :-)", message: "The date is now \(newDate)", preferredStyle: .alert)
		let okAction = UIAlertAction(title: "Stay", style: .default) {(action) in
			self.destinationTime.text = "--- -- ----"
			self.reversing = false
			self.currentSpeed = 0
		}
		
		let reverseAction = UIAlertAction(title: "Reverse Time", style: .default) { (action) in
			self.reversing = true
			self.startTimer()
		}
		
		alertController.addAction(okAction)
		if !reversing{
			alertController.addAction(reverseAction)
		}
		
		present(alertController, animated:  true)
	
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
		destinationTime.text = dateFormatter.string(from: date)
	}
}
