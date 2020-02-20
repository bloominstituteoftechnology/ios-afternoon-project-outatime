//
//  TimeCircuitViewController.swift
//  OutaTime
//
//  Created by Breena Greek on 2/18/20.
//  Copyright © 2020 Breena Greek. All rights reserved.
//

import UIKit

class TimeCircuitViewController: UIViewController {
    
    
    // MARK IBOutlets
    
    @IBOutlet weak var destinationTimeLabel: UILabel!
    @IBOutlet weak var presentTimeLabel: UILabel!
    @IBOutlet weak var lastTimeDepartedLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    
    // MARK IBActions
    
    @IBAction func travelBackButton(_ sender: Any) {
        startTimer()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    // Properties
  var currentSpeed = 0
  var timer: Timer?
    
    var dateFormatter : DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd yyyy"
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        return dateFormatter
    }
    
    
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block: updateSpeed(timer:))
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
            lastTimeDepartedLabel.text = presentTimeLabel.text
            presentTimeLabel.text = destinationTimeLabel.text
            currentSpeed = 0
            
            showAlert()
        }
        
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "Time Travel Success", message: "You're new date is ", preferredStyle: .alert)
    let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
    alert.addAction(okAction)
    
    self.present(alert, animated: true, completion: nil)
}
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ModalDestinationDatePickerSegue" {
            let addDateVC = segue.destination as! DatePickerViewController
            
            addDateVC.delegate = self
        }
    }
}

extension TimeCircuitViewController: DatePickerDelegate {
    func destinationDateWasChosen(date: Date) {
        
    }
    
    
}

