//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by Rob Vance on 4/27/20.
//  Copyright © 2020 Robs Creations. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {
// Mark: Outlets
    @IBOutlet weak var destinationTimeLabel: UILabel!
    @IBOutlet weak var presentTimeLabel: UILabel!
    @IBOutlet weak var lastTimeDepartedLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
// Mark: Actions
    @IBAction func travelBackTapped(_ sender: Any) {
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
