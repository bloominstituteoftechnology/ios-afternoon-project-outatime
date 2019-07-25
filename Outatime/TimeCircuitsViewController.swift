//
//  TimeCircuitsViewController.swift
//  Outatime
//
//  Created by Andrew Ruiz on 7/24/19.
//  Copyright © 2019 Andrew Ruiz. All rights reserved.
//

import UIKit

enum CountdownState {
    case started
    case finished
    case reset
}

class TimeCircuitsViewController: UIViewController {

    // Outlets
    @IBOutlet weak var destinationTime: UILabel!
    @IBOutlet weak var presentTime: UILabel!
    @IBOutlet weak var lastTimeDeparted: UILabel!
    @IBOutlet weak var speed: UILabel!
    @IBOutlet weak var setDestinationTime: UIButton!
    
    // Properties
    var currentSpeed: Double = 0
    
    // Date Formatter
    var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEE, MMM d, ''yy"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        return formatter
    }()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Set current date/time
        let currentTime = dateFormatter.string(from: Date())
        presentTime.text = currentTime
        
        // Set the speed
        speed.text = "\(String(currentSpeed)) mph"
        
        // Set the last time departed
        lastTimeDeparted.text = "--- -- ----"

    }
    
    private func showAlert() {
        
        var unwrappedAlert: String = ""
        if let unwrappedPresentTime = presentTime.text {
            unwrappedAlert = unwrappedPresentTime
        }
        let alert = UIAlertController(title: "Time travel successful.", message: "Your new date is \(unwrappedAlert).", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
    private var timer: Timer?
    
    // We had to make this an optionaltype to get rid of the error, but I don't know what the effect will be.
    private(set) var state: CountdownState?
    
    func resetTimer() {
        // stopDate = nil
        cancelTimer()
        // state = .reset
    }
    
    func cancelTimer() {
        // We must invalidate a timer, or it will continue to run even if we
        // start a new timer
        timer?.invalidate()
        timer = nil
    }
    
    func startTimer() {
        // Cancel timer before starting new timer
        cancelTimer()
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: updateSpeed(timer:))
    }
    
    func updateSpeed(timer: Timer) {
        
        if currentSpeed != 88 {
            currentSpeed = currentSpeed + 1
            speed.text = String(currentSpeed) + "mph"
        } else if currentSpeed == 88 {
            cancelTimer()
            lastTimeDeparted.text = presentTime.text
            presentTime.text = destinationTime.text
            currentSpeed = 0
            showAlert()
        }
    }
    
    
    
    #warning("What is this doing?")
    @IBAction func setDestinationButtonTapped(_ sender: Any) {
        
    }
    
    @IBAction func travelBackButtonTapped(_ sender: Any) {
        
        startTimer()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destination = segue.destination as? DatePickerViewController {
            destination.delegate = self
        }
        
        
    }
    
}

extension TimeCircuitsViewController: DatePickerDelegate {
    
    func destinationDateWasChosen(date: Date) {
        print("Hello")
        destinationTime.text = dateFormatter.string(from: date)
    }
}


