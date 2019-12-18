//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by Jorge Alvarez on 12/18/19.
//  Copyright © 2019 Jorge Alvarez. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {

    @IBOutlet weak var destinationTimeLabel: UILabel!
    @IBOutlet weak var presentTimeLable: UILabel!
    @IBOutlet weak var lastTimeDepartedLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    
    var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, yyyy" // JAN 01, 2001
        return formatter
    }()
    
    var currentSpeed = 0
    
    @IBAction func travelBackButtonTapped(_ sender: UIButton) {
        print("travel back")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presentTimeLable.text = dateFormatter.string(from: Date()) // current time
        speedLabel.text = "\(currentSpeed) MPH"
        lastTimeDepartedLabel.text = "--- -- ----"
        
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
