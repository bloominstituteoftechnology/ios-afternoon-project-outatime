//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by Lambda_School_Loaner_201 on 10/8/19.
//  Copyright © 2019 Christian Lorenzo. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {
    
    
    
    
//Outlet Labels
    
    @IBOutlet weak var destinationLabel: UILabel!
    @IBOutlet weak var presentTimeLabel: UILabel!
    @IBOutlet weak var lastTimeDepartedLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    
    var currentSpeed = 0
    var timer: Timer?
    
//Computed property:
    var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd yyyy"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        return formatter
    }()
    
//UpdateViews function:
//1.- Setting the timeLabel to show the current date using date formatter:
    func updateViews() {
        presentTimeLabel.text = dateFormatter.string(from: Date())
        speedLabel.text = "\(currentSpeed) MPH"
        lastTimeDepartedLabel.text = "--- -- ----"
    }
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }

    
    
//Buttons
    
    @IBAction func setDestinationTimeButton(_ sender: UIButton) {
    }
    
    @IBAction func travelBackButton(_ sender: UIButton) {
        timeStart()
    }
    
    
//MARK: - Prepare for Segue:
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ModalDestinationDatePickerSegue" {
            if let destinationVC = segue.destination as? DatePickerViewController {
                destinationVC.delegate = self
            }
        }
    }

//Function timeStart()
    func timeStart() {
    timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { (timer) in self.updateSpeed()
        
    }
}
    
//Function updateSpeed()
    func updateSpeed() {
        speedLabel.text = "\(currentSpeed) MPH"
        
        if currentSpeed < 88 {
            currentSpeed += 1
        }else {
            timer?.invalidate()
            lastTimeDepartedLabel.text = presentTimeLabel.text
            presentTimeLabel.text = destinationLabel.text
            
            let alert = UIAlertController(title: "Time Travel Successful!", message: "Your new date is \(presentTimeLabel.text ?? "Nowhere Buddy").", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true)
            currentSpeed = 0
        }
    }
}


extension TimeCircuitsViewController: DatePickerDelegate {
    func destinationDateWasChosen(for date: Date) {
        destinationLabel.text = dateFormatter.string(from: date)
    }
}
