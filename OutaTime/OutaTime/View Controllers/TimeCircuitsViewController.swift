//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by David Wright on 12/10/19.
//  Copyright © 2019 David Wright. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var destinationTimeLabel: UILabel!
    @IBOutlet weak var presentTimeLabel: UILabel!
    @IBOutlet weak var lastTimeDepartedLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    
    // MARK: - Properties
    
    var currentSpeed: Int = 0
    
    var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd yyyy"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        return formatter
    }()
    
    private var timer: Timer?
    
    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        initializeViews()
    }
    
    // MARK: - IBActions
    
    @IBAction func travelBackButtonTapped(_ sender: UIButton) {
        startTimer()
    }
    
    // MARK: - Private Methods
    
    private func initializeViews() {
        lastTimeDepartedLabel.text = "JAN O1 2000"
        presentTimeLabel.text = dateFormatter.string(from: Date())
        lastTimeDepartedLabel.text = "--- -- ----"
        speedLabel.text = "0 MPH"
    }
    
    private func updateSpeedLabel() {
        speedLabel.text = "\(currentSpeed) MPH"
    }
    
    private func startTimer() {
        resetTimer()
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: updateSpeed(timer:))
    }
    
    private func resetTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    private func updateSpeed(timer: Timer) {
        if currentSpeed < 88 {
            currentSpeed += 1
            updateSpeedLabel()
        } else {
            resetTimer()
            currentSpeed = 0

            lastTimeDepartedLabel.text = presentTimeLabel.text
            presentTimeLabel.text = destinationTimeLabel.text

            showAlert()
            updateSpeedLabel()
        }
    }
    
    private func showAlert() {
        let alert = UIAlertController(title: "Time Travel Successful", message: "Your new date is \(presentTimeLabel.text ?? "unkown").", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        if segue.identifier == "ModalDestinationDatePickerSegue",
            let datePickerVC = segue.destination as? DatePickerViewController {
            // Pass the selected object to the new view controller.
            datePickerVC.delegate = self
        }
    }
    
}

// MARK: - Extensions

extension TimeCircuitsViewController: DatePickerDelegate {
    func destinationDateWasChosen(date: Date) {
        destinationTimeLabel.text = dateFormatter.string(from: date)
    }
}
