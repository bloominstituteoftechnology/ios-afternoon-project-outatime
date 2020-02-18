//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by Claudia Contreras on 2/18/20.
//  Copyright © 2020 thecoderpilot. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet var destinationTimeLabel: UILabel!
    @IBOutlet var presentTimeLabel: UILabel!
    @IBOutlet var lastTimeDepartedLabel: UILabel!
    @IBOutlet var speedLabel: UILabel!
    
    
    //MARK: - Properties
    var dateFormatter: DateFormatter = {
       let formatter = DateFormatter()
        formatter.dateFormat = "MMM d yyyy"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        return formatter
    }()
    
    let speed = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Set presentDateLabel
        let date = Date()
        presentTimeLabel.text = dateFormatter.string(from: date)
        
        //Set speedLabel
        speedLabel.text = "\(speed) MPH"
        
        //Set lastTimeDepartedLabel
        lastTimeDepartedLabel.text = "--- -- ----"
    }
    

    //MARK: - IBAction
    @IBAction func setDestinationTimeTapped(_ sender: Any) {
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
