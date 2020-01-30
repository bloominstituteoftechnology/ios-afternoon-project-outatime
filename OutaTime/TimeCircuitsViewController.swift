//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by Nichole Davidson on 1/29/20.
//  Copyright © 2020 Nichole Davidson. All rights reserved.
//

import Foundation

class TimeCircuitsViewController {
    
    @IBOutlet weak var destinationTickerLabel: UILabel!
    @IBOutlet weak var presentTickerLabel: UILabel!
    @IBOutlet weak var lastDepartedTickerLabel: UILabel!
    @IBOutlet weak var speedTickerLabel: UILabel!
    
    
    
    @IBAction func travelBackTapped(_ sender: UIButton) {
    }
    
    
    private var dateFormatter: DateFormatter {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, yyyy"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        return formatter
    }
    
    
    func viewDidLoad() {
    var presentTickerLabel = dateFormatter.dateFormat
    }
    
    
    var currentSpeed = 0
    var speedTickerLabel = "\(currentSpeed) MPH"
    let lastDepartedTickerLabel = "___ __ ____"
    
}


extension TimeCircuitsViewController: DatePickerDelegate {
   
    func destinationDateWasChosen(_: Date) {
        <#code#>
    }
    
    
    
}
