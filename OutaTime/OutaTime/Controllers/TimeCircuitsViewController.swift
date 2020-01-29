//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by alfredo on 12/10/19.
//  Copyright © 2019 alfredo. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {

   //Mark: - IBOutlets
    @IBOutlet weak var destinationLabel: UILabel!
    @IBOutlet weak var presentTimeLabel: UILabel!
    @IBOutlet weak var lastTimeLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    
    //Create a computed property called dateFormatter that is of type DateFormatter and initialize it with correct formatting rules (see how we did this in the guided project for help. Use this link to decide what formatting symbols to use).
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, yyyy"
        formatter.timeZone = .current
        return formatter
    }
    //Create a variable property to store the current speed and set it to 0.
    var currentSpeed = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        //Set the label that shows the present time on screen to the current date using the date formatter.
        let date: Date = Date()
        presentTimeLabel.text = dateFormatter.string(from: date)
        //Set the speed label to show the current speed, with "MPH" appended to the end of the string.
        speedLabel.text = String(currentSpeed) + " MPH"
        //Set the label showing the last time departed to "--- -- ----".
        lastTimeLabel.text = "--- -- ----"
    }
    //Set the DatePickerViewController object's delegate as the TimeCircuitsViewController object in the prepare method.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ModalDestinationDatePickerSegue" {
            if let datePickerVC = segue.destination as? DatePickerViewController {
                datePickerVC.delegate = self
            }
        }
    }
    func updateView() {
          speedLabel.text = "\(currentSpeed) MPH"
          
      }
    func showAlert() {
           guard let destinationTime = destinationLabel.text else { return }
           let alert = UIAlertController(title: "Time Travel Successful", message: "You're new date is \(destinationTime)", preferredStyle: .alert)
           alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
           present(alert, animated: true, completion: nil)
       }
    //In the updateSpeed method:
    func updateSpeed(timer: Timer) {
        if currentSpeed < 88 {
            currentSpeed += 5
            speedLabel.text = "\(currentSpeed)"
        } else {
            resetTimer()
            lastTimeLabel.text = presentTimeLabel.text
            presentTimeLabel.text = destinationLabel.text
            currentSpeed = 0
            showAlert()
        }
        updateView()
    }
    //TIMER
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
    
    //Mark: - IBActions
    @IBAction func travelBackButton(_ sender: Any) {
        //Call a method startTimer in the IBAction that is called when the travel back button is tapped
        startTimer()
    }
}

extension TimeCircuitsViewController: DatePickerDelegate{
    func destinationDateWasChosen(date: Date) {
        // Set the destinationTimeLabel with the date received from the picker view controller using the date formatter object in the destinationDateWasChosen method.
        destinationLabel.text = dateFormatter.string(from: date)
      }
}
