//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by John Holowesko on 12/10/19.
//  Copyright © 2019 John Holowesko. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet var destinationTimeTextField: UILabel!
    @IBOutlet var presentTimeTextField: UILabel!
    @IBOutlet var lastTimeDepartedTextField: UILabel!
    @IBOutlet var textTextField: UILabel!
    
    // MARK: - Properties
    var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, yyyy"
        return formatter
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - IBActions
    @IBAction func setDestinationTimeTapped(_ sender: UIButton) {
    }
    @IBAction func travelBackTapped(_ sender: UIButton) {
    }
    
    
}
