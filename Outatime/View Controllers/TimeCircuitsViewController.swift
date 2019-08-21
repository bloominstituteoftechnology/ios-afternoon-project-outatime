//
//  TimeCircuitsViewController.swift
//  Outatime
//
//  Created by Andrew Ruiz on 8/21/19.
//  Copyright © 2019 Andrew Ruiz. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {

    @IBOutlet weak var destinationTime: UILabel!
    @IBOutlet weak var presentTime: UILabel!
    @IBOutlet weak var lastTimeDeparted: UILabel!
    @IBOutlet weak var speed: UILabel!
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func setDestinationTimeButtonPressed(_ sender: Any) {
    }
    
    @IBAction func travelBackButtonPressed(_ sender: Any) {
    }
}
