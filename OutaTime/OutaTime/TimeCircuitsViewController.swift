//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by Jorge Alvarez on 12/18/19.
//  Copyright © 2019 Jorge Alvarez. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {

    @IBOutlet weak var destinationTimeLabel: UILabel!
    @IBOutlet weak var presentTimeLable: UILabel!
    @IBOutlet weak var lastTimeDepartedLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    
    var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, yyyy" // JAN 01, 2001
        return formatter
    }()
    
    var currentSpeed = 0
    var timer: Timer? = nil
    
    @IBAction func travelBackButtonTapped(_ sender: UIButton) {
        //print("travel back")
        startTimer()
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: updateSpeedLabel(timer:))
    }
    
    func resetTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    func updateSpeedLabel(timer: Timer) {
        currentSpeed += 1
        speedLabel.text = "\(currentSpeed) MPH"
        if currentSpeed >= 88 {
            resetTimer()
            lastTimeDepartedLabel.text = presentTimeLable.text
            presentTimeLable.text = destinationTimeLabel.text
            currentSpeed = 0
            speedLabel.text = "\(currentSpeed) MPH"
            showAlert()
        }
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "Time Travel Successful", message: "You're new date is \n \(presentTimeLable.text ?? "")", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presentTimeLable.text = dateFormatter.string(from: Date()) // current time
        speedLabel.text = "\(currentSpeed) MPH"
        lastTimeDepartedLabel.text = "--- -- ----"
        
    }

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        if segue.identifier == "ModalDestinationDatePickerSegue" {
            guard let datePickerVC = segue.destination as? DatePickerViewController else {return}
            // sets up the TimesCircuitViewController as the delegate or employee of the DatePickerViewController
            datePickerVC.delegate = self
        }
        
    }

}

extension TimeCircuitsViewController: DatePickerDelegate {

    func destinationDateWasChosen(date: Date) {
        destinationTimeLabel.text = dateFormatter.string(from: date) // this is what DPVC is passing to TCVC
    }
}

