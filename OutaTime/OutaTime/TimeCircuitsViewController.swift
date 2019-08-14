//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by Joseph Rogers on 8/13/19.
//  Copyright © 2019 Joe Rogers. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {

    
    @IBOutlet weak var destinationTimeLabel: UILabel!
    @IBOutlet weak var presentTimeLabel: UILabel!
    @IBOutlet weak var lastTimeDepartedLabel: UILabel!
    @IBOutlet weak var milesPerHourLabel: UILabel!
    
    var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, yyyy"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        return formatter
    }()
    
    var currentSpeed = 0

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presentTimeLabel.text = dateFormatter.string(from: Date())
        milesPerHourLabel.text = String(currentSpeed) + "MPH"
        lastTimeDepartedLabel.text = "--- -- ----"
      
    }
    
    
    
    @IBAction func destinationTimeAction(_ sender: UIButton) {
    }
    
    @IBAction func travelBackAction(_ sender: UIButton) {
    }
  

    /*
     // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
