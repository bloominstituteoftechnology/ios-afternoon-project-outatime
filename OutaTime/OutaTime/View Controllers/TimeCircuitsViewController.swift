//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by Jon Bash on 2019-10-16.
//  Copyright © 2019 Jon Bash. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {
    
    // MARK: Properties
    
    var speed = 0
    
    var destinationTime: Date = Date()
    var presentTime: Date = Date()
    var lastTimeDeparted: Date?
    
    var timer: Timer?
    
    var dateFormatter = DateFormatter()
    // computed version: (less CPU-efficient, though it probably doesn't matter)
//    var dateformatter: DateFormatter {
//        let formatter = DateFormatter()
//        formatter.dateFormat = "HH:mm:ss.SS"
//        formatter.timeZone = TimeZone(secondsFromGMT: 0)
//        return formatter
//    }
    var nilTimeString = "--- -- ----"
    var speedString: String {
        return "\(speed) MPH"
    }
    
    // MARK: Labels
    @IBOutlet weak var destinationTimeLabel: UILabel!
    @IBOutlet weak var presentTimeLabel: UILabel!
    @IBOutlet weak var lastDepartedTimeLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    
    // MARK: Methods

    override func viewDidLoad() {
        super.viewDidLoad()

        // set up date formatter
        dateFormatter.dateFormat = "MMM dd yyyy"
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        
        // set UI labels to defaults
        presentTimeLabel.text = dateFormatter.string(from: presentTime).uppercased()
        speedLabel.text = "\(speed) MPH"
        lastDepartedTimeLabel.text = nilTimeString
        
    }
    
    // MARK: Private Methods
    
    private func startTimer() {
        timer = Timer.scheduledTimer(
            withTimeInterval: 0.1,
            repeats: true,
            block: updateSpeed(_:)
        )
    }
    
    private func updateSpeed(_ timer: Timer) {
        if !(speed >= 88) {
            speed += 1
            speedLabel.text = speedString
        } else {
            resetTimer()
            guard let presentTimeString = presentTimeLabel.text,
                let destinationTimeString = destinationTimeLabel.text
                else { return }
            lastDepartedTimeLabel.text = presentTimeString
            presentTimeLabel.text = destinationTimeString
            speed = 0
            speedLabel.text = speedString
            
            let alert = UIAlertController(
                title: "Time travel successful",
                message: "Your new date is \(destinationTimeString).",
                preferredStyle: .alert
            )
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }
    
    private func resetTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    
    // MARK: UI Actions

    @IBAction func setDestinationTapped(_ sender: Any) {}
    
    @IBAction func travelBackTapped(_ sender: Any) {
        startTimer()
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DestinationDatePickerSegue" {
            guard let datePickerVC = segue.destination as? DatePickerViewController
                else { return }
            
            datePickerVC.delegate = self
        }
    }
}

extension TimeCircuitsViewController: DatePickerDelegate {
    func destinationDateWasChosen(_ destinationDate: Date) {
        destinationTimeLabel.text = dateFormatter.string(from: destinationDate).uppercased()
    }
}
