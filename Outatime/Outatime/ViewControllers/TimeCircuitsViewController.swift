//
//  TimeCircuitsViewController.swift
//  Outatime
//
//  Created by Chris Price on 12/10/19.
//  Copyright © 2019 Chris Price. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {

    @IBOutlet weak var destinationTime: UILabel!
    @IBOutlet weak var presentTime: UILabel!
    @IBOutlet weak var lastTimeDeparted: UILabel!
    @IBOutlet weak var speed: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func travelBackTapped(_ sender: Any) {
    }
    
}
