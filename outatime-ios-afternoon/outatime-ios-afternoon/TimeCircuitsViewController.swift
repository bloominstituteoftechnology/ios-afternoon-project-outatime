//
//  TimeCircuitsViewController.swift
//  outatime-ios-afternoon
//
//  Created by Alex Shillingford on 6/12/19.
//  Copyright © 2019 Alex Shillingford. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {
    
    // MARK: - Outlets and properties
    @IBOutlet weak var destinationTimeLabel: UILabel!
    @IBOutlet weak var presentTimeLabel: UILabel!
    @IBOutlet weak var lastTimeDepartedLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    
    var currentSpeed: Double = 0.0
    var timer = Timer()
    var datePickerVC = DatePickerViewController()
    
    var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd yyyy"
        return formatter
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        presentTimeLabel.text = dateFormatter.string(from: Date())
    }
    // MARK: - IBActions, Methods, and Functions
    @IBAction func travelBackButtonPressed(_ sender: Any) {
        startTimer()
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateSpeed), userInfo: nil, repeats: true)
    }
    
    func resetTimer() {
        timer.invalidate()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let datePickerVC = segue.destination as? DatePickerViewController else { return }
        datePickerVC.delegate = self
    }
    
    // MARK: - Objective-C Functions
    @objc func updateSpeed() {
        if currentSpeed < 88 {
            currentSpeed += 1
            speedLabel.text = "\(currentSpeed) MPH"
        } else {
            speedLabel.text = "\(currentSpeed) MPH"
            currentSpeed = 0
            lastTimeDepartedLabel.text = presentTimeLabel.text
            presentTimeLabel.text = destinationTimeLabel.text
            resetTimer()
        }
    }
}

// MARK: - Extensions
extension TimeCircuitsViewController: DatePickerDelegate {
    func destinationDateWasChosen(_ destinationDate: Date) {
        destinationTimeLabel.text = dateFormatter.string(from: destinationDate)
    }
    
    
}
