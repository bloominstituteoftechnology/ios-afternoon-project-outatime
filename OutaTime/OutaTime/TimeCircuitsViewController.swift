//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by Tobi Kuyoro on 13/11/2019.
//  Copyright © 2019 Tobi Kuyoro. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {

    @IBOutlet weak var destinationTimeLabel: UILabel!
    @IBOutlet weak var presentTimeLabel: UILabel!
    @IBOutlet weak var lastTimeDepartedLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    
    var speed = 0
    var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss.SS"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        return formatter
    }()
    
    func string(todaysDate: Date) -> String {
        return dateFormatter.string(from: todaysDate)
    }
    
    func setCurrentTime() {
        presentTimeLabel.text = string(todaysDate: Date())
    }
    
    func setSpeed() {
         speedLabel.text = "\(speed) MPH"
    }
    
    func lastTimeDeparted() {
        lastTimeDepartedLabel.text = "--- -- ----"
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func setDestinationButton(_ sender: Any) {
    }
    
    
    @IBAction func travelBackButton(_ sender: Any) {
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
