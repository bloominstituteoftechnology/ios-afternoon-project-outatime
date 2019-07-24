//
//  TimeCircuitsViewController.swift
//  Outatime
//
//  Created by Andrew Ruiz on 7/24/19.
//  Copyright © 2019 Andrew Ruiz. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {

    // Outlets
    
    @IBOutlet weak var destinationTime: UILabel!
    @IBOutlet weak var presentTime: UILabel!
    @IBOutlet weak var lastTimeDeparted: UILabel!
    @IBOutlet weak var speed: UILabel!
    @IBOutlet weak var setDestinationTime: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func setDestinationButtonTapped(_ sender: Any) {
    }
    
    @IBAction func travelBackButtonTapped(_ sender: Any) {
    }
    
}
