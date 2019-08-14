//
//  ViewController.swift
//  OutaTime
//
//  Created by Jessie Ann Griffin on 8/12/19.
//  Copyright © 2019 Jessie Griffin. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {

    // MARK: Properties
    @IBOutlet weak var destinationTimeLabel: UILabel!
    @IBOutlet weak var presentTimeLabel: UILabel!
    @IBOutlet weak var lastTimeLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    
    var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd yyyy"
        //formatter.timeZone = TimeZone(secondsFromGMT: -5)
        return formatter
    }()
    
    var speed = 0
    private var timer: Timer?
    private var stopDate: Date?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //let presentDay = Date()
        presentTimeLabel.text = dateFormatter.string(from: Date())
        speedLabel.text = "\(speed) MPH"
        lastTimeLabel.text = "--- -- ----"
    }

     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ModalDestinationDatePickerSegue" {
            if let datePickerVC = segue.destination as? DatePickerViewController {
                datePickerVC.delegate = self
            }
        }
    }
    
    @IBAction func travelBackTapped(_ sender: Any) {
        startTimer()
    }
}

extension TimeCircuitsViewController: DatePickerDelegate {
    func destinationDateWasChosen(_ date: Date) {
        destinationTimeLabel.text = dateFormatter.string(from: date)
    
    }
}

// timing methods
extension TimeCircuitsViewController {
    
    func startTimer() {
        // Cancel timer before starting new timer
        cancelTimer()
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: updateSpeed(timer:))
    }
    
    func resetTimer() {
        stopDate = nil
        cancelTimer()
        //state = .reset
    }
    
    func cancelTimer() {
        // We must invalidate a timer, or it will continue to run even if we
        // start a new timer
        timer?.invalidate()
        timer = nil
    }
    private func showAlert() {
        guard let destination = destinationTimeLabel.text else { return }
        let alert = UIAlertController(title: "Time Travel Successful!", message: "Your new date is \(destination)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
    // called each time the timer object fires
    private func updateSpeed(timer: Timer) {
        
        if speed < 88, speed >= 0 {
            speed += 1
            speedLabel.text = "\(speed) MPH"
        } else {
            cancelTimer()
            lastTimeLabel.text = presentTimeLabel.text
            presentTimeLabel.text = destinationTimeLabel.text
            speed = 0
            showAlert()
        }
    }
}
