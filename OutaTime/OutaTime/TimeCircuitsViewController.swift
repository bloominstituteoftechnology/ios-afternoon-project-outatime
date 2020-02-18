//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by Claudia Contreras on 2/18/20.
//  Copyright © 2020 thecoderpilot. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet var destinationTimeLabel: UILabel!
    @IBOutlet var presentTimeLabel: UILabel!
    @IBOutlet var lastTimeDepartedLabel: UILabel!
    @IBOutlet var speedLabel: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    //MARK: - IBAction
    @IBAction func setDestinationTimeTapped(_ sender: Any) {
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
