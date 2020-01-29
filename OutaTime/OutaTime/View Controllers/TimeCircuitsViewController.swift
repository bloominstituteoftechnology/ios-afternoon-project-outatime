//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by Michael on 12/18/19.
//  Copyright © 2019 Michael. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {

    @IBOutlet weak var destinationTimeLabel: UILabel!
    @IBOutlet weak var presentTimeLabel: UILabel!
    @IBOutlet weak var lastTimeDepartedLabel: UILabel!
    
    @IBOutlet weak var speedMPHLabel: UILabel!
    
    var currentSpeed = 0
    
    var destinationDate: Date?
    
    var timer = Timer()
    
    let now = Date()
    
    
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd,yyyy"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        return formatter
    }
    
    func dateString(date: Date) -> String {
        let timeRightNow = dateFormatter.string(from: now)
        return timeRightNow
    }
    
    
    
    func updateViews() {
        presentTimeLabel.text = dateString(date: now)
        speedMPHLabel.text = "\(currentSpeed) MPH"
        lastTimeDepartedLabel.text = "--- -- ----"
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateViews()
        
        

        // Do any additional setup after loading the view.
    }
    
    @IBAction func travelBackButtonTapped(_ sender: Any) {
        startTimer()
    }
    
    func showAlert() {
        guard let presentTimeLabel = presentTimeLabel.text else { return }
        
        let timeTravelAlert = UIAlertController(title: "Time Travel Successful!", message: "Your new date is \(presentTimeLabel)", preferredStyle: .alert)
        
        let okAlert = UIAlertAction(title: "Ok", style: .default, handler: nil)
        
        timeTravelAlert.addAction(okAlert)
        
        present(timeTravelAlert, animated: true, completion: nil)
    }
    
    func updateSpeed(timer: Timer) {
        if currentSpeed >= 88 {
            resetTimer()
            lastTimeDepartedLabel.text = presentTimeLabel.text
            presentTimeLabel.text = destinationTimeLabel.text
            currentSpeed = 0
            speedMPHLabel.text = String(currentSpeed)
            showAlert()
        } else {
            currentSpeed += 1
            speedMPHLabel.text = String(currentSpeed)
            
    }
        
        
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: updateSpeed)
    }
    
    func resetTimer() {
        timer.invalidate()
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ModalDestinationDatePickerSegue" {
            guard let datePickerVC = segue.destination as? DatePickerViewController else { return }
            datePickerVC.delegate = self
        }
    }
}

extension TimeCircuitsViewController: DatePickerDelegate {
    func destinationDateWasChosen(date: Date) {
        destinationDate = date
        destinationTimeLabel.text = dateFormatter.string(from: date)
    }
}
    
