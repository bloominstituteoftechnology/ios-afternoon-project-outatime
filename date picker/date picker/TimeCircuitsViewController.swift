//
//  TimeCircuitsViewController.swift
//  date picker
//
//  Created by William Chen on 8/21/19.
//  Copyright © 2019 William Chen. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {
    @IBOutlet weak var destinationTimeLabel: UILabel!
    
    @IBOutlet weak var presentTimeLabel: UILabel!
    @IBOutlet weak var lastTimeDeparted: UILabel!
    
    
    @IBOutlet weak var speedLabel: UILabel!
    
    var currentSpeed = 0
    
    var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss.SS"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        return formatter
    }()
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
