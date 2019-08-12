//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by John Kouris on 8/11/19.
//  Copyright © 2019 John Kouris. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {
    
    @IBOutlet weak var destinationTimeLabel: UILabel!
    @IBOutlet weak var presentTimeLabel: UILabel!
    @IBOutlet weak var lastTimeDepartedLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    
    var dateFormatter: DateFormatter {
        self.dateFormatter.dateStyle = .medium
        return self.dateFormatter
    }
    
    var currentSpeed = 0
    
    let currentDate = Date()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        presentTimeLabel.text = dateFormatter.string(from: currentDate)
        speedLabel.text = "\(currentSpeed) MPH"
        lastTimeDepartedLabel.text = "--- -- ----"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ModalDestinationDatePickerSegue" {
            guard let destinationVC = segue.destination as? DatePickerViewController else { return }
            destinationVC.delegate = self
        }
    }
    
    @IBAction func travelBackButtonTapped(_ sender: Any) {
        startTimer()
    }
    
    func startTimer() {
        let timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: false) { (timer) in
            self.updateSpeed()
        }
    }
    
    func resetTimer() {
        
    }
    
    func updateSpeed() {
        if currentSpeed == 88 {
            resetTimer()
            lastTimeDepartedLabel.text = dateFormatter.string(from: currentDate)
            presentTimeLabel.text = destinationTimeLabel.text
            currentSpeed = 0
            presentAlert()
        } else {
            currentSpeed += 1
            speedLabel.text = "\(currentSpeed) MPH"
        }
    }
    
    func presentAlert() {
        let alert = UIAlertController(title: "Time Travel Successful", message: "You're new date is \(destinationTimeLabel.text)", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    

}

extension TimeCircuitsViewController: DatePickerDelegate {
    func destinationDateWasChosen(forDate date: Date) {
        destinationTimeLabel.text = dateFormatter.string(from: date)
    }
}
