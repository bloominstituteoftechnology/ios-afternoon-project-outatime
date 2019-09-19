//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by Niranjan Kumar on 9/18/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {

    // Outlets & Actions:
    
    @IBOutlet weak var destinationTimeLabel: UILabel!
    @IBOutlet weak var presentTimeLabel: UILabel!
    @IBOutlet weak var lastTimeDepartedLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    
    @IBAction func travelBackTapped(_ sender: Any) {
        startTimer()
    }
    
    // Properties
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, yyyy"
        formatter.timeZone = .current
        return formatter
    }
    
    var speed = 0
    private var timer: Timer?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let date = Date()
        presentTimeLabel.text = dateFormatter.string(from: date)
        lastTimeDepartedLabel.text = "--- -- ----"
        
        updateView()
    }
    
    func updateView() {
        speedLabel.text = "\(speed) MPH"
        
    }
    
    
    func startTimer() {
        resetTimer()
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: updateSpeed(timer:))
        
    }
    
    func resetTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    
    func showAlert() {
        let alert = UIAlertController(title: "Time Travel Successful", message: "You're new date is \(String(describing: destinationTimeLabel.text))", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    
    
    func updateSpeed(timer: Timer) {
        
        if speed < 88 {
            speed += 2
            speedLabel.text = "\(speed)"
        } else {
            resetTimer()
            lastTimeDepartedLabel.text = presentTimeLabel.text
            presentTimeLabel.text = destinationTimeLabel.text
            speed = 0
            showAlert()
        }
        updateView()
    }
    


    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ModalDestinationDatePickerSegue" {
            guard let datePickerVC = segue.destination as? DatePickerViewController else { return }
            
            datePickerVC.delegate = self
            }
        }
    
    

}


extension TimeCircuitsViewController: DatePickerDelegate {
    func destinationDateWasChosen(date: Date) {
        destinationTimeLabel.text = dateFormatter.string(from: date)
    }
    
    
}
