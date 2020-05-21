//
//  TimeCircuitsViewController.swift
//  Outatime
//
//  Created by Bryan Cress on 5/20/20.
//  Copyright © 2020 Bryan Cress. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {
    
    var dateFormatter: DateFormatter {
    let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd, yyyy"
        dateFormatter.timeZone = TimeZone(secondsFromGMT: -18000)
        return dateFormatter
    }
    
    var currentSpeed = 0
    
    var timer: Timer?
    
    // MARK: - Outlets
    @IBOutlet weak var destinationTimeLabel: UILabel!
    @IBOutlet weak var presentTimeLabel: UILabel!
    @IBOutlet weak var lastTimeDeparted: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    @IBAction func travelBackButton(_ sender: UIButton) {
        startTimer()
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "Time travel successful!", message: "Your new date is \(destinationTimeLabel.text ?? " ") ", preferredStyle: .alert)
                 
                 let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                 
                 alert.addAction(okAction)
                 present(alert, animated: true, completion: nil)
             }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presentTimeLabel.text = dateFormatter.string(from: Date())
        speedLabel.text = String("\(currentSpeed) MPH")
        lastTimeDeparted.text = String("--- -- ----")
    }
      
    
    private func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: updateSpeed(timer: ))
    }

    
    private func resetTimer() {
        timer?.invalidate()
        timer = nil
        speedLabel.text = String("\(currentSpeed) MPH")
       showAlert()
    }

    
    private func updateSpeed(timer: Timer) {
        if currentSpeed <= 88 {
            currentSpeed += 1
            speedLabel.text = String("\(currentSpeed) MPH")
        } else {
            resetTimer()
            
            lastTimeDeparted.text = presentTimeLabel.text
            presentTimeLabel.text = destinationTimeLabel.text
            
            currentSpeed = 0
            speedLabel.text = String("\(currentSpeed) MPH")
        }
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            // Get the new view controller using segue.destination.
            if segue.identifier == "ModalDestinationDatePickerSegue" {
            // Pass the selected object to the new view controller.
                guard let datePickerVC = segue.destination as? DatePickerViewController else { return }
                datePickerVC.delegate = self
        }
    }
}

    // MARK: - Functions

extension TimeCircuitsViewController: DatePickerDelegate {
    func destinationDateWasChosen(date: Date) {
        destinationTimeLabel.text = dateFormatter.string(from: date)
    }
}
