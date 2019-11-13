//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by Donella Barcelo on 11/13/19.
//  Copyright © 2019 Donella Barcelo. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {
    
    @IBOutlet weak var destinationTimeLabel: UILabel!
    @IBOutlet weak var presentTimeLabel: UILabel!
    @IBOutlet weak var lastTimeDepartedLabel: UILabel!
    @IBOutlet weak var speedTimeLabel: UILabel!
    @IBOutlet weak var setDestinationTimeButton: UIButton!
    @IBOutlet weak var travelBackButton: UIButton!
    
    
    private var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "M3 d1..2 y1..n"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        return formatter
    }()
    
    var currentSpeed = 0
    
    private var timer: Timer?
    private var destinationDate: Date?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func updateViews() {
        let date = Date()
        presentTimeLabel.text = dateFormatter.string(from: date)
        destinationTimeLabel.text = "--- -- ----"
        speedTimeLabel.text = "\(currentSpeed) MPH"
        lastTimeDepartedLabel.text = "--- -- ----"
    }
    
    func startTimer() {
        cancelTimer()
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: speedUpdate(timer:))
    }
    
    func resetTimer() {
        cancelTimer()
    }
    
    func cancelTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    private func speedUpdate(timer: Timer) {
        if (currentSpeed < 88) {
            currentSpeed += 1
            speedTimeLabel.text = "\(currentSpeed) MPH"
        } else {
            cancelTimer()
            lastTimeDepartedLabel.text = presentTimeLabel.text
            presentTimeLabel.text = destinationTimeLabel.text
            currentSpeed = 0
            speedTimeLabel.text = "\(currentSpeed) MPH"
            travelAlert()
        }
    }
    
    @IBAction func travelBackTapped(_ sender: Any) {
        if (destinationTimeLabel.text == "--- -- ----") {
            setDestinationAlert()
        } else {
            travelAlert()
        }
    }
    
    private func setDestinationAlert() {
        let destinationAlert = UIAlertController(title: "Set Destination Time", message: "Your destination is \(destinationTimeLabel.text!)", preferredStyle: .alert)
        destinationAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
    }
    
    private func travelAlert() {
        let alert = UIAlertController(title: "Successful Time Travel!", message: "Present Time: \(presentTimeLabel.text!)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "ModalDestinationDatePickerSegue") {
            if let datePickerVC = segue.destination as? DatePickerViewController {
                datePickerVC.delegate = self
                datePickerVC.destinationDate = self.destinationDate
            }
        }
    }
}

extension TimeCircuitsViewController: DatePickerDelegate {
    func destinationDateWasChosen(date: Date) {
        guard let destinationDate = destinationDate else { return }
        destinationTimeLabel.text = dateFormatter.string(from: destinationDate)
    }
}
