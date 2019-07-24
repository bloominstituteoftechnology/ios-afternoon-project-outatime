//
//  TimeCircuitsViewController.swift
//  Outatime
//
//  Created by Andrew Ruiz on 7/24/19.
//  Copyright © 2019 Andrew Ruiz. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {

    // Outlets
    @IBOutlet weak var destinationTime: UILabel!
    @IBOutlet weak var presentTime: UILabel!
    @IBOutlet weak var lastTimeDeparted: UILabel!
    @IBOutlet weak var speed: UILabel!
    @IBOutlet weak var setDestinationTime: UIButton!
    
    // Properties
    var currentSpeed: Double = 0
    
    // Date Formatter
    var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEE, MMM d, ''yy"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        return formatter
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set current date/time
        let currentTime = dateFormatter.string(from: Date())
        presentTime.text = currentTime
        
        // Set the speed
        speed.text = "\(String(currentSpeed)) mph)"
        
        // Set the last time departed
        lastTimeDeparted.text = "--- -- ----"

    }
    
    
    @IBAction func setDestinationButtonTapped(_ sender: Any) {
    }
    
    @IBAction func travelBackButtonTapped(_ sender: Any) {
    }
    
}
