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
        presentTimeLabel.text = dateFormatter.string(from: Date())
        speedLabel.text = "\(currentSpeed) MPH"
        lastTimeDeparted.text = "--- -- ----"
        destinationTimeLabel.text = dateFormatter.string(from: Date())
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func setDestinationTime(_ sender: UIButton) {
        
    }
    
    @IBAction func travelBack(_ sender: UIButton) {
        func startTimer(){
            Timer.scheduledTimer(withTimeInterval: 0.1, repeats: false, block: speedLabel.text = )
        }
    }
    
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
     
    }
    

}

extension TimeCircuitsViewController : DatePickerDelegate {
    func destinationWasChosen(_ date: Date) {
        <#code#>
    }
    
}
