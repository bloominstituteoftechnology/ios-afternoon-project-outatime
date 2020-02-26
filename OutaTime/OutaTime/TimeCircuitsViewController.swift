//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by Nichole Davidson on 2/26/20.
//  Copyright © 2020 Nichole Davidson. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {
    
   
    @IBOutlet weak var destinationTickerLabel: UILabel!
    @IBOutlet weak var presentTickerLabel: UILabel!
    @IBOutlet weak var lastDepartedTickerLabel: UILabel!
    @IBOutlet weak var speedTickerLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    var dateFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateFormat = "MMM d, yyyy"
            formatter.timeZone = TimeZone(secondsFromGMT: 0)
            return formatter
      }()
    
    //Need to set presentTickerLabel to current date using date formatter
    var currentSpeed = 0
    var speedTickerLabel = "\(currentSpeed) MPH"
    let lastDepartedTickerLabel = "___ __ ____"
    
  
    @IBAction func travelBackButtonTapped(_ sender: Any) {
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
