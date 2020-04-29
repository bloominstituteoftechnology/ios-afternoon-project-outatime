//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by Sammy Alvarado on 4/27/20.
//  Copyright © 2020 Sammy Alvarado. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {
    // Storyboard Tasks
    @IBOutlet weak var destinationTimeLabel: UILabel!
    @IBOutlet weak var presentTimeLabel: UILabel!
    @IBOutlet weak var lastTimeDepartedLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    
    @IBOutlet weak var destinationTimePicker: UIPickerView!
    @IBOutlet weak var presetnTimePicker: UIPickerView!
    @IBOutlet weak var lastTimeDepartedPicker: UIPickerView!
    @IBOutlet weak var speedPicker: UIPickerView!
    
    
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
