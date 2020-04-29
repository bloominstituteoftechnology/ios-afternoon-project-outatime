//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by Ian French on 4/28/20.
//  Copyright © 2020 Ian French. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {

   
    var currentSpeed: Int = 0
    var currentDate = Date()
    var timer: Timer?
    
    
    @IBOutlet weak var destinationLabel: UILabel!
    @IBOutlet weak var presentLabel: UILabel!
    @IBOutlet weak var lastTimeLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    
    
    @IBAction func travelBackTapped(_ sender: Any) {
        
    startTimer()
        
    }
    
    
    
    func startTimer() {
       timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: updateSpeed(timer:))
    }
    
    
    
    func resetTimer() {
        // We must invalidate a timer, or it will continue to run even if we
               // start a new timer
               timer?.invalidate()
               timer = nil
    }
    
    
    
    func updateSpeed(timer: Timer) {
        if currentSpeed < 88 {
            currentSpeed += 1
            speedLabel.text = "\(currentSpeed)  MPH"
        } else {
            resetTimer()
            
            
            guard let presentTime = presentLabel.text  else
            { return }
            
            lastTimeLabel.text = presentLabel.text
            currentSpeed = 0
            

           func showAlert(){
            let alert = UIAlertController(title: "Time Travel Successful!", message: "Your new date is \(presentTime).", preferredStyle: .alert)
                        
                    alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                    present(alert, animated: true)
            
            }
            showAlert()
            
        }
        
    }
    

    
    
    
    
    
 var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, yyyy"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        return formatter
    } ()
    


    override func viewDidLoad() {
        super.viewDidLoad()
        
    presentLabel.text = dateFormatter.string(from: currentDate)
  
    speedLabel.text = "\(currentSpeed) MPH"
 
    lastTimeLabel.text = "___ __ ____"

        speedLabel.font = UIFont.monospacedDigitSystemFont(ofSize: speedLabel.font.pointSize, weight: .medium )
         
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ModalDestinationDatePickerSegue" {
            if let datePickerVC = segue.destination as?
                DatePickerViewController {
                datePickerVC.delegate = self
            }
        }
        
    }

}   // end of class


extension TimeCircuitsViewController: DatePickerDelegate {
    func destinationDateWasChosen(date: Date) {
        destinationLabel.text = dateFormatter.string(from: date)
    }
    
    
}
