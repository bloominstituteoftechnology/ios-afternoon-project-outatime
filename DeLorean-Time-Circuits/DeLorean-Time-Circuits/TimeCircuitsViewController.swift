//
//  ViewController.swift
//  DeLorean-Time-Circuits
//
//  Created by Kat Milton on 6/12/19.
//  Copyright © 2019 Kat Milton. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {

    @IBOutlet var destinationTimeLabel: UILabel!
    @IBOutlet var presentTimeLabel: UILabel!
    @IBOutlet var lastTimeDepartedLabel: UILabel!
    @IBOutlet var speedLabel: UILabel!
    
    
    
    var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd yyyy"
        formatter.timeZone = TimeZone.init(secondsFromGMT: 0)
        return formatter
    }()
    
    
    var currentSpeed = 0
    
    private let timeCircuit = TimeCircuit()
    
    let todaysDate = Date()
    let travelToDate = Date()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        presentTimeLabel.text = dateFormatter.string(from: todaysDate)
        speedLabel.text = "\(currentSpeed) MPH"
        lastTimeDepartedLabel.text = "--- -- ----"
        
//        updateViews()
        
    }
    
    @IBAction func setDestinationButtonPressed(_ sender: UIButton) {
        timeCircuit.resetTimer()
    }
    
    @IBAction func travelBackButtonPressed(_ sender: UIButton) {
        lastTimeDepartedLabel.text = dateFormatter.string(from: todaysDate)
        timeCircuit.startTimer()
    }
    
    func updateSpeed() {
        if currentSpeed < 88 {
            currentSpeed += 1
            speedLabel.text = String(currentSpeed)
        } else {
            lastTimeDepartedLabel.text = presentTimeLabel.text
            presentTimeLabel.text = destinationTimeLabel.text
            currentSpeed = 0
            showAlert()
        }
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "Time Travel Successful!", message: "Your new date is [\(String(describing: presentTimeLabel.text))]", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    func string(from duration: TimeInterval) -> String {
        let date = Date(timeIntervalSinceReferenceDate: duration)
        return dateFormatter.string(from: date)
    }
    
    func updateViews() {
        switch timeCircuit.state {
        case .started:
            speedLabel.text = string(from: 0)
        case .finished:
            speedLabel.text = string(from: 0)
        case .reset:
            speedLabel.text = string(from: timeCircuit.duration)
            
        }
        
    }
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ModalDestinationDatePickerSegue" {
            guard let datePickerVC = segue.destination as? DatePickerViewController else { return }
            datePickerVC.datePicker.date = todaysDate
        }
    
}

}
extension TimeCircuitsViewController: DatePickerDelegate {
    func dateDidSelect(from date1: Date, to date2: Date) -> Date {
        let travelTime = date2.timeIntervalSince(date1)
        let today = Date()
        if travelTime < 0 {
            return today
        } else {
            return today.addingTimeInterval(travelTime)
        }
    }
    
    func destinationDateWasChosen(date: Date) {
        let selectedDate = dateDidSelect(from: todaysDate, to: date)
        destinationTimeLabel.text = dateFormatter.string(from: selectedDate)
        updateViews()
    }
    
    
    
    
    
    
}

