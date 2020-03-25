//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by Shawn James on 2/26/20.
//  Copyright © 2020 Shawn James. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {

    // MARK: - PROPERTIES
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd yyyy"
        return formatter
    }()
    var currentSpeed = 0
    private var timer: Timer?
    
    // MARK: - OUTLETS
    @IBOutlet weak var destinationTimeLabel: UILabel!
    @IBOutlet weak var presentTimeLabel: UILabel!
    @IBOutlet weak var lastTimeDepartedLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var setDestinationButton: UIButton!
    @IBOutlet weak var travelBackButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fadeIn(label: presentTimeLabel)
        presentTimeLabel.text = dateFormatter.string(from: Date())
        speedLabel.text = String("\(currentSpeed) MPH")
        UIView.animate(withDuration: 3) { self.setDestinationButton.alpha = 1 }
    }
    
    // MARK: - ACTIONS
    @IBAction func travelBackButtonTapped(_ sender: UIButton) {
        startTimer()
    }
    
    // MARK: - NAVIGATION
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ModalDestinationDatePickerSegue" {
            // Get the new view controller using segue.destination.
            guard let datePickerViewController = segue.destination as? DatePickerViewController else { return }
            // Pass the selected object to the new view controller.
            datePickerViewController.delegate = self
        }
    }
    
    // MARK: - Methods
    
    private func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: updateSpeed(timer: ) )
        fadeOut(button: travelBackButton)
    }
    
    private func resetTimer() {
        timer?.invalidate()
        timer = nil
        fadeIn(button: setDestinationButton)
        fadeOut(label: destinationTimeLabel)
        fadeIn(label: lastTimeDepartedLabel)
    }
    
    private func updateSpeed(timer: Timer) {
        if currentSpeed <= 87 {
            fadeIn(label: speedLabel)
            currentSpeed += 1
            fadeOut(label: presentTimeLabel)
            speedLabel.text = "\(currentSpeed) MPH"
        } else if currentSpeed >= 88 {
            resetTimer()
//            Update the value of the lastTimeDepartedLabel with the value from the presentTimeLabel.
            fadeIn(label: lastTimeDepartedLabel)
            lastTimeDepartedLabel.text = presentTimeLabel.text
//            Update the value of the presentTimeLabel with the value from the destinationTimeLabel.
            fadeIn(label: presentTimeLabel)
            presentTimeLabel.text = destinationTimeLabel.text
//            Reset the value of the current speed variable to 0.
            fadeOut(label: speedLabel)
            currentSpeed = 0
//            Show an alert view with a title "Time Travel Successful" and a message that says "You're new date is [insert present time here].".
            guard let date = presentTimeLabel.text else { return }
            showAlert(date: date)
        }
    }
    
    private func showAlert(date: String) {
        let alert = UIAlertController(title: "Travel Success", message: "Your new date is \(date)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Done", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
}

// MARK: - DatePickerDelegate
extension TimeCircuitsViewController: DatePickerDelegate {
    func destinationDateWasChosen(date: Date) {
        fadeIn(label: destinationTimeLabel)
        fadeIn(button: travelBackButton)
        fadeOut(button: setDestinationButton)
        fadeOut(label: lastTimeDepartedLabel)
        destinationTimeLabel.text = dateFormatter.string(from: date)
    }
    
}

// MARK: - Animations
extension TimeCircuitsViewController {
    func fadeIn(label: UILabel) {
        UIView.animate(withDuration: 2) { label.alpha = 1 }
    }
    func fadeOut(label: UILabel) {
        UIView.animate(withDuration: 2) { label.alpha = 0 }
    }
    func fadeIn(button: UIButton) {
        UIView.animate(withDuration: 2) { button.alpha = 1 }
    }
    func fadeOut(button: UIButton) {
        UIView.animate(withDuration: 2) { button.alpha = 0 }
    }
}
