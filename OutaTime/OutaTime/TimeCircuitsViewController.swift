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
    

    @IBOutlet weak var destinationLabel: UILabel!
    @IBOutlet weak var destinationTextField: UITextField!
    
    @IBOutlet weak var presentTimeLabel: UILabel!
    @IBOutlet weak var presentTimeTextField: UITextField!
    
    
    @IBOutlet weak var lastTimeLabel: UILabel!
    @IBOutlet weak var lastTimeTextField: UITextField!
    
    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var speedTextField: UITextField!
    
    
    @IBAction func travelBackTapped(_ sender: Any) {
        func startTimer() {
            timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block: updateTimer(timer:))
        }
    }
    
    func updateTimer(timer: Timer) {
        updateSpeed()
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        textFields()
    }
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM dd, yyyy"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        return formatter
    }
    
    var speed = 0
    
    var timer: Timer?
    
    func textFields() {
        presentTimeTextField.text = dateFormatter.string(from: Date())
        speedTextField.text = "\(speed) MPH"
        lastTimeTextField.text = "--- -- ---"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
    func resetTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    func updateSpeed() {
        if speed >= 88 {
            
        }
    }
   
    
}



extension TimeCircuitsViewController: DatePickerDelegate {
    func destinationDateWasChosen(date: Date) {
        
    }
    
    
}
