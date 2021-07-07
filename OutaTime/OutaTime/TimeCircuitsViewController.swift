//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by Tobi Kuyoro on 13/11/2019.
//  Copyright © 2019 Tobi Kuyoro. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {

    @IBOutlet weak var destinationTimeLabel: UILabel!
    @IBOutlet weak var presentTimeLabel: UILabel!
    @IBOutlet weak var lastTimeDepartedLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    
    let datePicker = DatePickerViewController()
    var destinationDate: Date?
    var timer: Timer?
    var speed = 0
    
    
    var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d yyyy"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        return formatter
    }()
    
    func string(todaysDate: Date) -> String {
        return dateFormatter.string(from: todaysDate)
    }
    
    func setCurrentTime() {
        presentTimeLabel.text = string(todaysDate: Date())
    }
    
    func setSpeed() {
         speedLabel.text = "\(speed) MPH"
    }
    
    func lastTimeDeparted() {
        lastTimeDepartedLabel.text = "--- -- ----"
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: updateSpeed(timer:))
    }
    
    func resetTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    func updateSpeed(timer: Timer) {
        if speed < 88 {
            speed += 1
            speedLabel.text = "\(speed) MPH"
        } else if speed == 88 {
            resetTimer()
            lastTimeDepartedLabel.text = presentTimeLabel.text
            presentTimeLabel.text = destinationTimeLabel.text
            speed = 0
            speedLabel.text = "0 MPH"
            showAlert()
        }
    }
    
    
    private func showAlert() {
        let alert = UIAlertController(title: "Time Travel Successful", message: "Your new date is \(Date())", preferredStyle: .actionSheet)
        let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(alertAction)
        
        present(alert, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func setDestinationButton(_ sender: Any) {
    }
    
    
    @IBAction func travelBackButton(_ sender: Any) {
        
        if let _ = destinationDate {
        startTimer()
        }
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ModalDestinationDatePickerSegue" {
            let datePickerVC = segue.destination as! DatePickerViewController
            datePickerVC.delegate = self
        }
    }
}

extension TimeCircuitsViewController: DatePickerDelegate {
    func destinationDateWasChosen(date: Date) {
        self.destinationDate = date
        destinationTimeLabel.text = dateFormatter.string(from: date)
    }
}
