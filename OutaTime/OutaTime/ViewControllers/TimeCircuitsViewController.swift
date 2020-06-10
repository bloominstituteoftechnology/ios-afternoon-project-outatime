//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by Cora Jacobson on 6/8/20.
//  Copyright © 2020 Cora Jacobson. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {

    @IBOutlet weak var destinationTimeLabel: UILabel!
    @IBOutlet weak var presentTimeLabel: UILabel!
    @IBOutlet weak var lastTimeDepartedLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var travelBackButton: UIButton!
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd yyyy"
        return formatter
    }
    
    var speed: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        destinationTimeLabel.text = "--- -- ----"
        presentTimeLabel.text = dateFormatter.string(from: Date())
        lastTimeDepartedLabel.text = "--- -- ----"
        speedLabel.text = "\(speed) MPH"
        travelBackButton.setTitleColor(UIColor.darkGray, for: .normal)
    }
    
    private var timer: Timer? = nil
    
    func startTimer() {
        travelBackButton.setTitleColor(UIColor.darkGray, for: .normal)
        travelBackButton.isEnabled = false
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: updateSpeed(timer:))
    }
        
    func resetTimer() {
        timer?.invalidate()
        timer = nil
    }
        
    private func updateSpeed(timer: Timer) {
        if speed < 88 {
            speed += 1
            speedLabel.text = "\(speed) MPH"
        } else {
            resetTimer()
            travelBackButton.isEnabled = true
            lastTimeDepartedLabel.text = presentTimeLabel.text
            presentTimeLabel.text = destinationTimeLabel.text
            destinationTimeLabel.text = "--- -- ----"
            speed = 0
            speedLabel.text = "\(speed) MPH"
            let alert = UIAlertController(title: "Time Travel Successful", message: "Your new date is \(presentTimeLabel.text ?? "unknown")", preferredStyle: .alert)
            let okButton = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(okButton)
            present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func travelBackButton(_ sender: Any) {
        if destinationTimeLabel.text != "--- -- ----" {
            startTimer()
        } else {
            let alert = UIAlertController(title: "No Destination Time", message: "Please set a destination time.", preferredStyle: .alert)
            let okButton = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(okButton)
            present(alert, animated: true, completion: nil)
        }
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "modalDestinationDatePickerSegue" {
            if let datePickerVC = segue.destination as? DatePickerViewController {
                datePickerVC.delegate = self
            }
        }
    }

}

extension TimeCircuitsViewController: DatePickerDelegate {
    func destinationDateWasChosen(_ date: Date) {
        destinationTimeLabel.text = dateFormatter.string(from: date)
        travelBackButton.setTitleColor(UIColor(red:83/255, green:27/255, blue:147/255, alpha:1.0), for: .normal)
    }
}
