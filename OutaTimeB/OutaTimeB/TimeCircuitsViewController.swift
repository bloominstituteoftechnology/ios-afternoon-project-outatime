//
//  TimeCircuitsViewController.swift
//  OutaTimeB
//
//  Created by Percy Ngan on 8/21/19.
//  Copyright © 2019 Lamdba School. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {



	@IBOutlet weak var destinationLabel: UILabel!
	@IBOutlet weak var destinationTimeLabel: UILabel!
	@IBOutlet weak var presentDate: UILabel!
	@IBOutlet weak var lastTimeDepartedLabel: UILabel!
	@IBOutlet weak var lastTimeLabel: UILabel!
	@IBOutlet weak var presentTimeLabel: UILabel!
	@IBOutlet weak var setDestinationTimeButton: UIButton!
	@IBOutlet weak var currentSpeedLabel: UILabel!
	@IBOutlet weak var speedLabel: UILabel!

	
	var dateFormatter: DateFormatter = {

		let formatter = DateFormatter()
		formatter.dateFormat = "MMM dd yyyy"
		formatter.timeZone = TimeZone(secondsFromGMT: 0)
		return formatter
	}()


	var currentSpeed: Int = 0
	var timer: Timer?

	

	override func viewDidLoad() {
        super.viewDidLoad()

		view.backgroundColor = .black
		destinationLabel.textColor = .white
		destinationTimeLabel.textColor = .orange
		presentTimeLabel.textColor = .white
		presentDate.textColor = .green
		lastTimeDepartedLabel.textColor = .yellow
		lastTimeLabel.textColor = .white
		currentSpeedLabel.textColor = .red
		speedLabel.textColor = .white


		// sets the presentDate to today's date
		let currentDate = Date()
		let date = dateFormatter.string(from: currentDate)

		presentDate.text = date

		speedLabel.text = String("\(currentSpeed) MPH")
		lastTimeDepartedLabel.text = "--- -- ----"


    }


    

	@IBAction func travelBackButton(_ sender: UIButton) {

		startTimer()

	}


	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "ModalDestinationDatePickerSegue" {
			guard let datePickerVC = segue.destination as? DatePickerViewController else { return }
			datePickerVC.delegate = self
	}
}


	func resetTimer() {
		timer?.invalidate()
		timer = nil
	}

	func updateSpeed(timer: Timer) {
		if currentSpeed < 88 {
			currentSpeed += 1
			currentSpeedLabel.text = String(currentSpeed)
		} else {
			resetTimer()
			lastTimeDepartedLabel.text = presentTimeLabel.text
			presentTimeLabel.text = destinationTimeLabel.text
			currentSpeed = 0

			showAlert()
		}
	}

	func showAlert() {
		let alert = UIAlertController(title: "Time Travel Successful", message: "You're new date is \(presentTimeLabel.text ?? "")", preferredStyle: .alert)
		alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
		present(alert, animated: true, completion: nil)
	}

	func startTimer() {
		timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: updateSpeed(timer:))
	}
}

extension TimeCircuitsViewController: DatePickerDelegate {
	func destinationDateWasChosen(date: Date) {

		let date = dateFormatter.string(from: date)
		destinationTimeLabel.text = date
	}
}
