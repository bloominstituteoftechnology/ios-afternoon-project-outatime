//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by Gladymir Philippe on 6/9/20.
//  Copyright © 2020 Gladymir Philippe. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {
    
    @IBOutlet weak var destinationTime: UILabel!
    @IBOutlet weak var presentTime: UILabel!
    @IBOutlet weak var lastTimeDeparted: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    
    let currentDate = Date()
    
    var currentSpeed = 0
    
    var timer: Timer?
    
    private var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d yyy"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        return formatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        presentTime.text = dateFormatter.string(from: currentDate)
        speedLabel.text = "\(currentSpeed) MPH"
        //lastTimeDeparted.text = ""
    }
    
    @IBAction func travelBackButton(_ sender: Any) {
        func starTimer() {
            timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: updateSpeed(timer: ))
        
    }
        starTimer()
    
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
            guard let presentTime = presentTime.text else { return }
            lastTimeDeparted.text = presentTime
            currentSpeed = 0
            let alert = UIAlertController(title: "Time Travel Successful", message: "You're new date is \(presentTime) here", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
        func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        guard let datePickerVC = segue.destination as? DatePickerViewController else { return }
            datePickerVC.delegate = self as! DatePickerDelegate
        
        
    }

    }
}

extension TimeCircuitsViewController: DatePickerDelegate {
    func destinationDateWasChosen(date: Date) {
        destinationTime.text = dateFormatter.string(from: date)
    }
}


