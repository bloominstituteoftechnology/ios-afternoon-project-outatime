//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by Nonye on 4/22/20.
//  Copyright © 2020 Nonye Ezekwo. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {
//MARK: OUTLETS
    @IBOutlet weak var destinationTimeLabel: UILabel!
    
    @IBOutlet weak var presentTimeLabel: UILabel!
    
    @IBOutlet weak var lastTimeDepartedLabel: UILabel!
    
    @IBOutlet weak var mphLabel: UILabel!
//MARK: DATE FORMATTER
    private var dateFormatter: DateFormatter = {
         let formatter = DateFormatter()
         formatter.dateFormat = "MMM dd, yyyy"
         return formatter
     }()
    
    var speed: Double = 0
    
    func updateViews() {
        presentTimeLabel.text = dateFormatter.string(from: Date())
        mphLabel.text = "\(speed) MPH"
        lastTimeDepartedLabel.text = "--- -- ----"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
//MARK: ACTIONS
    var timer: Timer?
    
    @IBAction func travelBackTapped(_ sender: Any) {
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
    if speed <= 88 {
    speed += 1
    mphLabel.text = "\(speed)"
    } else {
        if speed >= 88 {
            resetTimer()
            lastTimeDepartedLabel.text = presentTimeLabel.text
            presentTimeLabel.text = destinationTimeLabel.text
            speed = 0
        }
    }
}
        
    private func showAlert(date: String) {
            let alert = UIAlertController(title: "Time Travel Successful", message: "Your new date is \(date)", preferredStyle: .alert)
                present(alert, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ModalDestinationDatePickerSegue" {
            guard let datePickerVC = segue.destination as? DatePickerViewController else
            { return }
            datePickerVC.delegate = self
        }
    }
}
    // MARK: - Navigation


extension TimeCircuitsViewController: DatePickerDelegate {
func destinationDateWasChosen(_ date: Date) {
    destinationTimeLabel.text = dateFormatter.string(from: date)
}
}
