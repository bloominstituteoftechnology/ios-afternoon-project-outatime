//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by Samuel Esserman on 2/26/20.
//  Copyright © 2020 Samuel Esserman. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {
    @IBOutlet weak var destinationTimeLabel: UILabel!
    @IBOutlet weak var presentTimeLabel: UILabel!
    @IBOutlet weak var lastTimeDepartedLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    
    var currentSpeed = 0
    private var timer: Timer?
    
    private var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, yyyy"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        return formatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
}
    
    
    
    @IBAction func travelBackTapped(_ sender: Any) {
        }
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.1,
                                     target: self,
                                     selector: #selector(updateSpeed),
                                     userInfo: nil,
                                     repeats: true)
    }
    
    @objc func updateSpeed() {
        if currentSpeed == 88 {
            restTimer()
            lastTimeDepartedLabel.text = presentTimeLabel.text
            presentTimeLabel.text = destinationTimeLabel.text
            currentSpeed = 0
            if let presentTime = presentTimeLabel.text {
                let ac = UIAlertController(title: "Time Tavel Successful!", message: "You're new date is \(presentTime)", preferredStyle: .alert)
                ac.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                present(ac, animated: true)
            }
        } else {
            currentSpeed += 1
            speedLabel.text = "\(currentSpeed) MPH"
        }
    }
    
    func restTimer() {
        timer?.invalidate()
        timer = nil
    }

   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ModalDestinationDatePickerSegue" {
            if let destVC = segue.destination as? DatePickerViewController {
                destVC.delegate = self
            }
        }
    }
}

//MARK: - Extension

extension TimeCircuitsViewController: DatePickerDelegate  {
    func destinationDateWasChosen(date: Date) {
        destinationTimeLabel.text = dateFormatter.string(from: date)
    }
}
