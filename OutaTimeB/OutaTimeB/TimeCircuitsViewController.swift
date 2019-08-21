//
//  TimeCircuitsViewController.swift
//  OutaTimeB
//
//  Created by Percy Ngan on 8/21/19.
//  Copyright © 2019 Lamdba School. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {



	@IBOutlet weak var destinationTimeLabel: UILabel!
	@IBOutlet weak var presentDate: UILabel!
	@IBOutlet weak var lastTimeDepartedLabel: UILabel!
	@IBOutlet weak var speedLabel: UILabel!
	@IBOutlet weak var presentTimeLabel: UILabel!

	var dateFormatter: DateFormatter = {
		let formatter = DateFormatter()
		formatter.dateFormat = "MMM dd yyyy"
		return formatter
	}()

	var currentSpeed: Int = 100


	



	override func viewDidLoad() {
        super.viewDidLoad()

		view.backgroundColor = .black
		destinationTimeLabel.textColor = .white
		presentTimeLabel.textColor = .white
		presentDate.textColor = .green
		lastTimeDepartedLabel.textColor = .white
		speedLabel.textColor = .white

		// sets the presentDate to today's date
		let currentDate = Date()
		let date = dateFormatter.string(from: currentDate)

		presentDate.text = date

		speedLabel.text = String("\(currentSpeed) MPH")
		lastTimeDepartedLabel.text = "--- -- ----"

    }
    

	@IBAction func travelBackButton(_ sender: UIButton) {
	}

}
