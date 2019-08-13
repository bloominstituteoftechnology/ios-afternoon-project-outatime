//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by brian vilchez on 7/24/19.
//  Copyright © 2019 brian vilchez. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       presentTimeLabel.text = dateFormatter.string(from: Date())
        destinationTimeLabel.text = dateFormatter.string(from: Date())
        speedLabel.text = "\(currentSpeed) " + "MPH"
        
    }
    
    // MARK: Properties
    @IBOutlet weak var destinationTimeLabel: UILabel!
    @IBOutlet weak var presentTimeLabel: UILabel!
    @IBOutlet weak var lastTimeDeparted: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM,dd,YYYY"
        dateFormatter.timeZone = TimeZone(abbreviation: "MT")
        return dateFormatter
    }()
    var currentSpeed = 0
    var timer: Timer?
    var dateSelected: Date?
    // MARK: - Actions
    
  
    @IBAction func travelBackTapped(_ sender: UIButton) {
        startTimer()
    }

        func updateSpeed(timer: Timer) {
            
            if currentSpeed != 88 {
                currentSpeed += 1
                speedLabel.text = "\(currentSpeed) MPH"
            } else {
                lastTimeDeparted.text = presentTimeLabel.text
                presentTimeLabel.text = destinationTimeLabel.text
                cancelTimer()
                resetTimer()
                speedLabel.text = "\(currentSpeed) MPH"
                let alert = UIAlertController(title:"Time Travel Succesful", message: "Your new date is \(presentTimeLabel.text!)", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
                present(alert,animated: true)
            }

    }
    
    
    func startTimer() {
     //   guard let timer = timer else {return}
    timer = Timer.scheduledTimer(withTimeInterval: 0.10, repeats: true, block: updateSpeed(timer:))
        
            }
    
    func resetTimer() {
        currentSpeed = 0
        dateSelected = nil
            }
    
    func cancelTimer() {
    timer?.invalidate()
        timer = nil
       
    }
 
  
}


extension TimeCircuitsViewController: DatePickerDelegate {
    func destinationDateWasChosen(_ date: Date) {
        destinationTimeLabel.text = dateFormatter.string(from: date)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "ModalDestinationDatePickerSegue",
            let datePickerVC = segue.destination as? DatePickerViewController else { return }
            datePickerVC.delegate = self
       
    }
}
extension TimeCircuitsViewController {
    func CreateActionAlerts() -> UIAlertController {
        
        let alert = UIAlertController(title:"Time Travel Succesful", message: "Your new date is \(presentTimeLabel.text!)", preferredStyle: .alert)
         alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
        present(alert,animated: true)
        return alert
    }
}

