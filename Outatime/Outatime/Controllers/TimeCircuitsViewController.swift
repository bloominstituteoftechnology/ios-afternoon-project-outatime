//
//  TimeCircuitsViewController.swift
//  Outatime
//
//  Created by Tobi Kuyoro on 18/12/2019.
//  Copyright © 2019 Tobi Kuyoro. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {

    @IBOutlet weak var destinationTimeLabel: UILabel!
    @IBOutlet weak var presentTimeLabel: UILabel!
    @IBOutlet weak var lastTimeDepartedLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    
    let today = Date()
    var speed = 0
    var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, yyyy"
        
        return formatter
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presentTimeLabel.text = dateFormatter.string(from: today)
        speedLabel.text = "\(speed) MPH"
        lastTimeDepartedLabel.text = "--- -- ----"

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
