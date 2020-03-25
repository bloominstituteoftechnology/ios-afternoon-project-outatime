//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by Marissa Gonzales on 3/25/20.
//  Copyright © 2020 Joe Veverka. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {
    
    // Destination Outlets
    @IBOutlet weak var destinationTimeLabel: UILabel!
    @IBOutlet weak var destinationTimeDetailLabel: UILabel!
    // Present Time Outlets
    @IBOutlet weak var presentTimeLabel: UILabel!
    @IBOutlet weak var presentTimeDetailLabel: UILabel!
    //Last Departed Outlets
    @IBOutlet weak var lastDepartedLabel: UILabel!
    @IBOutlet weak var lastDepartedDetailLabel: UILabel!
    // Speed Outlets
    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var speedDetailLabel: UILabel!
    
   // Travel back (reset) button
    @IBAction func travelBackButton(_ sender: Any) {
    }
    
    // Date Formatter
    private var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, yyyy"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        return formatter
    }()
    
  // TO DO: CURRENT SPEED
    
    func currentSpeedFunc() {
        var currentSpeed = 0
    speedDetailLabel.text = "\(currentSpeed) MPH"
       }
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lastDepartedDetailLabel.text = "---- -- ----"
        
        
        
        // Setting present time detail label to current date
        presentTimeDetailLabel.text = DateFormatter.localizedString(from: Date(), dateStyle: .long, timeStyle: .none)
        
        // current speed
//
        
       
        
        
        
        
        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Navigation

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    
   

}
extension TimeCircuitsViewController: DatePickerDelegate {
    func destinationDateWasChosen(date: Date) {
        
    }
    
    
       
   }


