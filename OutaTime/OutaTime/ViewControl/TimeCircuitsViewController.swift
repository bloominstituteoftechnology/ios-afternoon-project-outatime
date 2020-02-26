//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by Shawn James on 2/26/20.
//  Copyright © 2020 Shawn James. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {

    // MARK: - OUTLETS
    @IBOutlet weak var destinationTimeLabel: UILabel!
    @IBOutlet weak var presentTimeLabel: UILabel!
    @IBOutlet weak var lastTimeDepartedLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - ACTIONS
    @IBAction func setDestinationTimeButtonTapped(_ sender: UIButton) {
    }
    @IBAction func travelBackButtonTapped(_ sender: UIButton) {
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
