//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by Jesse Ruiz on 9/18/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {
    
    
    
    // MARK: - Outlets
    @IBOutlet weak var destinationTimeLabel: UILabel!
    @IBOutlet weak var presentTimeLabel: UILabel!
    @IBOutlet weak var timeDepartedLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd yyyy"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        return formatter
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let date = Date(timeIntervalSinceNow: 50)
        dateFormatter.locale = Locale(identifier: "en_US")
        presentTimeLabel.text = dateFormatter.string(from: date)
        
        let currentSpeed = 0
        let currentSpeed2 = String(currentSpeed)
        speedLabel.text = String(currentSpeed2 + "MPH")
        
        timeDepartedLabel.text = "--- -- ----"
    }
    
    // MARK: - Actions
    @IBAction func travelBackButtonTapped(_ sender: UIButton) {
    }
    
}

extension TimeCircuitsViewController: DatePickerDelegate {
    func destinationDateWasChosen(_: Date) {
        <#code#>
    }
}














