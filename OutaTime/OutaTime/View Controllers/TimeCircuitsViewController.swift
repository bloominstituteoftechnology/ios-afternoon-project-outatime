//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by Ciara Beitel on 8/21/19.
//  Copyright © 2019 Ciara Beitel. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {
    
    @IBOutlet weak var destinationTimeLabel: UILabel!
    
    @IBOutlet weak var presentTimeLabel: UILabel!
    
    @IBOutlet weak var lastTimeDepartedLabel: UILabel!
    
    @IBOutlet weak var speedLabel: UILabel!
    
    @IBOutlet weak var setDestinationTimeButton: UIButton!
    
    @IBOutlet weak var travelBackButton: UIButton!
    
    @IBAction func travelBackTapped(_ sender: Any) {
    }
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd, yyyy"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        return formatter
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let date = Date()
        presentTimeLabel.text = dateFormatter.string(from: date)
        
        let currentSpeed = 0
        speedLabel.text = "\(currentSpeed) MPH"
        
        lastTimeDepartedLabel.text = "--- -- ----"
    }
}

extension TimeCircuitsViewController: DatePickerDelegate {
    func destinationDateWasChosen(_: Date) {
        <#code#>
    }
}
