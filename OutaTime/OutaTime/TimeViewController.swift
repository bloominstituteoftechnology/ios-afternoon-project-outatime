//
//  ViewController.swift
//  OutaTime
//
//  Created by Alex Rhodes on 7/24/19.
//  Copyright © 2019 Alex Rhodes. All rights reserved.
//

import UIKit

class TimeViewController: UIViewController {
    
    @IBOutlet weak var destinationTimeLabel: UILabel!
    @IBOutlet weak var presentTimeLabel: UILabel!
    @IBOutlet weak var lastTimeDepartedLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    
    let currentDate = Date()
    
    var currentSpeed = 0
    var timer: Timer?
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd yyyy"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        return formatter
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presentTimeLabel.text = dateFormatter.string(from: currentDate)
        speedLabel.text = "\(currentSpeed) MPH"
        lastTimeDepartedLabel.text = "__ _ ___"
        
    }
    
    
    
    
    @IBAction func setDestinationTimeButton(_ sender: UIButton) {
        
    }
    
    @IBAction func travelBackButton(_ sender: UIButton) {
        startTimer()
    }
    
    func startTimer() {
        resetTimer()
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: updateSpeed(timer:))
    }
    
    func resetTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    func updateSpeed(timer: Timer) {
        if currentSpeed < 88 {
            currentSpeed += 1
            speedLabel.text = String(currentSpeed)
        } else {
            resetTimer()
            lastTimeDepartedLabel.text = presentTimeLabel.text
            presentTimeLabel.text = destinationTimeLabel.text
            currentSpeed = 0
            
            let alert = UIAlertController(title: "Time Travel Successful", message: "You're new date is \(presentTimeLabel.text ?? "")", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "setDestinationTimeSegue" {
            if let destinationVC = segue.destination as? DatePickerViewController {
                destinationVC.delegate = self
            }
        }
    }
}

extension TimeViewController: DatePickerDelegate {
    
    func destinationDateWasChosen(date: Date) {
        
        let date = dateFormatter.string(from: date)
        destinationTimeLabel.text = date
    }
    
}

