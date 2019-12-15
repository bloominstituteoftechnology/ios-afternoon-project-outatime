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
    
    var currentSpeed: Int = 0
    var delegate = DatePickerDelegate?.self
    
    private var timer: Timer?
       
    override func viewDidLoad() {
        super.viewDidLoad()
        speedLabel.text = "\(currentSpeed) MPH"
        destinationTimeLabel.text = "--- -- ---"
        lastTimeDepartedLabel.text = "--- -- ---"
        presentTimeLabel.text = dateFormatter.string(from: Date())
        view.backgroundColor = .black
    }
    
    func reset() {
        cancelTimer()
    }
    
    func cancelTimer() {
        timer?.invalidate()
        timer = nil
        lastTimeDepartedLabel.text = presentTimeLabel.text
        presentTimeLabel.text = destinationTimeLabel.text
        currentSpeed = 0
        showAlert()
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: speedUpdate(timer:))
    }
    
    func speedUpdate(timer: Timer) {
        if currentSpeed >= 88 {
            cancelTimer()
        }
        currentSpeed += 1
        updateViews()
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
        if let vc = segue.destination as? DatePickerViewController {
            vc.delegate = self
        
        destinationTimeLabel.text = delegate(destinationDateWasChosen(date: Date()))
    }
    // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    
    @IBAction func setDestinationTapped(_ sender: UIButton) {
        
    }
    @IBAction func travelBackButtonTapped(_ sender: UIButton) {
        startTimer()
    }
    private func showAlert() {
        let alert = UIAlertController(title: "Time Travel Successful!", message: "Your new date is \(presentTimeLabel.text ?? "Nowhere have you gone.")", preferredStyle: .alert)
           
           alert.addAction(UIAlertAction(title: "Travel some more.", style: .default, handler: nil))
           self.present(alert, animated: true, completion: nil)
       }
    
}

extension TimeCircuitViewController: DatePickerDelegate {
    func destinationDateWasChosen(date: Date) {
        
    }
}
