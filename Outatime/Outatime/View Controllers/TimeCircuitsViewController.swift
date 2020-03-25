//
//  TimeCircuitsViewController.swift
//  Outatime
//
//  Created by Harmony Radley on 3/25/20.
//  Copyright © 2020 Harmony Radley. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {
    
    @IBOutlet weak var destinationTextField: UITextField!
    @IBOutlet weak var presentTimeTextField: UITextField!
    @IBOutlet weak var lastTimeTextField: UITextField!
    @IBOutlet weak var speedTextField: UITextField!
    
    
    var speed = 0
    var timer: Timer?
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd, yyyy"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        return formatter
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        destinationTextField.text = dateFormatter.string(from: Date())
        presentTimeTextField.text = dateFormatter.string(from: Date())
        speedTextField.text = "\(speed) MPH"
        lastTimeTextField.text = "--- -- ---"
    }
    
    @IBAction func travelBackButtonTapped(_ sender: Any) {
        startTimer()
        navigationController?.popViewController(animated: true)
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
        if speed <= 88 {
            speed += 1
            speedTextField.text = "\(speed) MPH"
        } else {
            resetTimer()
            lastTimeTextField.text = presentTimeTextField.text
            presentTimeTextField.text = destinationTextField.text
            speed = 0
            speedTextField.text = "\(speed) MPH"
            alert()
        }
    }
    
    func alert() {
        guard let presentTime = presentTimeTextField.text else {return}
        
        let alert = UIAlertController(title: "Time Travel Success",
                                      message: "Your new date is \(presentTime)",
            preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Done", style: .default, handler: nil))
        
        present(alert, animated: true, completion: nil)
    }
    
    // MARK: - Navigation
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "ModalDestinationDatePickerSegue" {
            guard let datePickerVC = segue.destination as? DatePickerViewController else {
                fatalError("Error with date picker.")
            }
            datePickerVC.delegate = self
        }
    }
}


extension TimeCircuitsViewController: DatePickerDelegate {
    func destinationDateWasChosen(date: Date) {
        destinationTextField.text = dateFormatter.string(from: date)
    }
}

