//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by Jon Bash on 2019-10-16.
//  Copyright © 2019 Jon Bash. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {
    
    // MARK: Properties
    
    // MARK: Labels
    @IBOutlet weak var destinationTimeLabel: UILabel!
    @IBOutlet weak var presentTimeLabel: UILabel!
    @IBOutlet weak var lastDepartedTimeLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: UI Actions
    
    @IBAction func setDestinationTapped(_ sender: Any) {
    }
    
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
