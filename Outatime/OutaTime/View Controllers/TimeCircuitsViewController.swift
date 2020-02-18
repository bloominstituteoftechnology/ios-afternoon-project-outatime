//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by Elizabeth Thomas on 2/17/20.
//  Copyright © 2020 Libby Thomas. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var destinationTimeLabel: UILabel!
    @IBOutlet weak var presentTimeLabel: UILabel!
    @IBOutlet weak var lastTimeDepartedLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    
    // MARK: - Properties
    
    var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd, yyyy"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        return formatter
    }()
    
    var currentSpeed = 0
    
    // MARK: - IBActions
    @IBAction func travelBackButtonTapped(_ sender: UIButton) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Set the label that shows the present time on screen to the current date using the date formatter
        speedLabel.text = "\(currentSpeed) MPH"
        lastTimeDepartedLabel.text = "--- -- ----"
        
    }
}

extension TimeCircuitsViewController: DatePickerDelegate {
    func destinationWasChosen(_: Date) {
        <#code#>
    }
}
