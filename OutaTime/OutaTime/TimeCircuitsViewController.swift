//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by Blake Andrew Price on 7/24/19.
//  Copyright © 2019 Blake Andrew Price. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {
    
    var timer: Timer?
    
    @IBOutlet weak var destinationTimeLabel: UILabel!
    @IBOutlet weak var presentTimeLabel: UILabel!
    @IBOutlet weak var lastTimeDepartedLabel: UILabel!
    @IBOutlet weak var speedMPHLabel: UILabel!
    @IBAction func travelBackButtonTapped(_ sender: UIButton) {
        startTimer()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presentTimeLabel.text = dateFormatter.string(from: currentDateTime)
        speedMPHLabel.text = String("\(currentSpeed) MPH")
        lastTimeDepartedLabel.text = "--- -- ----"
    }
    
    
    var currentSpeed: Int = 0
    let currentDateTime = Date()
    var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd yyyy"
        formatter.timeZone = TimeZone.current
        return formatter
    }()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ModalDestinationDatePickerSegue" {
            if let datePickedVC = segue.destination as? DatePickerViewController {
                datePickedVC.delegate = self
            }
        }
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
            speedMPHLabel.text = String(currentSpeed)
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
    
}


extension TimeCircuitsViewController: DatePickerDelegate {
    func destinationDateWasChosen(date: Date) {
        destinationTimeLabel.text = dateFormatter.string(from: date)
    }
    
    
}
