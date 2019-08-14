//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by Joseph Rogers on 8/13/19.
//  Copyright © 2019 Joe Rogers. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {
    
    

    
    @IBOutlet weak var destinationTimeLabel: UILabel!
    @IBOutlet weak var presentTimeLabel: UILabel!
    @IBOutlet weak var lastTimeDepartedLabel: UILabel!
    @IBOutlet weak var milesPerHourLabel: UILabel!
    
    var currentSpeed = 0
    var timer: Timer?
    
    var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd yyyy"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        return formatter
    }()
    
    
    func updateViews(){
        presentTimeLabel.text = dateFormatter.string(from: Date())
        milesPerHourLabel.text = "\(currentSpeed) MPH"
        lastTimeDepartedLabel.text = "--- -- ----"
    }
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    
    
    @IBAction func destinationTimeAction(_ sender: UIButton) {
        
    }
    
    @IBAction func travelBackAction(_ sender: UIButton) {
        timeStart()
    }
  

    
     // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ModalDestinationDatePickerSegue" {
            if let vc = segue.destination as? DatePickerViewController {
                vc.delegate = self
            }
        }
    }
    
    func timeStart() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { (timer) in
            self.updateSpeed()
        }
    }
    
    func updateSpeed() {
        milesPerHourLabel.text = "\(currentSpeed) MPH"
        if currentSpeed < 88 {
            currentSpeed += 1
        } else {
            timer?.invalidate()
            lastTimeDepartedLabel.text = presentTimeLabel.text
            presentTimeLabel.text = destinationTimeLabel.text
            
            let alert = UIAlertController(title: "Time Travel Successful!", message: "Your new date is \(presentTimeLabel.text ?? "Nowhere Buddy").", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true)
            currentSpeed = 0
        }
    }


}
extension TimeCircuitsViewController: DatePickerDelegate {
    func destinationDateWasChosen(for date: Date) {
        destinationTimeLabel.text = dateFormatter.string(from: date)
    }
}
