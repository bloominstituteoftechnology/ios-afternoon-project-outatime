//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by Jon Bash on 2019-10-16.
//  Copyright © 2019 Jon Bash. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {
    
    // MARK: Properties
    
    var speed = 0
    
    var dateFormatter = DateFormatter()
    // computed version: (less CPU-efficient, though it probably doesn't matter)
//    var dateformatter: DateFormatter {
//        let formatter = DateFormatter()
//        formatter.dateFormat = "HH:mm:ss.SS"
//        formatter.timeZone = TimeZone(secondsFromGMT: 0)
//        return formatter
//    }
    var nilTimeString = "--- -- ----"
    
    // MARK: Labels
    @IBOutlet weak var destinationTimeLabel: UILabel!
    @IBOutlet weak var presentTimeLabel: UILabel!
    @IBOutlet weak var lastDepartedTimeLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // set up date formatter
        dateFormatter.dateFormat = "MMM dd yyyy"
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        
        // set UI labels to defaults
        presentTimeLabel.text = dateFormatter.string(from: Date())
        speedLabel.text = "\(speed) MPH"
        lastDepartedTimeLabel.text = nilTimeString
        
    }
    
    // MARK: Private Methods
    
    
    // MARK: UI Actions
    
    @IBAction func setDestinationTapped(_ sender: Any) {
    }
    
    @IBAction func travelBackTapped(_ sender: Any) {
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
