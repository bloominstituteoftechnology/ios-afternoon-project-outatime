//
//  TimeCircuitsViewController.swift
//  OutaTime.CraigBelinfante
//
//  Created by Craig Belinfante on 6/9/20.
//  Copyright © 2020 Craig Belinfante. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {
    
    @IBOutlet weak var destinationTime: UITextField!
    @IBOutlet weak var presentTime: UITextField!
    @IBOutlet weak var departedTime: UITextField!
    @IBOutlet weak var speed: UITextField!
    
    @IBAction func setButtonTapped(_ sender: Any) {
    }
    @IBAction func travelBackButtonTapped(_ sender: Any) {
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
