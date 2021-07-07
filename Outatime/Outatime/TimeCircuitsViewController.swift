//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by Vici Shaweddy on 8/13/19.
//  Copyright © 2019 Vici Shaweddy. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {
    
    @IBOutlet weak var destinationTimeLabel: UILabel!
    @IBOutlet weak var presentTimeLabel: UILabel!
    @IBOutlet weak var lastTimeDepartedLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    
    var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d yyyy"
        return formatter
    }()
    
    private var currentSpeed = 0
    private var timer: Timer?
    private var startDate: Date?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.updateViews()
    }
    
    @IBAction func travelBackButton(_ sender: Any) {
        self.startTimer()
    }
    
    
    private func showAlert() {
        let alert = UIAlertController(title: "Time Travel Successful", message: "You're new date is \(self.presentTimeLabel.text ?? "").", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    private func updateViews() {
        let date = Date()
        self.presentTimeLabel.text = dateFormatter.string(from: date).uppercased()
        self.speedLabel.text = "\(String(currentSpeed)) MPH"
        self.lastTimeDepartedLabel.text = "___ __ ____"
    }
    
    private func startTimer() {
        self.resetTimer()
        self.timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: updateSpeed(timer:))
    }
    
    private func resetTimer() {
        self.timer?.invalidate()
        self.timer = nil
    }
    
    private func updateSpeed(timer: Timer) {
        if self.currentSpeed < 88 {
            self.currentSpeed += 1
            self.speedLabel.text = "\(self.currentSpeed) MPH"
        } else {
            self.resetTimer()
            self.lastTimeDepartedLabel.text = self.presentTimeLabel.text
            self.presentTimeLabel.text = self.destinationTimeLabel.text
            self.currentSpeed = 0
            self.speedLabel.text = "\(self.currentSpeed) MPH"
            self.showAlert()
        }
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
}

extension TimeCircuitsViewController: DatePickerDelegate {
    func destinationDateWasChosen(date: Date) {
        self.destinationTimeLabel.text = self.dateFormatter.string(from: date).uppercased()
    }

}
