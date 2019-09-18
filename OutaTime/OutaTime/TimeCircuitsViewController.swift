//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by macbook on 9/18/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var destinationTimeLabel: UILabel!
    @IBOutlet weak var presentTimeLabel: UILabel!
    @IBOutlet weak var lastTimeDepartedLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    
    
    // MARK: - Properties
     var currentSpeed = 0
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        
        formatter.dateFormat = "HH:mm"
        formatter.timeZone = TimeZone(abbreviation: "UTC -8")  // you might have to take the " -8" out
        
        return formatter
    }
    

   

    
    
    
    // VIEW DID LOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        presentTimeLabel.text = dateFormatter.dateFormat
        speedLabel.text = "\(currentSpeed) MPH"
        lastTimeDepartedLabel.text = "--- -- ----"
    }
    
    //"MM-dd-yyyy"
    
    
    
    
    // IBAction
    @IBAction func travelBackButton(_ sender: UIButton) {
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
