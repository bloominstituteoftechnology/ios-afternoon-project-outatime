//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by Chad Rutherford on 11/13/19.
//  Copyright © 2019 Chad Rutherford. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {
    
    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
    // MARK: - Outlets
    @IBOutlet weak var destinationTimeLabel: UILabel!
    @IBOutlet weak var presentTimeLabel: UILabel!
    @IBOutlet weak var lastTimeDepartedLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    
    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
    // MARK: - Properties
    var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }()
    
    var currentSpeed = 0
    var speedString: String {
        return "\(currentSpeed) MPH"
    }
    var timer: Timer?
    
    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
    // MARK: - View Controller Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
    // MARK: - View Set-Up
    func updateViews() {
        presentTimeLabel.text = dateFormatter.string(from: Date())
        lastTimeDepartedLabel.text = "--- -- ----"
        speedLabel.text = speedString
    }
    
    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
    // MARK: - Helper Methods
    private func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: updateSpeedLabel(_:))
    }
    
    private func updateSpeedLabel(_ timer: Timer) {
        if currentSpeed == 88 {
            lastTimeDepartedLabel.text = presentTimeLabel.text
            presentTimeLabel.text = destinationTimeLabel.text
            currentSpeed = 0
            speedLabel.text = speedString
            resetTimer()
            showAlert()
        } else {
            currentSpeed += 1
            speedLabel.text = speedString
        }
    }
    
    private func resetTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    private func showAlert() {
        guard let presentTime = presentTimeLabel.text else { return }
        let alert = UIAlertController(title: "Time Travel Successful", message: "Your new date is \(presentTime)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
    
    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
    // MARK: - Actions
    @IBAction func travelBackTapped(_ sender: UIButton) {
        startTimer()
    }
    
    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case Segues.modalDestinationDatePickerSegue:
            guard let datePickerVC = segue.destination as? DatePickerViewController else { return }
            datePickerVC.delegate = self
        default:
            break
        }
    }
}

// --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
// MARK: - DatePickerDelegate Extension
extension TimeCircuitsViewController: DatePickerDelegate {
    func destinationDateWasChosen(_ date: Date) {
        destinationTimeLabel.text = dateFormatter.string(from: date)
    }
}
