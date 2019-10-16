//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by Niranjan Kumar on 10/16/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {

    
    @IBOutlet weak var destinationTimeLabel: UILabel!
    
    @IBOutlet weak var presentTimeLabel: UILabel!
    @IBOutlet weak var timeDepartedLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, yyyy"
        formatter.timeZone = .current
        return formatter
    }
    
    var speed = 0
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let date = Date()
        presentTimeLabel.text = dateFormatter.string(from: date)
        speedLabel.text = "\(speed) MPH"
        timeDepartedLabel.text = "--- -- ----"
        
        updateViews()
    }
    
    @IBAction func travelBackTapped(_ sender: UIButton) {
    }
    
    
    private func updateViews() {
       
        
        
    }

}

