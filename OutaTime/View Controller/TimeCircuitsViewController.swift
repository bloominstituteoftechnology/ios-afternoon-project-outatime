//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by Rob Vance on 2/17/20.
//  Copyright © 2020 Rob Vance. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {
    @IBOutlet weak var destinationTimeLabel: UILabel!
    @IBOutlet weak var lastTimeDepartedLabel: UILabel!
    @IBOutlet weak var presentTimeLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
   
    @IBAction func travelBackPressed(_ sender: UIButton) {
       
    }
    var speed = 0
    var timer: Timer?
    
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, yyyy"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        return formatter
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "Time Travel Successful!", message: "Your new date: \(presentTimeLabel.text ?? "Error")", preferredStyle: .alert)
        let action = UIAlertAction(title: "Okay", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true)
    }
    
   

    
    
}
