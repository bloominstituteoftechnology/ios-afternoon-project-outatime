//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by Vincent Hoang on 4/22/20.
//  Copyright © 2020 Vincent Hoang. All rights reserved.
//

import UIKit
import os.log

class TimeCircuitsViewController: UIViewController, DatePickerViewDelegate {
    @IBOutlet var destinationTimeLabel: UILabel!
    @IBOutlet var presentTimeLabel: UILabel!
    @IBOutlet var lastDepartedLabel: UILabel!
    @IBOutlet var speedLabel: UILabel!
    
    var datePickerDelegate: DatePickerViewDelegate?
    
    var dateFormatter: DateFormatter {
        let df = DateFormatter()
        df.dateStyle = .medium
        df.timeStyle = .none
        
        return df
    }
    
    override func viewDidLoad() {
        setPresentTime()
    }
    
    private func setPresentTime() {
        let currentDate = Date()
        presentTimeLabel.text = dateFormatter.string(from: currentDate)
    }
    
    func setDestinationDate(_ date: Date) {
        os_log("Destination time set")
        destinationTimeLabel.text = dateFormatter.string(from: date)
    }
    
    @IBAction func travelBackButtonPressed(_ sender: UIButton) {
        startTimer()
        
        
        let alert = UIAlertController(title: "Time Travel Successful", message: "Your new date is \(presentTimeLabel.text ?? "--- -- ----")", preferredStyle: .alert)
        
        let dismissAction = UIAlertAction(title: "Done", style: .cancel,
                                          handler: { action in self.resetTimer() })
        
    
        
        alert.addAction(dismissAction)
        
        present(alert, animated: true,
                completion: { self.updateTime() })
    }
    
    private func startTimer() {
        var currentSpeed = 0

        let timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { timer in
            self.speedLabel.text = "\(currentSpeed) MPH"
            
            if currentSpeed == 88 {
                timer.invalidate()
            }
            
            currentSpeed += 1
        }
        
        timer.fire()
    }
    
    private func updateTime() {
        lastDepartedLabel.text = presentTimeLabel.text
        presentTimeLabel.text = destinationTimeLabel.text
    }
    
    private func resetTimer() {
        
        var currentSpeed: Int = 88
        
        let timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { timer in
            self.speedLabel.text = "\(currentSpeed) MPH"
            
            if currentSpeed == 0 {
                timer.invalidate()
            }
            
            currentSpeed -= 1
        }
        
        timer.fire()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        switch segue.identifier ?? "" {
        case "setDestinationSegue":
            guard let datePickerViewController = segue.destination as? DatePickerViewController else {
                fatalError("Unable to segue to DatePickerViewController")
            }
            datePickerViewController.delegate = self
            
        default:
            fatalError("No segue identifier")
        }
    }
    
}
