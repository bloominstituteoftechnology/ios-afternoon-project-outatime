//
//  TimeCircuitsViewController.swift
//  Outatime
//
//  Created by ronald huston jr on 4/22/20.
//  Copyright © 2020 HenryQuante. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {
    @IBOutlet weak var destinationTimeLabel: UILabel!
    @IBOutlet weak var presentTimeLabel: UILabel!
    @IBOutlet weak var lastTimeDepartedLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    
    private var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, yyyy"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        return formatter
    }()
    
    var speed = 0
    private var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let date = Date()
        presentTimeLabel.text = dateFormatter.string(from: date)
        lastTimeDepartedLabel.text = "___ __ ____"
        destinationTimeLabel.text = "time travel to"
    }


    @IBAction func travelBack(_ sender: Any) {
        startTimer()
        print("")
    }
    
    func startTimer() {
        let timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: updateSpeed(timer:))
    }
    
    func resetTimer() {
        timer?.invalidate()
        timer = nil
        print("Timer Reset")
    }
    
    func updateSpeed(timer: Timer) {
        if speed < 88 {
            speed += 1
            speedLabel.text = "\(speed) MPH"
        } else {
            timer.invalidate()
            speedLabel.text = "\(speed) MPH"
            lastTimeDepartedLabel.text = presentTimeLabel.text
            presentTimeLabel.text = destinationTimeLabel.text
            speed = 0
            //  showAlert()
        }
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "great scott!", message: "welcome to 1988", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alert.addAction(okAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DatePickerSegue" {
            //  access the new view controller using
            guard let backToVC = segue.destination as? DatePickerViewController else { return }
            //  go back to the future via new view controller
            backToVC.delegate = self
        }
    }
}


extension TimeCircuitsViewController: DatePickerDelegate {
    func destinationDateSelected(date: Date) {
        destinationTimeLabel.text = dateFormatter.string(from: date)
    }
}
