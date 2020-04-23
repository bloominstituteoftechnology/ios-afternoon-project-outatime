//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by Brian Rouse on 4/22/20.
//  Copyright © 2020 Brian Rouse. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {
    
    
    @IBOutlet weak var destinationLabel: UILabel!
    @IBOutlet weak var presentTimeLabel: UILabel!
    @IBOutlet weak var lastDepartedLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM  dd  yyyy"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        
        return formatter
    }
    
    var speedTimer: Timer?
    var currentSpeed: TimeInterval = 0.0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    
    @IBAction func travelBackButtonTapped(_ sender: UIButton) {
        startTimer()
    }
    
    func startTimer() {
        speedTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateSpeed(speedTimer:)), userInfo: nil, repeats: true)
    }
    
    @objc func updateSpeed(speedTimer: Timer) {
        if currentSpeed < 88.0 {
            currentSpeed += 1.0
            speedLabel.text = "\(currentSpeed) MPH"
        }else {
            speedTimer.invalidate()
            guard let lastTime = presentTimeLabel.text,
                let newPresentTime = destinationLabel.text else { return }
            lastDepartedLabel.text = lastTime
            presentTimeLabel.text = newPresentTime
            destinationLabel.text = "---  --  ----"
            speedLabel.text = "0 MPH"
            currentSpeed = 0.0
            let alert = UIAlertController(title: "Time Travel Successful", message: "The new date is \(newPresentTime).", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Roger That!", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
    }
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let datePickerVC = segue.destination as? DatePickerViewController else { return }
        datePickerVC.delegate = self
    }
}



extension TimeCircuitsViewController: DatePickerDelegate {
    func destinationWasChosen(date: Date) {
        destinationLabel.text = dateFormatter.string(from: date)
    }
}
