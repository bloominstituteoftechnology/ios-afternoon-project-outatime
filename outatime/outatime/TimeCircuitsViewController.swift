//
//  TimeCircuitsViewController.swift
//  outatime
//
//  Created by LaFleur on 12/12/19.
//  Copyright © 2019 David Schwinne. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {

    @IBOutlet weak var destinationTimeLabel: UILabel!
    
    @IBOutlet weak var presentTimeLabel: UILabel!
    
    @IBOutlet weak var lastTimeDepartedLabel: UILabel!
    
    @IBOutlet weak var speedLabel: UILabel!
    
    @IBAction func travelBackButtonTapped(_ sender: UIButton) {
        
        if destinationTimeLabel.text != presentTimeLabel.text {
            
            startTimer()
                   } else {
                       let alert = UIAlertController(title: "Time Travel Failed", message: "You are already in \(destinationTimeLabel.text!)", preferredStyle: .alert)
            
                       alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            
                       present(alert, animated: true, completion: nil)
            
                   }
    }
    
    
    var dateFormatter: DateFormatter = {
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "HH:mm:ss:SS"
        
        dateFormatter.timeZone = TimeZone.init(secondsFromGMT: 0)
        
        return dateFormatter
    }()
    
    var speed = 0
    
    var timer: Timer?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "ShowDestinationTimeSegue" {
            
            if let datePickerVC = segue.destination as? DatePickerViewController {
                
                datePickerVC.delegate = self as! DatePickerDelegate
            }
        }
    }
            
        
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: updateSpeed(time:))
        }
        
    func resetTimer() {
        
        timer?.invalidate()
        
        timer = nil
        }
        
    func updateSpeed(time: Timer) {
        if speed >= 88 {
            resetTimer()
            
            presentTimeLabel.text = destinationTimeLabel.text
            
            speed = 0
            
            lastTimeDepartedLabel.text = presentTimeLabel.text
            
            speedLabel.text = "\(speed)MPH"
            
            showAlert()
        } else {
            
            speed += 1
            
            speedLabel.text = "\(speed)MPH"
        }
    }
        
     func showAlert() {
        let alert = UIAlertController(title: "Time Travel Successful!", message: "Your new date is \(presentTimeLabel.text!)", preferredStyle: .alert)
        
            alert.addAction(UIAlertAction(title: "OK!", style: .default, handler: nil))
        
            present(alert, animated: true, completion: nil)
    }
}

extension TimeCircuitsViewController: DatePickerDelegate {

func destinationDateWasChosen(date: Date) {

    destinationTimeLabel.text = dateFormatter.string(from: date)
    }
}
