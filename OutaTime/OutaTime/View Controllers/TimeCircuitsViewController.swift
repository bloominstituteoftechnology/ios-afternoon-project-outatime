//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by Jordan Christensen on 8/22/19.
//  Copyright © 2019 Mazjap Co Technologies. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {
    
    @IBOutlet weak var destinationTimeLabel: UILabel!
    @IBOutlet weak var presentTimeLabel: UILabel!
    @IBOutlet weak var lastDepartureLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    
    var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd, yyyy"
        return formatter
    }()
    
    var lastDepartureDate: Date?
    var destinationDate = Date()
    var currentDate = Date()
    var speed = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        destinationTimeLabel.font = UIFont(name: "Digital-7", size: destinationTimeLabel.font.pointSize)
        presentTimeLabel.font = UIFont(name: "Digital-7", size: presentTimeLabel.font.pointSize)
        lastDepartureLabel.font = UIFont(name: "Digital-7", size: lastDepartureLabel.font.pointSize)
        speedLabel.font = UIFont(name: "digital-7.ttf", size: speedLabel.font.pointSize)
        
        updateViews()
    }
    
    private func updateViews() {
        presentTimeLabel.text = dateFormatter.string(from: currentDate)
        destinationTimeLabel.text = dateFormatter.string(from: destinationDate)
        speedLabel.text = "\(speed) MPH"
        if let lastDepartureDate = lastDepartureDate {
            lastDepartureLabel.text = dateFormatter.string(from: lastDepartureDate)
        } else {
            lastDepartureLabel.text = "--- -- ----"
        }
    }
    
    @IBAction func travelPressed(_ sender: Any) {
        startTimer()
    }
    
    private func startTimer() {
        var _ = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: updateSpeed(timer:))
    }
    
    private func resetTimer() {
        
    }
    
    private func updateSpeed(timer: Timer) {
        if speed >= 88 {
            timer.invalidate()
            speed = 0
            lastDepartureDate = currentDate
            currentDate = destinationDate
            updateViews()
            showAlert()
            
//            lastDepartureLabel.text = presentTimeLabel.text ?? lastDepartureLabel.text
//            presentTimeLabel.text = destinationTimeLabel.text ?? presentTimeLabel.text
//            speedLabel.text = "\(speed) MPH"
        } else {
            speed += 1
            speedLabel.text = "\(speed) MPH"
        }
    }
    
    private func showAlert() {
        let alert = UIAlertController(title: "Time Travel Successful", message: "Your date is now \(dateFormatter.string(from: currentDate))", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SetDestinationModalSegue" {
            if let datePickerVC = segue.destination as? DatePickerViewController {
                datePickerVC.delegate = self
            }
        }
     }

}

extension TimeCircuitsViewController: DatePickerDelegate {
    func destinationDateWasChosen(date: Date) {
        self.destinationDate = date
        updateViews()
        
    }
    
    
}

