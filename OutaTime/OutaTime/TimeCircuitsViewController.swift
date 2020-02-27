//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by Harmony Radley on 2/26/20.
//  Copyright © 2020 Harmony Radley. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {
    
    // MARK: - Outlets
    
    var speed = 0
    var timer: Timer?
    
    @IBOutlet weak var destinationLabel: UILabel!
    @IBOutlet weak var presentLabel: UILabel!
    @IBOutlet weak var departedLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    
    
    
    @IBOutlet weak var destinationTextField: UITextField!
    @IBOutlet weak var presentTimeTextField: UITextField!
    @IBOutlet weak var lastTimeTextField: UITextField!
    @IBOutlet weak var speedTextField: UITextField!
    
    @IBAction func travelBackTapped(_ sender: Any) {
        func startTimer() {
            timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: updateSpeed(timer:))
        }
    }
    
    func resetTimer() {
        timer?.invalidate()
        timer = nil
       }
    
    
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        textFields()
    }
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd, yyyy"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        return formatter
    }
    
    
    func textFields() {
        presentTimeTextField.text = dateFormatter.string(from: Date())
        speedTextField.text = "\(speed) MPH"
        lastTimeTextField.text = "--- -- ---"
    }
    
    
    
    func updateSpeed(timer: Timer) {
        if speed <= 88 {
            speed += 1
        } else {
            resetTimer()
            lastTimeTextField.text = presentTimeTextField.text
            presentTimeTextField.text = destinationTextField.text
            speed = 0
            alert(date: presentTimeTextField.text!)
        }
    }
    
    func alert(date: String) {
        let alert = UIAlertController(title: "Travel Success", message: "Your new date is \(date)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Done", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
    
    // MARK: - Navigation
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "ModalDestinationDatePickerSegue" {
            guard let datePickerVC = segue.destination as? DatePickerViewController else {
                return
            }
            datePickerVC.delegate = self
        }
    }
    
    
}


extension TimeCircuitsViewController: DatePickerDelegate {
    func destinationDateWasChosen(date: Date) {
        
    }
    
}


