//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by Chad Rutherford on 11/13/19.
//  Copyright © 2019 Chad Rutherford. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {
    
    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
    // MARK: - Outlets
    @IBOutlet weak var destinationTimeLabel: UILabel!
    @IBOutlet weak var presentTimeLabel: UILabel!
    @IBOutlet weak var lastTimeDepartedLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    
    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
    // MARK: - Properties
    var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }()
    
    var currentSpeed = 0
    var speedString: String {
        return "\(currentSpeed) MPH"
    }
    
    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
    // MARK: - View Controller Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    func updateViews() {
        presentTimeLabel.text = dateFormatter.string(from: Date())
        lastTimeDepartedLabel.text = "--- -- ----"
        speedLabel.text = speedString
    }
    
    @IBAction func travelBackTapped(_ sender: UIButton) {
        
    }
}
