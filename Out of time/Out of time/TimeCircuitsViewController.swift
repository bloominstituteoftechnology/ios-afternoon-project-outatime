//
//  TimeCircuitsViewController.swift
//  Out of time
//
//  Created by Alex Thompson on 10/8/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {
    @IBOutlet weak var destinationTimeLabel: UILabel!
    @IBOutlet weak var presentTimeLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    @IBAction func destinationTimePressed(_ sender: UIButton) {
    }
    @IBAction func travelBackLabel(_ sender: UIButton) {
    }
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd yyyy"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        return formatter
    }
    
    var currentSpeed = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let date = Date(timeIntervalSinceNow: 50)
        dateFormatter.locale = Locale(identifier: "en_US")
        presentTimeLabel.text = dateFormatter.string(from: date)
        speedLabel.text = "\(currentSpeed) MPH"
        timeLabel.text = "___ __ ____"
        
        destinationTimeLabel.text = dateFormatter.string(from: Date())
        }
    
    var timer: Timer?
    
    func resetTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    func updateSpeedLabel(timer: Timer) {
        if currentSpeed != 88 {
            currentSpeed += 1
            speedLabel.text = "\(currentSpeed) MPH"
        } else {
            resetTimer()
            timeLabel.text = presentTimeLabel.text
            presentTimeLabel.text = destinationTimeLabel.text
            currentSpeed = 0
            alert()
        }
    }
    
    func alert() {
        let alert = UIAlertController(title: "Time travel successful!", message: "You new date is \(String(describing: presentTimeLabel.text)).", preferredStyle: .alert)
        present(alert, animated: true, completion: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ModalDestinationDatePickerSegue" {
            if let addDate = segue.destination as? DatePickerViewController {
                addDate.delegate = self as? DatePickerDelegate
            }
        }
    }
}
    
extension TimeCircuitsViewController: DatePickerDelegate {
        func destinationDateWasChosen(date: Date) {
            destinationTimeLabel.text = dateFormatter.string(from: date)
        }
}
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


