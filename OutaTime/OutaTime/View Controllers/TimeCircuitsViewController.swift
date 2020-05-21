//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by Mike Nichols on 5/20/20.
//  Copyright © 2020 Mike Nichols. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {
    
    @IBOutlet weak var destinationTimeLabel: UILabel!
    @IBOutlet weak var presentTimeLabel: UILabel!
    @IBOutlet weak var lastTimeDepartedLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    
    // MARK: Properties
    
    var timer: Timer?
    
    private var dateFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateFormat = "MMM d, yyyy"
            formatter.timeZone = TimeZone(secondsFromGMT: 0)
            return formatter
        }()

    
    private func stringThisDate(_ date:  Date) -> String {
        let string = dateFormatter.string(from: date)
        return string
    }
    
    private func updatePresentDate() {
        let today = Date()
        presentTimeLabel.text = stringThisDate(today)
    }
    
    var speed: Int = 0
    
    private func updateSpeed(timer: Timer)  {
        if speed < 87 {
            speed += 1
            speedLabel.text = "\(speed) MPH"
        } else {
            cancelTimer()
            lastTimeDepartedLabel.text = presentTimeLabel.text
            presentTimeLabel.text = destinationTimeLabel.text
            speed = 0
            showAlert()
        }
        
    }
    
    private func updateLastDeparted() {
        lastTimeDepartedLabel.text = "--- -- ----"
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func travelBackTapped() {
          startTimer()
      }
    
    private func startTimer() {
        cancelTimer()
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: updateSpeed(timer:))
        
    }
    
    private func cancelTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    private func showAlert() {
        
        let alert = UIAlertController(title: "Time Travel Successful",
                                      message: "Your new date is \(String(describing: presentTimeLabel.text))",
                                      preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK",
                                     style: .cancel,
                                     handler: nil)
        
        alert.addAction(okAction)
        
        present(alert, animated: true, completion: nil)
    }


    // MARK: - Navigation


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        if segue.identifier == "ModalDestinationDatePickerSegue" {
            if let destinationVC = segue.destination as? DatePickerViewController {
                destinationVC.datePicker.date = Date()
            }
        }
    }


}

extension TimeCircuitsViewController: DatePickerDelegate {
    
    func destinationDateWasChosen(_ date: Date) {
        destinationTimeLabel.text = dateFormatter.string(from: date)
    }
    
}
