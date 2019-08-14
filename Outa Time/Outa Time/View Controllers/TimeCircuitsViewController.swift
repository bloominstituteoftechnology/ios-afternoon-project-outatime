//
//  TimeCircuitsViewController.swift
//  Outa Time
//
//  Created by Dillon P on 8/13/19.
//  Copyright © 2019 Dillon P. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {

    @IBOutlet weak var destinationTimeLabel: UILabel!
    @IBOutlet weak var presentTimeLabel: UILabel!
    @IBOutlet weak var lastTimeDepartedLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    
    
    var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd, yyyy"
        formatter.timeZone = TimeZone(secondsFromGMT: -25200)
        return formatter
    }()
    
    var currentSpeed = 0
    
    var timer: Timer?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "ModalDestinationDatePickerSegue" {
            guard let datePickerVC = segue.destination as? DatePickerViewController else { return }
            datePickerVC.delegate = self
        }
    }
    
    
    @IBAction func travelBackTapped(_ sender: Any) {
        startTimer()
    }
    
    
    private func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { (timer) in
            self.updateSpeed()
        }
    }
    
    private func resetTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    func updateSpeed() {
        while currentSpeed < 88 {
            currentSpeed += 1
            speedLabel.text = "\(currentSpeed) MPH"
        }
        lastTimeDepartedLabel.text = presentTimeLabel.text
        presentTimeLabel.text = destinationTimeLabel.text
        currentSpeed = 0
        guard let presentTime = presentTimeLabel.text else { return }
        let alert = UIAlertController(title: "Time Travel Successful", message: "Your new date is \(presentTime)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true)
        resetTimer()
    }
    
    private func updateViews() {
        destinationTimeLabel.text = "SELECT DATE"
        presentTimeLabel.text = dateFormatter.string(from: Date())
        speedLabel.text = "\(currentSpeed) MPH"
        lastTimeDepartedLabel.text = "--- -- ----"
    }
    
}


extension TimeCircuitsViewController: DatePickerDelegate {
    func destinationWasChosen(date: Date) {
        destinationTimeLabel.text = dateFormatter.string(from: date)
    }
}
