//
//  TimeCircuitsViewController.swift
//  Outatime
//
//  Created by Andrew Ruiz on 8/21/19.
//  Copyright © 2019 Andrew Ruiz. All rights reserved.
//

import UIKit

enum CountdownState {
    case started
    case finished
    case reset
}

class TimeCircuitsViewController: UIViewController {

    @IBOutlet weak var destinationTime: UILabel!
    @IBOutlet weak var presentTime: UILabel!
    @IBOutlet weak var lastTimeDeparted: UILabel!
    @IBOutlet weak var speed: UILabel!
    
    var currentSpeed: Double = 0
    
    var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEE, MMM d, ''yy"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        return formatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let currentTime = dateFormatter.string(from: Date())
        
        presentTime.text = currentTime
        speed.text = "\(String(currentSpeed)) mph"
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
    
    private(set) var state: CountdownState?
    
    func resetTimer() {
        cancelTimer()
    }
    
    func cancelTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    func startTimer() {
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
    
    

    @IBAction func setDestinationTimeButtonPressed(_ sender: Any) {
    }
    
    @IBAction func travelBackButtonPressed(_ sender: Any) {
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
        destinationTime.text = dateFormatter.string(from: date)
    }
}
