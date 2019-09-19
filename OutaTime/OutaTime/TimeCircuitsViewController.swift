//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by Jesse Ruiz on 9/18/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var destinationTimeLabel: UILabel!
    @IBOutlet weak var presentTimeLabel: UILabel!
    @IBOutlet weak var timeDepartedLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd yyyy"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        return formatter
    }
    
    var currentSpeed = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let date = Date(timeIntervalSinceNow: 50)
        dateFormatter.locale = Locale(identifier: "en_US")
        presentTimeLabel.text = dateFormatter.string(from: date)
        speedLabel.text = "\(currentSpeed) MPH"
        timeDepartedLabel.text = "--- -- ----"
        
//        var newDate = destinationDateWasChosen(date: date)
        destinationTimeLabel.text = dateFormatter.string(from: Date())
    }
    
    // MARK: - Actions
    
    var timer: Timer?
    
    @IBAction func travelBackButtonTapped(_ sender: UIButton) {
        func startTimer() {
            Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: updateSpeedLabel(timer:))
        }
        startTimer()
    }
    
    func resetTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    func updateSpeedLabel(timer: Timer) {
        if currentSpeed != 88 {
            currentSpeed += 1
            speedLabel.text = "\(currentSpeed) MPH"
        } else {
            resetTimer()
            timeDepartedLabel.text = presentTimeLabel.text
            presentTimeLabel.text = destinationTimeLabel.text
            currentSpeed = 0
            let alert = UIAlertController(title: "Time Travel Successful!", message: "Your new date is \(presentTimeLabel.text).", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ModalDestinationDatePickerSegue" {
            if let addDate = segue.destination as? DatePickerViewController {
                addDate.delegate = self
            }
        }
    }
}

extension TimeCircuitsViewController: DatePickerDelegate {
    func destinationDateWasChosen(date: Date) {
        destinationTimeLabel.text = dateFormatter.string(from: date)
    }
}














