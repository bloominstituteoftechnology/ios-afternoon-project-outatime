//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by Samuel Esserman on 2/26/20.
//  Copyright © 2020 Samuel Esserman. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {
    @IBOutlet weak var destinationTimeLabel: UILabel!
    @IBOutlet weak var presentTimeLabel: UILabel!
    @IBOutlet weak var lastTimeDepartedLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    
    var currentSpeed = 0
    
    private var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, yyyy"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        return formatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

       
    }
    
    
    
    @IBAction func travelBackTapped(_ sender: Any) {
        }
    

   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       }

}
