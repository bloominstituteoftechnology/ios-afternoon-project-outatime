//
//  TimeCurcuitsViewController.swift
//  OutaTime
//
//  Created by Dennis on 9/18/19.
//  Copyright © 2019 LambdaSchool. All rights reserved.
//

import UIKit

class TimeCurcuitsViewController: UIViewController {
   
    @IBOutlet weak var DTimeLabel: UILabel!
    @IBOutlet weak var PTimeLabel: UILabel!
    @IBOutlet weak var lastTimeDepartedLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    
    var currentSpeed = 0
    var timer: Timer?
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, yyyy"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        return formatter
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
        }
    
    
    func updateView() {
        speedLabel.text? = "\(currentSpeed) MPH"
        lastTimeDepartedLabel.text? = "--- -- ----"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DatePickerSegue" {
            guard let datePickerVC = segue.destination as? DatePickerViewController else { return }
            datePickerVC.delegate = self
        }
    }
   
    
    
    @IBAction func travelBackButtonTapped(_ sender: UIButton) {
        startTimer()
    }
    
    func startTimer() {
        resetTimer()
        timer = Timer.scheduledTimer(withTimeInterval: 0.03, repeats: true, block: updateSpeed(timer:))
    }
    func resetTimer() {
        timer?.invalidate()
        timer = nil
    }
    func updateSpeed(timer: Timer) {
        if currentSpeed < 88 {
            currentSpeed += 1
            speedLabel.text = String(currentSpeed)
        } else {
            resetTimer()
            lastTimeDepartedLabel.text = PTimeLabel.text
            PTimeLabel.text = DTimeLabel.text
            currentSpeed = 0
            showAlert()
        }
        
    }
    
    private func showAlert() {
        let alert = UIAlertController(title: "Time Travel Successful", message: "Your new date is \(PTimeLabel.text ?? "Error")", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}

extension TimeCurcuitsViewController: DatePickerDelegate {
    func destinationDateWasChosen(date: Date) {
       
        let date = dateFormatter.string(from: date)
        DTimeLabel.text = date
    }
    
    
}
