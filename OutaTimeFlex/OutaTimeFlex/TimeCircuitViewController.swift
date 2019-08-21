//
//  TimeCircuitViewController.swift
//  OutaTimeFlex
//
//  Created by admin on 8/21/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class TimeCircuitViewController: UIViewController {
    
    @IBOutlet weak var destinationTimeLabel: UILabel!
    @IBOutlet weak var presentTimeLabel: UILabel!
    @IBOutlet weak var lastTimeDeparetedLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    
    let currentDate = Date()
    
    var currentSpeed = 0
    
    var timer: Timer?
    
    var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d yyyy"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        return formatter
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let customFont = UIFont(name: "Digital-7", size: UIFont.labelFontSize) else {return}
        
        presentTimeLabel.text = dateFormatter.string(from: currentDate)
        presentTimeLabel.font = UIFontMetrics.default.scaledFont(for: customFont)
        speedLabel.text = "\(currentSpeed) MPH"
        lastTimeDeparetedLabel.text = "___ __ ____"

        // Do any additional setup after loading the view.
    }
    
    
   
    @IBAction func travelBackButton(_ sender: Any) {
        startTimer()
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: updateSpeed(timer:))
    }
    
    func resetTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    func updateSpeed(timer: Timer) {
        if currentSpeed < 88 {
            currentSpeed += 1
            speedLabel.text = "\(currentSpeed) MPH"
        } else {
            resetTimer()
            guard let presentTime = presentTimeLabel.text else {return}
            lastTimeDeparetedLabel.text = presentTimeLabel.text
            presentTimeLabel.text = destinationTimeLabel.text
            currentSpeed = 0
            let alert = UIAlertController(title: "Time Travel Successful!", message: "Your new date is \(presentTime)", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ModalDestinationDatePickerSegue" {
            if let DatePickerVC = segue.destination as? DatePickerViewController {
                DatePickerVC.delegate = self
            }
        }
    }
    

}

extension TimeCircuitViewController: DatePickerDelegate {
    func destinationDateWasChosen(date: Date) {
        destinationTimeLabel.text = dateFormatter.string(from: date)
    }
    
    
}
