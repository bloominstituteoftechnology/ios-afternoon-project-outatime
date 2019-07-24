//
//  ViewController.swift
//  OutaTime
//
//  Created by Alex Rhodes on 7/24/19.
//  Copyright © 2019 Alex Rhodes. All rights reserved.
//

import UIKit

class TimeViewController: UIViewController {

    @IBOutlet weak var destinationTimeLabel: UILabel!
    @IBOutlet weak var presentTimeLabel: UILabel!
    @IBOutlet weak var lastTimeDepartedLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    
    let currentDate = Date()
    
    var currentSpeed = 0
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd yyyy"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        return formatter
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    presentTimeLabel.text = dateFormatter.string(from: currentDate)
    speedLabel.text = "\(currentSpeed) MPH"
    lastTimeDepartedLabel.text = "__ _ ___"
        
    }
    
    
    @IBAction func setDestinationTimeButton(_ sender: UIButton) {
    }
    
    @IBAction func travelBackButton(_ sender: UIButton) {
    }
    

}

