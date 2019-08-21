//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by Ciara Beitel on 8/21/19.
//  Copyright © 2019 Ciara Beitel. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {
    
    @IBOutlet weak var destinationTimeLabel: UILabel!
    
    @IBOutlet weak var presentTimeLabel: UILabel!
    
    @IBOutlet weak var lastTimeDepartedLabel: UILabel!
    
    @IBOutlet weak var speedLabel: UILabel!
    
    @IBOutlet weak var setDestinationTimeButton: UIButton!
    
    @IBOutlet weak var travelBackButton: UIButton!
    
    @IBAction func travelBackTapped(_ sender: Any) {
    }
    
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

}
