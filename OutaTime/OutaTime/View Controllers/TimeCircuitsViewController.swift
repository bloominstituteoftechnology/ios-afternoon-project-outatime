//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by Richard Gibbs on 5/20/20.
//  Copyright © 2020 Rich Gibbs. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {


    var timer: Timer?
    var currentSpeed = 0
    var dateFormatter: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, yyyy"
        dateFormatter.timeZone = TimeZone(secondsFromGMT: -25200)
        return dateFormatter
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        jan1Label.font = UIFont(name: "digital-7", size: 40)
        may20Label.font = UIFont(name: "digital-7", size: 40)
        dashesLabel.font = UIFont(name: "digital-7", size: 40)
        mphLabel.font = UIFont(name: "digital-7", size: 40)
        updateViews()
    }
    
    func updateViews() {
        may20Label.text = dateFormatter.string(from: Date())
        mphLabel.text = "\(currentSpeed) MPH"
        dashesLabel.text = "--- -- ----"
    }
    @IBOutlet weak var jan1Label: UILabel!
    
    @IBOutlet weak var may20Label: UILabel!
    @IBOutlet weak var dashesLabel: UILabel!
    @IBOutlet weak var mphLabel: UILabel!
    @IBAction func tappedTravelBack(_ sender: Any) {
        startTimer()
    }
    
    func startTimer() {
       timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: updateSpeed(timer:) )
    }
    
    func resetTimer () {
        timer?.invalidate()
        timer = nil
        mphLabel.text = "\(currentSpeed) MPH"
    }
    
    func updateSpeed(timer: Timer) {
        if currentSpeed < 88 {
            currentSpeed += 1
            mphLabel.text = "\(currentSpeed) MPH"
        } else {
            resetTimer()
            dashesLabel.text = jan1Label.text
            currentSpeed = 0
            mphLabel.text = "\(currentSpeed) MPH"
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let timeCircuitsVC = segue.destination as? DataPickerViewController {
            timeCircuitsVC.delegate = self
        }
        
    }
}
   
extension TimeCircuitsViewController: DatePickerDelegate {
    func destinationDateWasChosen(date: Date) {
        jan1Label.text = dateFormatter.string(from: date)
    }
    
        
}
