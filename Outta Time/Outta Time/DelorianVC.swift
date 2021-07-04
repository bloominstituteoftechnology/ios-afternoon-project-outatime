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
	
	private var timer: Timer?
	private var speedIndex = 0
	private let speedRange = Array(0...88).map{String($0)}
	private var maxSpeed: String {
		guard let last = speedRange.last else { return "0"}
		return last
	}
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
	
	@IBAction func setDestinationBtnAction(_ sender: Any) {
		resetDelorian()
	}
	
	@IBAction func travelBtnAction(_ sender: Any) {
		guard let _ = dateFormatter.date(from: destinationLbl.text ?? ""), speedIndex == 0 else { return }
		timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(accelerate), userInfo: nil, repeats: true)
	}
	
	private func startDelorian() {
		presentLbl.text = dateFormatter.string(from: Date())
	}
	
	private func resetDelorian() {
		destinationLbl.text = "--- -- ----"
		speedLbl.text = "0 MPH"
		speedIndex = 0
	}
	
	private func shiftDates() {
		previousLbl.text = presentLbl.text
		presentLbl.text = destinationLbl.text
		destinationLbl.text = "--- -- ----"
	}
	
	@objc private func accelerate() {
		let speed = speedRange[speedIndex]
		
		self.speedLbl.text = "\(speed) MPH"
		if speed == maxSpeed {
			timer?.invalidate()
			shiftDates()
		} else {
			speedIndex += 1
		}
	}
}

extension DelorianVC: DatePickerVCDelegate {
	func set(time: Date) {
		destinationLbl.text = dateFormatter.string(from: time)
	}
}
