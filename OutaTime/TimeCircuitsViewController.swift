//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by Nichole Davidson on 1/29/20.
//  Copyright © 2020 Nichole Davidson. All rights reserved.
//

import UIKit

enum CountdownState {
    case started // countdown is active and counting down
    case finished // countdown has reached 0 and is not active
    case reset // countdown is at initial time value and not active
}


class TimeCircuitsViewController {
    
    @IBOutlet weak var destinationTickerLabel: UILabel!
    @IBOutlet weak var presentTickerLabel: UILabel!
    @IBOutlet weak var lastDepartedTickerLabel: UILabel!
    @IBOutlet weak var speedTickerLabel: UILabel!
    
     private var timer: Timer?
    
    private var stopDate: Date?
    var duration: TimeInterval
    private(set) var state: CountdownState
    
    init() {
        timer = nil
        stopDate = nil
        duration = 0
        state = .reset
    }
    
    var present = presentTickerLabel.text
    
//    func start() {
//        cancelTimer()
//        timer = Timer.scheduledTimer(withTimeInterval: 0.03, repeats: true, block: updateTimer(timer:))
//        stopDate = Date(timeIntervalSinceNow: duration)
//        state = .started
//    }
    
     var dateFormatter: DateFormatter = {
          let formatter = DateFormatter()
          formatter.dateFormat = "MMM d, yyyy"
          formatter.timeZone = TimeZone(secondsFromGMT: 0)
          return formatter
    }()
    
    func resetTimer() {
        stopDate = nil
        cancelTimer()
        state = .reset
    }
    
    func cancelTimer() {
           timer?.invalidate()
           timer = nil
       }
    
    func updateSpeed() {
     
        var speed = currentSpeed
        
        if currentSpeed < 88 {
            speed += 1
            speedTickerLabel.text = String(currentSpeed)
        } else {
            cancelTimer()
            lastDepartedTickerLabel = presentTickerLabel
            presentTickerLabel = destinationTickerLabel
            speedTickerLabel = nil
            showAlert()
        }
        
        
    }
    func startTimer() {
        cancelTimer()
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: updateSpeed.fire())
//        stopDate = Date(timeIntervalSinceNow: duration)
//        state = .started
    }
    
    @IBAction func travelBackTapped(_ sender: UIButton) {
        startTimer()
    }
}
    func viewDidLoad() {
        
    }

     private func showAlert() {
    
        let alert = UIAlertController(title: "Time Travel Successful", message: "Your new date is \(presentTickerLabel)", preferredStyle: .alert)
    
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
    
        alert.addAction(okAction)
    
        present(alert, animated: true, completion: nil)
  }
    var currentSpeed = 0
    var speedTickerLabel = "\(currentSpeed) MPH"
    let lastDepartedTickerLabel = "___ __ ____"
    
    func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           if segue.identifier == "ModalDestinationDatePickerSegue" {
               guard let addDestinationVC = segue.destination as? TimeCircuitsViewController else { return }
                   addDestinationVC.delegate = self
           }
       }
    
    func destinationDateWasChosen() {
        let destinationTickerLabel = dateFormatter.dateFormat
    }


extension TimeCircuitsViewController: DatePickerDelegate {
   
    func destinationDateWasChosen(_: Date) {
        
    }
}
