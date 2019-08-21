//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by brian vilchez on 8/21/19.
//  Copyright © 2019 brian vilchez. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {
    //MARK: - Properties
    @IBOutlet weak var destinationTimeLabel: UILabel!
    @IBOutlet weak var presentTImeLabel:UILabel!
    @IBOutlet weak var DepartedLabel:UILabel!
    @IBOutlet weak var speedLabel:UILabel!
    var currentSpeed = 0
    var timer: Timer?
    var dateFormatter: DateFormatter = {
       let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd,YYYY"
     formatter.timeZone = TimeZone(secondsFromGMT: 0)
        return formatter
        
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
//presentTImeLabel.font = UIFont(name: "digital-7", size: 30)
        presentTImeLabel.text = dateFormatter.string(from: Date())
        DepartedLabel.text = "__ __ ____"
        speedLabel.text = "\(currentSpeed) MPH"

    }
    
    @IBAction func travelBack(_ sender:UIButton) {
        startTimer()
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DatePickerModalSegue" {
            guard let datePickerVC = segue.destination as? DatePickerViewController else {return}
            datePickerVC.delegate = self
        }
    }
    
}
extension TimeCircuitsViewController: DatePickerDelegate {
    func destinationWasChosen(date: Date) {
        destinationTimeLabel.text = dateFormatter.string(from: date)
        dismiss(animated: true, completion: nil)
    }
 private func startTimer() {
   timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: updateSpeed(_:))
    
    }
 private func updateSpeed(_ timer:Timer) {
            if currentSpeed < 88 {
            currentSpeed += 1
            speedLabel.text = "\(currentSpeed) MPH"
            } else {
            resetTimer()
            DepartedLabel.text = presentTImeLabel.text
            presentTImeLabel.text = destinationTimeLabel.text
        }
    }
    
 private func resetTimer() {
    timer?.invalidate()
    timer = nil
    currentSpeed = 0
    speedLabel.text = "\(currentSpeed) MPH"
    }
}
