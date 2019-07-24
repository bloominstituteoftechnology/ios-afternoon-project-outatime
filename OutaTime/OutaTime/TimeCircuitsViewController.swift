//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by Taylor Lyles on 7/24/19.
//  Copyright © 2019 Taylor Lyles. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {
	
	var dateFormatter: DateFormatter {
		let formatter = DateFormatter()
		formatter.dateFormat = "MMM d, yy"
		formatter.timeZone = TimeZone(secondsFromGMT: 0)
		return formatter
	}

	@IBOutlet weak var destinationTime: UILabel!
	@IBOutlet weak var presentTime: UILabel!
	@IBOutlet weak var lastTimeDeparted: UILabel!
	@IBOutlet weak var speed: UILabel!
	
	
	override func viewDidLoad() {
        super.viewDidLoad()

		
    }
    
//	@IBAction func setDestinationTime(_ sender: UIButton) {
//	}
	@IBAction func travelBack(_ sender: UIButton) {
	}
	
	
}
