//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by Bronson Mullens on 4/28/20.
//  Copyright © 2020 Bronson Mullens. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var destinationTimeLabel: UILabel!
    @IBOutlet weak var presentTimeLabel: UILabel!
    @IBOutlet weak var lastTimeDepartedLabel: UILabel!
    @IBOutlet weak var mphLabel: UILabel!
    
    // MARK: - IBActions
    @IBAction func travelBackButtonPressed(_ sender: Any) {
        startTimer()
    }
    
    var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, yyyy"
        formatter.timeZone = TimeZone.init(secondsFromGMT: -25200) //-25200 is Pacific
        return formatter
    }()
    
    var currentSpeed: Int = 0
    
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    func updateViews() {
        presentTimeLabel.text = dateFormatter.string(from: Date())
        mphLabel.text = "\(String(currentSpeed)) MPH"
        lastTimeDepartedLabel.text = "--- -- ----"
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: updateSpeed(timer:))
    }
    
    func resetTimer() {
        timer?.invalidate()
    }
    
    func updateSpeed(timer: Timer) {
        if currentSpeed < 88 {
            currentSpeed += 1
            mphLabel.text = String(currentSpeed)
        } else {
            resetTimer()
            lastTimeDepartedLabel.text = presentTimeLabel.text
            presentTimeLabel.text = destinationTimeLabel.text
            currentSpeed = 0
            mphLabel.text = "\(currentSpeed)"
            alert()
        }
    }
    
    func alert() {
        let alert = UIAlertController(title: "Time Travel Successful", message: "Your new date is \(presentTimeLabel.text ?? "Unknown")", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let timeVC = segue.destination as? DatePickerViewController {
            timeVC.delegate = self
        }
    }
    
}

extension TimeCircuitsViewController: DatePickerDelegate {
    func destinationDateWasChosen(date: Date) {
        destinationTimeLabel.text = dateFormatter.string(from: date)
    }
    
}
