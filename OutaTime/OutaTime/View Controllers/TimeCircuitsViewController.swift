//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by Norlan Tibanear on 6/9/20.
//  Copyright © 2020 Norlan Tibanear. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {
    
    // Outlets
    @IBOutlet var destinationLabel: UILabel!
    @IBOutlet var presentLabel: UILabel!
    @IBOutlet var departedLabel: UILabel!
    @IBOutlet var speedLabel: UILabel!
    
    var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, yyyy"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        return formatter
    }()
    
    // Variables
    var currentSpeed: Int = 0
    
    var timer: Timer?

    override func viewDidLoad() {
        super.viewDidLoad()

        updateViews()
    }
    
    func updateViews() {
        presentLabel.text = dateFormatter.string(from: Date())
        speedLabel.text = "\(String(currentSpeed)) MPH"
        departedLabel.text = "___ __ ____"
    }
    
    
    func starTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true, block: updateSpeed(timer:))
        
    }
    
    func resetTimer() {
        timer?.invalidate()
    }
    
    func updateSpeed(timer: Timer) {
        if currentSpeed < 88 {
            currentSpeed += 5
            speedLabel.text = String(currentSpeed)
        } else {
            departedLabel.text = presentLabel.text
            presentLabel.text = destinationLabel.text
            currentSpeed = 0
            speedLabel.text = "\(currentSpeed)"
            timer.invalidate()
            showAlert()
        }
    }
    
    
    private func showAlert() {
        let alert = UIAlertController(title: "Time Travel Successful", message: "Your new date is \(presentLabel.text ?? "")", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
    
    @IBAction func destinationTime(_ sender: UIButton) {
    }
    
    
    @IBAction func travelBack(_ sender: UIButton) {
        starTimer()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ModalDestinationDatePickerSegue" {
            if let pickerVC = segue.destination as? DatePickerViewController {
                pickerVC.delegate = self
            }
        }
    }
    
    
} // END


extension TimeCircuitsViewController: DatePickerDelegate {
    func destinationDateWasChosen(date: Date) {
        destinationLabel.text = dateFormatter.string(from: date)
    }
}
