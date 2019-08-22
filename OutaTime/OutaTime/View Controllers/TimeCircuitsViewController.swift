//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by Ciara Beitel on 8/21/19.
//  Copyright © 2019 Ciara Beitel. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {
    
    @IBOutlet weak var destinationTimeLabel: UILabel!
    
    @IBOutlet weak var presentTimeLabel: UILabel!
    
    @IBOutlet weak var lastTimeDepartedLabel: UILabel!
    
    @IBOutlet weak var speedLabel: UILabel!
    
    @IBOutlet weak var setDestinationTimeButton: UIButton!
    
    @IBOutlet weak var travelBackButton: UIButton!
    
    @IBAction func travelBackTapped(_ sender: Any) {
        startTimer()
    }
    
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd, yyyy"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        return formatter
    }
    
    private var timer: Timer?
    
    var currentSpeed = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let date = Date()
        presentTimeLabel.text = dateFormatter.string(from: date)
        
        speedLabel.text = "\(currentSpeed) MPH"
        
        lastTimeDepartedLabel.text = "--- -- ----"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ModalDestinationDatePickerSegue" {
            let DatePickerVC = segue.destination as? DatePickerViewController
            DatePickerVC?.delegate = self
        }
    }
    
    func startTimer() {
        cancelTimer()
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: updateSpeed(timer:))
    }
    
    func cancelTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    func updateSpeed(timer: Timer) {
        
        if currentSpeed < 88 {
            currentSpeed += 1
            speedLabel.text = "\(currentSpeed)"
        } else if currentSpeed >= 88 {
            cancelTimer()
            lastTimeDepartedLabel.text = presentTimeLabel.text
            presentTimeLabel.text = destinationTimeLabel.text
            destinationTimeLabel.text = "--- -- ----"
            currentSpeed = 0
            showAlert()
        }
    }
    
    private func showAlert() {
        let alert = UIAlertController(title: "Time Travel Successful", message: "Your new date is \(presentTimeLabel.text!).", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}

extension TimeCircuitsViewController: DatePickerDelegate {
    func destinationDateWasChosen(_ date: Date) {
        destinationTimeLabel.text = dateFormatter.string(from: date)
    }
}


