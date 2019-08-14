//
//  ViewController.swift
//  OutaTime
//
//  Created by Jessie Ann Griffin on 8/12/19.
//  Copyright © 2019 Jessie Griffin. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {

    // MARK: Properties
    @IBOutlet weak var destinationTimeLabel: UILabel!
    @IBOutlet weak var presentTimeLabel: UILabel!
    @IBOutlet weak var lastTimeLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    
    var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd yyyy"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        return formatter
    }()
    
    var speed = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //let presentDay = Date()
        presentTimeLabel.text = dateFormatter.string(from: Date())
        speedLabel.text = "\(speed) MPH"
        lastTimeLabel.text = "--- -- ----"
    }

    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    @IBAction func travelBackTapped(_ sender: Any) {
    }
    
}

extension TimeCircuitsViewController: DatePickerDelegate {
    func destinationDateWasChosen(_ date: Date) {
    
    }
    
    
}
