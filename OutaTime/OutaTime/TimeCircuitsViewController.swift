//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by Blake Andrew Price on 7/24/19.
//  Copyright © 2019 Blake Andrew Price. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {
    @IBOutlet weak var destinationTimeLabel: UILabel!
    @IBOutlet weak var presentTimeLabel: UILabel!
    @IBOutlet weak var lastTimeDepartedLabel: UILabel!
    @IBOutlet weak var speedMPHLabel: UILabel!
    @IBAction func travelBackButtonTapped(_ sender: UIButton) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presentTimeLabel.text = dateFormatter.string(from: currentDateTime)
        speedMPHLabel.text = String("\(currentSpeed) MPH")
        lastTimeDepartedLabel.text = "--- -- ----"
    }
    
    
    var currentSpeed: Int = 0
    let currentDateTime = Date()
    var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd yyyy"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        return formatter
    }()
    
    
    
    
    



    

    
}
