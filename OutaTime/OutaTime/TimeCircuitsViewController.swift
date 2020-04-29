//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by Josh Kocsis on 4/28/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {
    @IBOutlet weak var destinationLabel: UILabel!
    @IBOutlet weak var presentTimeLabel: UILabel!
    @IBOutlet weak var lastTimeDepartedLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    
    
    var timer: Timer?
    var date = Date()
    var currentSpeed = 0
    var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM d, yyyy"
        return formatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    func updateViews() {
        lastTimeDepartedLabel.text = "--- -- ----"
        speedLabel.text = "\(String(currentSpeed)) MPH"
        presentTimeLabel.text = "\(dateFormatter.string(from: date))"
        destinationLabel.text = "--- -- ----"
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: updateSpeed(timer:))
    }
    
    func resetTimer() {
        timer?.invalidate()
    }
    
    func updateSpeed(timer: Timer) {
        if currentSpeed < 88 {
            currentSpeed += 1
            speedLabel.text = "\(currentSpeed) MPH"
        } else {
            resetTimer()
            lastTimeDepartedLabel.text = presentTimeLabel.text
            presentTimeLabel.text = destinationLabel.text
            currentSpeed = 0
            speedLabel.text = "\(currentSpeed) MPH"
            destinationAlert()
        }
    }
    
    func destinationAlert() {
        let alert = UIAlertController(title: "Time Travel Successful!", message: "You're new date is \(presentTimeLabel.text!)", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(alertAction)
        present(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func travelBackTapped(_ sender: Any) {
        startTimer()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SetDestinationTimeSegue" {
            guard let pickTime = segue.destination as? DatePickerViewController else { return }
            pickTime.delegate = self
        }
    }
}

extension TimeCircuitsViewController: DatePickerDelegate {
    func destinationDateWasChosen(date: Date) {
        destinationLabel.text = "\(dateFormatter.string(from: date))"
    }
}
