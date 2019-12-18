//
//  TimeCircuitsViewController.swift
//  Outatime
//
//  Created by Tobi Kuyoro on 18/12/2019.
//  Copyright © 2019 Tobi Kuyoro. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {

    @IBOutlet weak var destinationTimeLabel: UILabel!
    @IBOutlet weak var presentTimeLabel: UILabel!
    @IBOutlet weak var lastTimeDepartedLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    
    let today = Date()
    var speed = 0
    var destination: Date?
    var timer: Timer?
    var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, yyyy"
        
        return formatter
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presentTimeLabel.text = dateFormatter.string(from: today)
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
    
    func showAlert() {
        let alert = UIAlertController(title: "Time Travel Successful", message: "Your new date is \(Date())", preferredStyle: .actionSheet)
        let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(alertAction)
        
        present(alert, animated: true)
    }
    
    @IBAction func travelBackTapped(_ sender: Any) {
        startTimer()
    }
    
    

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ModalDestinationDatePickerSegue" {
            if let destinationVC = segue.destination as? DatePickerViewController {
                destinationVC.delegate = self
            }
        }
    }
}

extension TimeCircuitsViewController: DatePickerDelegate {
    func destinationDateWasChosen(date: Date) {
        self.destination = date
               destinationTimeLabel.text = dateFormatter.string(from: date)
    }
}
