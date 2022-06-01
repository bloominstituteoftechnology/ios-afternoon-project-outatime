//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by Waseem Idelbi on 5/30/22.
//

import UIKit

class TimeCircuitsViewController: UIViewController {
    
//MARK: - Properties
    var dateFormatter: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .none
        dateFormatter.dateStyle = .medium
        return dateFormatter
    }
    var currentSpeed = 0
    var timer: Timer!
    // Presentable Alert Controllers
    var successAlert: UIAlertController {
        let title = "Time Travel Successful!"
        let message = "Your new date is \(presentTimeLabel.text!)"
        let okButton = UIAlertAction(title: "Ok", style: .default)
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(okButton)
        return alert
    }
    
//MARK: - IBOutlets
    @IBOutlet weak var destinationLabel: UILabel!
    @IBOutlet weak var presentTimeLabel: UILabel!
    @IBOutlet weak var lastTimeDepartedLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var travelBackButton: UIButton!
    @IBOutlet weak var setDestinationButton: UIButton!
    
//MARK: - IBActions
    @IBAction func travelBackButtonTapped(_ sender: UIButton) {
        startTimer()
    }
    
//MARK: - Methods
    // Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presentTimeLabel.text = dateFormatter.string(from: Date())
        speedLabel.text = "\(currentSpeed) MPH"
        lastTimeDepartedLabel.text = "--- -- ----"
    }
    // Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ModalDestinationDatePickerSegue" {
            guard let destinationVC = segue.destination as? DatePickerViewController else { return }
            destinationVC.delegate = self
            
        }
    }
    
//MARK: - Speed and Timer methods
    // Start Timer
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateSpeed), userInfo: nil, repeats: true)
    }
    // Reset timer
    func resetTimer() {
        timer.invalidate()
        timer = nil
    }
    // updateSpeed
    @objc func updateSpeed() {
        if currentSpeed < 88 {
            travelBackButton.isEnabled = false
            setDestinationButton.isEnabled = false
            currentSpeed += 1
            speedLabel.text = "\(currentSpeed) MPH"
        } else {
            resetTimer()
            lastTimeDepartedLabel.text = presentTimeLabel.text
            presentTimeLabel.text = destinationLabel.text
            currentSpeed = 0
            speedLabel.text = "\(currentSpeed) MPH"
            travelBackButton.isEnabled = true
            setDestinationButton.isEnabled = true
            present(successAlert, animated: true)
        }
    }

}

//MARK: - Extensions
extension TimeCircuitsViewController: DatePickerDelegate {
    func destinationDateWasChosen(date: Date) {
        destinationLabel.text = dateFormatter.string(from: date)
    }
}
