//
//  TimeCircuitViewController.swift
//  OutaTime
//
//  Created by David Williams on 12/10/19.
//  Copyright © 2019 david williams. All rights reserved.
//

import UIKit




class TimeCircuitViewController: UIViewController {
    
    @IBOutlet weak var destinationTimeLabel: UILabel!
    @IBOutlet weak var presentTimeLabel: UILabel!
    @IBOutlet weak var lastTimeDepartedLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var travelButton: UIButton!
    
    var currentSpeed: Int = 0
    var delegate = DatePickerDelegate?.self
  
    private var timer: Timer?
       
    override func viewDidLoad() {
        super.viewDidLoad()
        speedLabel.text = "\(currentSpeed) MPH"
       // destinationTimeLabel.text = "--- -- ---"
        lastTimeDepartedLabel.text = "--- -- ---"
        presentTimeLabel.text = dateFormatter.string(from: Date())
        updateViews()
        view.backgroundColor = .black
    }
    
    func reset() {
        currentSpeed = 0
        cancelTimer()
        travelButton.isEnabled = true
    }
    
    func cancelTimer() {
        timer?.invalidate()
        lastTimeDepartedLabel.text = presentTimeLabel.text
        presentTimeLabel.text = destinationTimeLabel.text
        showAlert()
        speedLabel.text = "0"
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: speedUpdate(timer:))
    }
    
    func speedUpdate(timer: Timer) {
        if currentSpeed >= 88 {
            reset()
        } else {
        currentSpeed += 1
        updateViews()
        }
    }
    
    
    func updateViews() {
        speedLabel.text = "\(currentSpeed) MPH"
    }
    
    var dateFormatter: DateFormatter =  {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd, yyyy"
        
        return formatter
    }()
    
    private func string(from date: Date) -> String {
        
        return dateFormatter.string(from: date)
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let date = segue.destination as? DatePickerViewController {
            date.delegate = self
        }
    }
    
    @IBAction func setDestinationTapped(_ sender: UIButton) {
    }
    
    @IBAction func travelBackButtonTapped(_ sender: UIButton) {
        startTimer()
        travelButton.isEnabled = false
    }
    
    private func showAlert() {
        let alert = UIAlertController(title: "Time Travel Successful!", message: "Your new date is \(presentTimeLabel.text ?? "Nowhere have you gone.")", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Travel some more.", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

extension TimeCircuitViewController: DatePickerDelegate {
    func destinationDateWasChosen(date: Date) {
        destinationTimeLabel.text = dateFormatter.string(from: date)
    }
}
