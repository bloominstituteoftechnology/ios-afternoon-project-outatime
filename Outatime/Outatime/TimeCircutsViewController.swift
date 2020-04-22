//
//  TimeCircutsViewController.swift
//  Outatime
//
//  Created by Kelson Hartle on 4/22/20.
//  Copyright © 2020 Kelson Hartle. All rights reserved.
//

import UIKit

class TimeCircutsViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var destinationTimeLabel: UILabel!
    @IBOutlet weak var presentTimeLabel: UILabel!
    @IBOutlet weak var lastTimeDepartedLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    
    // MARK: - Properties
    
    
    private var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, yyyy"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        return formatter
    }()
    
    
    var currentSpeed = 0
    
    var timer: Timer?
    
    

    // MARK: - Actions
    
    @IBAction func travelBackTapped(_ sender: UIButton) {
        
        startTimer()
        
        
    }
    
    // MARK: - Functions
    
    func startTimer() {
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: updateSpeed(timer:) )
        
        
    }
    
    func resetTimer() {
        
        timer?.invalidate()
        timer = nil
    }
    
    func updateSpeed(timer: Timer) {
        guard currentSpeed >= 88 else {
            currentSpeed += 1
            speedLabel.text = String(currentSpeed)
            
            return
        }
        resetTimer()
        lastTimeDepartedLabel.text = presentTimeLabel.text
        presentTimeLabel.text = destinationTimeLabel.text
        currentSpeed = 0
        speedLabel.text = String(currentSpeed)
        
        let alert = UIAlertController(title: "Time Travel Sucessful", message: "Your new date is \(presentTimeLabel.text ?? "")", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        speedLabel.text = "\(currentSpeed) MPH"
        lastTimeDepartedLabel.text = "--- -- ----"
        destinationTimeLabel.text = "--- -- ----"
        presentTimeLabel.text = dateFormatter.string(from: Date())
        
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ModalDestinationDatePickerSegue" {
            
            let datePickerVC = segue.destination as? DatePickerViewController
            
            datePickerVC?.delegate = self
            
            
        }
    }
}


extension TimeCircutsViewController: DatePickerDelegate {
    func destinationDateWasChosen(date: Date) {
        destinationTimeLabel.text = dateFormatter.string(from: date)
    }
}
