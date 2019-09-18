//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by admin on 9/18/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {

    @IBOutlet weak var destinationLabel: UILabel!
    @IBOutlet weak var presentLabel: UILabel!
    @IBOutlet weak var lastLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    
    let currentDate = Date()
    
    let currentSpeed = 0
    
    var dateFormatter: DateFormatter  {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d yyyy"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        return formatter
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presentLabel.text = dateFormatter.string(from: currentDate)
        speedLabel.text = "\(currentSpeed) MPH"
        lastLabel.text = "___ __ ____"

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func travelBackButton(_ sender: UIButton) {
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

extension TimeCircuitsViewController: DatePickerDelegate {
    func destinationDateWasChosen(date: Date) {
        destinationLabel.text = dateFormatter.string(from: date)
    }
    
    
}
