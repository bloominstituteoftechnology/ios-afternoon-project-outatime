//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by Claudia Contreras on 2/18/20.
//  Copyright © 2020 thecoderpilot. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet var destinationTimeLabel: UILabel!
    @IBOutlet var presentTimeLabel: UILabel!
    @IBOutlet var lastTimeDepartedLabel: UILabel!
    @IBOutlet var speedLabel: UILabel!
    
    
    //MARK: - Properties
    var dateFormatter: DateFormatter = {
       let formatter = DateFormatter()
        formatter.dateFormat = "MMM d yyyy"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        return formatter
    }()
    
    var speed = 0
    var timer: Timer? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Set presentDateLabel
        let date = Date()
        presentTimeLabel.text = dateFormatter.string(from: date)
        
        //Set speedLabel
        speedLabel.text = "\(speed) MPH"
        
        //Set lastTimeDepartedLabel
        lastTimeDepartedLabel.text = "--- -- ----"
    }
    

    //MARK: - IBAction
    @IBAction func setDestinationTimeTapped(_ sender: Any) {
    }
    
    @IBAction func travelBackTapped(_ sender: Any) {
        startTimer()
    }
    
    func startTimer() {
        resetTimer()
        timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block: updateSpeedLabel(timer:))
    }
    
    func resetTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    func updateSpeedLabel(timer: Timer) {
        if speed <= 88 {
            speed += 1
            speedLabel.text = String(speed)
        } else {
            resetTimer()
            lastTimeDepartedLabel.text = presentTimeLabel.text
            presentTimeLabel.text = destinationTimeLabel.text
            speed = 0
            showAlert()
        }
        
    }
    
    private func showAlert() {
        //create the alert message
        let alert = UIAlertController(title: "Time Travel Successful", message: "Your new date is \(presentTimeLabel.text ?? "today").", preferredStyle: .alert)
        
        //Action to be performed
        let okAction = UIAlertAction(title: "Okay", style: .cancel, handler: nil)
        
        //add our action to our alert
        alert.addAction(okAction)
        
        //show the alert
        self.present(alert, animated: true, completion: nil)
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ModalDestinationDatePickerSegue"{
            let datePickerVC = segue.destination as! DatePickerViewController
            datePickerVC.delegate = self
            
        }
    }

}

//MARK: - Extensions
extension TimeCircuitsViewController: DatePickerDelegate {
    func destinationDateWasChosen(_ date: Date) {
        destinationTimeLabel.text = dateFormatter.string(from: date)
    }
    
    
}
