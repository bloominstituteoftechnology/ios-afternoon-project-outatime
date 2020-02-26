//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by Harmony Radley on 2/26/20.
//  Copyright © 2020 Harmony Radley. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {
    
    // MARK: - Outlets
    

    @IBOutlet weak var destinationLabel: UILabel!
    @IBOutlet weak var destinationTextField: UITextField!
    
    @IBOutlet weak var presentTimeLabel: UILabel!
    @IBOutlet weak var presentTimeTextField: UITextField!
    
    
    @IBOutlet weak var lastTimeLabel: UILabel!
    @IBOutlet weak var lastTimeTextField: UITextField!
    
    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var speedTextField: UITextField!
    
    
    @IBAction func travelBackTapped(_ sender: Any) {
    }
    
    
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, yyyy"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        return formatter
    }
    
    
    
    
    
    
}
