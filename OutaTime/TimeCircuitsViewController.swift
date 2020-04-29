//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by Dawn Jones on 4/28/20.
//  Copyright © 2020 Dawn Jones. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {
    
    @IBOutlet weak var destinationLabel: UILabel!
    @IBOutlet weak var presentLabel: UILabel!
    @IBOutlet weak var lastLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    
    var currentSpeed = 0
    
    private var timer: Timer?
    
    private var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd, yyyy"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        return formatter
    }()
    
    @IBAction func travelTapped(_ sender: Any) {
        startTimer()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        presentLabel.text = dateFormatter.string(from: Date())
        speedLabel.text = "\(currentSpeed) MPH"
        lastLabel.text = "--- -- ----"
    }
    
    func startTimer() {
        resetTimer()
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: updateSpeed(timer:))
    }
    
    func resetTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    func updateSpeed(timer: Timer) {
        if currentSpeed != 88 {
            currentSpeed += 1
            speedLabel.text = String(currentSpeed)
        } else {
            resetTimer()
            lastLabel.text = presentLabel.text
            presentLabel.text = destinationLabel.text
            currentSpeed = 0
            showAlert()
        }
    }
    
    private func showAlert() {
        guard let presentTime = presentLabel.text else { return }
        let alert = UIAlertController(title: "Time Travel Successful", message: "Your new date is \(presentTime)", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let pickerVC = segue.destination as? DatePickerViewController {
            pickerVC.delegate = self
        }
    }

}

extension TimeCircuitsViewController: DatePickerDelegate {
    func destinationDateWasChosen(date: Date) {
        destinationLabel.text = dateFormatter.string(from: date)
    }
}
