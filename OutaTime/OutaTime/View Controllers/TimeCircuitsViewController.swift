//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by Lambda_School_Loaner_204 on 10/16/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {

    @IBOutlet weak var destinationTimeLabel: UILabel!
    @IBOutlet weak var presentTimeLabel: UILabel!
    @IBOutlet weak var lastTimeDepartedLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, yyyy"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        return formatter
    }
    
    var currentSpeed = 0
    
    private var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        updateViews()
    }
    
    
    func updateViews() {
        
        let date = Date()
        presentTimeLabel.text = dateFormatter.string(from: date)
        destinationTimeLabel.text = "--- -- ----"
        speedLabel.text = "\(currentSpeed) MPH"
        lastTimeDepartedLabel.text = "--- -- ----"
        
    }
    
    func startTimer() {
        cancelTimer()
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: updateSpeed(timer:))
    }
    
    func resetTimer() {
        cancelTimer()
    }
    
    func cancelTimer() {
        // We must invalidate a timer, or it will continue to run even if we
        // start a new timer
        timer?.invalidate()
        timer = nil
    }
    
    private func updateSpeed(timer: Timer) {
        
        if (currentSpeed < 88) {
            currentSpeed += 1
            speedLabel.textColor = randomColor()
            speedLabel.text = "\(currentSpeed) MPH"
        } else {
            cancelTimer()
            lastTimeDepartedLabel.text = presentTimeLabel.text
            presentTimeLabel.text = destinationTimeLabel.text
            currentSpeed = 0
            speedLabel.textColor = UIColor.white
            speedLabel.text = "\(currentSpeed) MPH"
            showAlert()
        }
    }
    
    private func randomColor() -> UIColor {
        let color = Int.random(in: 1...6)
        switch color {
        case 1:
            return UIColor.systemRed
        case 2:
            return UIColor.systemGreen
        case 3:
            return UIColor.systemOrange
        case 4:
            return UIColor.systemPink
        case 5:
            return UIColor.systemTeal
        case 6:
            return UIColor.systemYellow
        default:
            return UIColor.white
        }
    }
    
    @IBAction func travelBackButtonTapped(_ sender: UIButton) {
        if(destinationTimeLabel.text == "--- -- ----") {
            showSetDestinationAlert()
        } else {
            startTimer()
        }
    }
    
    private func showSetDestinationAlert() {
        let alert = UIAlertController(title: "Set Destination Time!", message: "Your destination is \(destinationTimeLabel.text!).", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    private func showAlert() {
        let alert = UIAlertController(title: "Time Travel Successful", message: "Your new date is \(presentTimeLabel.text!).", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "ModalDestinationDatePickerSegue") {
            if let datePickerVC = segue.destination as? DatePickerViewController {
                datePickerVC.datePickerDelegate = self
            }
        }
    }
}

extension TimeCircuitsViewController: DatePickerDelegate {
    
    func destinationDateWasChosen(_ destinationDate: Date) {
        destinationTimeLabel.text = dateFormatter.string(from: destinationDate)
    }
}
