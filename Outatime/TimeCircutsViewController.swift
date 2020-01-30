//
//  TimeCircutsViewController.swift
//  Outatime
//
//  Created by scott harris on 1/29/20.
//  Copyright © 2020 scott harris. All rights reserved.
//

import UIKit

class TimeCircutsViewController: UIViewController {
    @IBOutlet weak var destinationTimeLabel: UILabel!
    @IBOutlet weak var presentTimeLabel: UILabel!
    @IBOutlet weak var lastTimeDepartedLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    
    var currentSpeed = 0
    private var timer: Timer?
    
    private var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, yyyy"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        return formatter
    }()
    
    
    @IBAction func travelBackTapped(_ sender: Any) {
        startTimer()
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateSpeed), userInfo: nil, repeats: true)
    }
    
    @objc func updateSpeed() {
        if currentSpeed == 88 {
            resetTimer()
            lastTimeDepartedLabel.text = presentTimeLabel.text
            presentTimeLabel.text = destinationTimeLabel.text
            currentSpeed = 0
            if let presentTime = presentTimeLabel.text {
                let ac = UIAlertController(title: "Time Travel Successful", message: "You're new date is \(presentTime)", preferredStyle: .alert)
                ac.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                present(ac, animated: true)
            }

            
        } else {
            currentSpeed += 1
            speedLabel.text = "\(currentSpeed) MPH"
            
        }
    }
    
    func resetTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    override func viewDidLoad() {
        initializeViews()
    }
    
    func initializeViews() {
        speedLabel.font = UIFont.monospacedDigitSystemFont(ofSize: 44, weight: .regular)
        presentTimeLabel.text = dateFormatter.string(from: Date())
        speedLabel.text = "\(currentSpeed) MPH"
        lastTimeDepartedLabel.text = "--- -- ----"
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ModalDestinationDatePickerSegue" {
            if let destVC = segue.destination as? DatePickerViewController {
                destVC.delegate = self
            }
        }
    }
}

extension TimeCircutsViewController: DatePickerDelegate {
    func destinationDateWasChosen(date: Date) {
        destinationTimeLabel.text = dateFormatter.string(from: date)
        
        
    }
}
