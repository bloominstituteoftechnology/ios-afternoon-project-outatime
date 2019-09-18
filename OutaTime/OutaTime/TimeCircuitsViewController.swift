//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by Gi Pyo Kim on 9/18/19.
//  Copyright © 2019 GIPGIP Studio. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {
    
    // MARK: - Properties
    @IBOutlet weak var destinationTimeLabel: UILabel!
    @IBOutlet weak var presentTimeLabel: UILabel!
    @IBOutlet weak var lastTimeLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd yyyy"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        return formatter
    }
    
    var currentSpeed = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presentTimeLabel.text = dateFormatter.string(from: Date())

    }
    
    @IBAction func setDestinationTimeButtonTabbed(_ sender: UIButton) {
    }
    @IBAction func travelBackButtonTabbed(_ sender: UIButton) {
    }
    
    

}
