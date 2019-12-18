//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by user162867 on 12/18/19.
//  Copyright © 2019 user162867. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {
// LABELS:
    @IBOutlet weak var destTimeLabel: UILabel!
    @IBOutlet weak var presTimeLabel: UILabel!
    @IBOutlet weak var lastTimeDepartLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    
    @IBAction func travelBackPressed(_ sender: Any) {
        startTimer()
    }
// VARIABLES:
    
    var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd yyyy"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        return formatter
    }()
    
    var speed = 0
    var destinationDate: Date? = Date()
    var timer: Timer?
    
// FUNCTIONS:
    
    private func string(from date: Date) -> String {
        let returnValue = dateFormatter.string(from: date).uppercased()
        return returnValue
    }
    
    func startTimer() {
        if speed == 0 {
            timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block: updateSpeed(timer:))
        } else { speed = 0}
    }
    
    func resetTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    func updateSpeed(timer: Timer) {
        if speed < 88 {
            speed += 1
            speedLabel.text = "\(speed) mph"
            lastTimeDepartLabel.text = destTimeLabel.text
        } else if speed == 88 {
            presTimeLabel.text = destTimeLabel.text
            resetTimer()
        }
        showAlert()
    }
    
    private func showAlert() {
        let alert = UIAlertController(title: "Time Travel Successful", message: "You're new date is \(string(from: destinationDate!))", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presTimeLabel.text = string(from: Date())
        destTimeLabel.text = string(from: Date())
        lastTimeDepartLabel.text = "--- -- ---"

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ModalDestinationDatePickerSegue" {
            guard let datePickerVC = segue.destination as? DatePickerViewController else { return }
            datePickerVC.delegate = self
        }
    }

}

extension TimeCircuitsViewController: DatePickerDelegate {
       func destinationWasChosen(_ date: Date) {
           destinationDate = date
           destTimeLabel.text = string(from: date)
       }
   }
