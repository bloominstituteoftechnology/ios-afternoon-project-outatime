//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by Keri Levesque on 1/29/20.
//  Copyright © 2020 Keri Levesque. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {
// create outlets
    @IBOutlet weak var destinationTime: UILabel!
    
    @IBOutlet weak var presentTime: UILabel!
    
    @IBOutlet weak var lastTimeDeparted: UILabel!
    
    @IBOutlet weak var speed: UILabel!
    
   
   // computed property type DateFormatter
    var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, yyyy"
        formatter.timeZone = .current
        return formatter
    }()
    //variable property to store the current speed
    var currentSpeed = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // set the label that shows present time to current date using the dateFormatter
        let date: Date = Date()
        presentTime.text = dateFormatter.string(from: date)
        // set speed label to show the current speed with "MPH" appended string
        speed.text = String(currentSpeed) + " MPH"
        // set the label showing the last time departed to "--- -- ----"
        lastTimeDeparted.text = "--- -- ----"
    }
    //Set the DatePickerViewController object's delegate as the TimeCircuitsViewController object in the prepare method.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      if segue.identifier == "ModalDestinationDatePickerSegue" {
               if let datePickerVC = segue.destination as? DatePickerViewController {
                   datePickerVC.delegate = self
               }
           }
    }
    // update views method
    func updateView() {
          speed.text = "\(currentSpeed) MPH"
          
      }
    // show alert method
    func showAlert() { // realized i shouldn't have named the label destination time
           guard let destinationTIME = destinationTime.text else { return }
           let alert = UIAlertController(title: "Time Travel Successful", message: "You're new date is \(destinationTIME)", preferredStyle: .alert)
           alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
           present(alert, animated: true, completion: nil)
       }
    //the updateSpeed method:
       func updateSpeed(timer: Timer) {
           if currentSpeed < 88 {
               currentSpeed += 5
               speed.text = "\(currentSpeed)"
           } else {
               resetTimer()
               lastTimeDeparted.text = presentTime.text
               presentTime.text = destinationTime.text
               currentSpeed = 0
               showAlert()
           }
           updateView()
       }
   
    private var timer: Timer?
      // In the resetTimer method, stop the timer (there is a method you can call to do this, see our project from today) and then set it to nil.
        private func resetTimer() {
            timer?.invalidate()
            timer = nil
            
        }
      //In the startTimer method, initialize the timer object for a 0.1 sec time interval. Set it to fire a method that updates the speed label.
      private func startTimer() {
          resetTimer()
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: updateSpeed(timer:))
          
      }
    
    
    @IBAction func travelBackButton(_ sender: UIButton) {
         //Call a method startTimer in the IBAction that is called when the travel back button is tapped
        startTimer()
      }
    
    
    
}
// create extension at the bottom of the file, make it conform to the protocol 
extension TimeCircuitsViewController: DatePickerDelegate {
    func destinationDateWasChosen(date: Date) {
        //Set the destinationTimeLabel with the date received from the picker view controller using the date formatter object in the destinationDateWasChosen method.
        destinationTime.text = dateFormatter.string(from: date)
    }
}
