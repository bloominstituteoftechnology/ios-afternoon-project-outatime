//
//  TimeCircuitsViewController.swift
//  OutOfTime
//
//  Created by Drew Miller on 5/20/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {

    //Outlets
    @IBOutlet weak var DestinationTimeOutlet: UILabel!
    @IBOutlet weak var PresentTimeOutlet: UILabel!
    @IBOutlet weak var LastTimeDepartedOutlet: UILabel!
    @IBOutlet weak var SpeedOutlet: UILabel!
    
    //Actions
    @IBAction func TravelBackAction(_ sender: Any) {
    }
    @IBAction func SetDestinationAction(_ sender: Any) {
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
