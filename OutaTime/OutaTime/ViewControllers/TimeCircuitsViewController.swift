//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by Marissa Gonzales on 3/25/20.
//  Copyright © 2020 Joe Veverka. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {
    
    // Destination Outlets
    
    @IBOutlet weak var destinationTimeDetailLabel: UILabel!
    
    // Present Time Outlets
    
    @IBOutlet weak var presentTimeDetailLabel: UILabel!
    
    //Last Departed Outlets
    
    @IBOutlet weak var lastDepartedDetailLabel: UILabel!
    
    // Speed Outlets
    
    @IBOutlet weak var speedDetailLabel: UILabel!
    
    // Travel back (reset) button
    
    @IBAction func travelBackButton(_ sender: Any) {
        
        if(destinationTimeDetailLabel.text == "--- -- ----") {
            showSetDestinationAlert()
        } else {
            startTimer()
        }
    }
    
    // Date Formatter
    var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, yyyy"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        return formatter
    }()
    
    // Properties
    private var timer: Timer?
    private var destinationDate: Date?
    var currentSpeed = 0
    
    //View Did load
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        
        // Setting present time detail label to current date
        presentTimeDetailLabel.text = DateFormatter.localizedString(from: Date(), dateStyle: .long, timeStyle: .none)
    }
    
    private func showAlert() {
        let alert = UIAlertController(title: "Time Travel Successful", message: "Your new date is \(presentTimeDetailLabel.text!).", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    private func showSetDestinationAlert() {
        let alert = UIAlertController(title: "Set Destination Time!", message: "Your destination is \(destinationTimeDetailLabel.text!).", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    func updateViews() {
        
        let date = Date()
        presentTimeDetailLabel.text = dateFormatter.string(from: date)
        destinationTimeDetailLabel.text = "--- -- ----"
        lastDepartedDetailLabel.text = "--- -- ----"
        speedDetailLabel.text = "\(currentSpeed) MPH"
    }
    
    func startTimer() {
        cancelTimer()
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: updateSpeed(timer:))
    }
    
    func resetTimer() {
        cancelTimer()
    }
    
    func cancelTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    private func updateSpeed(timer: Timer) {
        
        if (currentSpeed < 88) {
            currentSpeed += 1
            speedDetailLabel.text = "\(currentSpeed) MPH"
        } else {
            cancelTimer()
            lastDepartedDetailLabel.text = presentTimeDetailLabel.text
            presentTimeDetailLabel.text = destinationTimeDetailLabel.text
            currentSpeed = 0
            speedDetailLabel.text = "\(currentSpeed) MPH"
            showAlert()
        }
    }
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "ModalDestinationDatePickerSegue" {
            if let datePickerVC = segue.destination as? DatePickerViewController {
                datePickerVC.delegate = self
                datePickerVC.destinationDate = self.destinationDate
            }
        }
    }
}
extension TimeCircuitsViewController: DatePickerDelegate {
    func destinationDateWasChosen(_ destinationDate: Date) {
        
        destinationTimeDetailLabel.text = dateFormatter.string(from: destinationDate)
        self.destinationDate = destinationDate
    }
}
