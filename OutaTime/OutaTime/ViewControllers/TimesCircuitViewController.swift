//
//  TimesCircuitViewController.swift
//  OutaTime
//
//  Created by Alex Rhodes on 8/19/19.
//  Copyright © 2019 Alex Rhodes. All rights reserved.
//

import UIKit

class TimesCircuitViewController: UIViewController {
    
    @IBOutlet weak var destinationTimeLabel: UILabel!
    @IBOutlet weak var presentTimeLabel: UILabel!
    @IBOutlet weak var timeLastDepartedLabel: UILabel!
    @IBOutlet weak var setDestinationTimeButton: UIButton!
    @IBOutlet weak var travelBackButton: UIButton!
    @IBOutlet weak var currentSpeedLabel: UILabel!
    
    var currentSpeed = 0
    var timer: Timer?
    
    var dateFormatter: DateFormatter {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd yyyy"
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        return dateFormatter
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        
    }
    
    func setViews() {
        setDestinationTimeButton.setTitle("SET DESTINATION TIME", for: .normal)
        setDestinationTimeButton.setTitleColor(#colorLiteral(red: 0.4180558622, green: 0.02208497748, blue: 0.676962316, alpha: 1), for: .normal)
        setDestinationTimeButton.backgroundColor = #colorLiteral(red: 0.971817553, green: 0.9660399556, blue: 0.9762582183, alpha: 1)
        setDestinationTimeButton.layer.cornerRadius = 8
        
        travelBackButton.setTitle("TRAVEL BACK", for: .normal)
        travelBackButton.setTitleColor(#colorLiteral(red: 0.4180558622, green: 0.02208497748, blue: 0.676962316, alpha: 1), for: .normal)
        travelBackButton.backgroundColor = #colorLiteral(red: 0.9742724299, green: 0.9642363191, blue: 0.9773643613, alpha: 1)
        travelBackButton.layer.cornerRadius = 8
        
        currentSpeedLabel.text = String(currentSpeed)
        currentSpeedLabel.text?.append(" MPH")
        timeLastDepartedLabel.text = "___ __ ____"
        
        
        
        
    }
    
    @IBAction func travelBacButtonPressed(_ sender: UIButton) {
       startTimer()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DatePickerSegue" {
            guard let datePickerVC = segue.destination as? DatePickerViewController else {return}
            datePickerVC.delegate = self
            
        }
    }
    
    func startTimer() {
        resetTimer()
        timer = Timer.scheduledTimer(withTimeInterval: 0.07, repeats: true, block: updateSpeed(timer:))
    }
    
    func resetTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    func updateSpeed(timer: Timer) {
        if currentSpeed < 88 {
            currentSpeed += 1
            currentSpeedLabel.text = String(currentSpeed)
        } else {
            resetTimer()
            timeLastDepartedLabel.text = presentTimeLabel.text
            presentTimeLabel.text = destinationTimeLabel.text
            currentSpeed = 0
            
            let alert = UIAlertController(title: "Time travel successful!", message: "You have arrived at \(presentTimeLabel.text ?? "")", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
    }
}

extension TimesCircuitViewController: DatePickerDelegate {
    func destinationDateWasChosed(date: Date) {
        
        let date = dateFormatter.string(from: date)
        destinationTimeLabel.text = date
    }
}
