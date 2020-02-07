//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by Jonalynn Masters on 9/18/19.
//  Copyright © 2019 Jonalynn Masters. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {

    //MARK: Properties
    var currentSpeed: Int = 0
    var timer = Timer()
    var datePickerVC = DatePickerViewController()
    
    var dateFormatter: DateFormatter = { // computed property initialized with correct formatting rules
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, yyyy" // found in the unicode table
        return formatter
    }()
    
    //MARK: Outlets
    @IBOutlet var destinationTimeLabel: UILabel!
    @IBOutlet var presentTimeLabel: UILabel!
    @IBOutlet var lastTimeLabel: UILabel!
    @IBOutlet var speedLabel: UILabel!
    @IBOutlet var setDestinationTimeButton: UIButton!
    @IBOutlet var travelBackButton: UIButton!
    
    
    //MARK: View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presentTimeLabel.text = dateFormatter.string(from: Date()) // set the label that shows the present time on screen to the current date using the date formatter
    }
    
    //MARK: Timer & Speed Method
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: updateSpeed(timer:))
    }
    
    func resetTimer() {
        timer.invalidate() //there is another way to do this with nil but this works
    }
    
    func updateSpeed(timer: Timer) { // check speed, if it's not at 88 count up by 1
        if currentSpeed < 88 {
            currentSpeed += 1
            speedLabel.text = "\(currentSpeed) MPH" // set label with current speed
        } else {
            speedLabel.text = "\(currentSpeed) MPH"
            currentSpeed = 0
            lastTimeLabel.text = presentTimeLabel.text //Update the value of the lastTimeDepartedLabel with the value from the presentTimeLabel
            presentTimeLabel.text = destinationTimeLabel.text // Update the value of the presentTimeLabel with the value from the destinationTimeLabel
            
            let alert = UIAlertController(title: "Time Travel Successful", message: "Your new date is \(presentTimeLabel.text ?? "")", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil) // Show an alert with a title and message with the present time
            resetTimer() //reset timer to 0 
        }
    }
    
    //MARK: IBAction
    @IBAction func travelBackButtonTapped(_ sender: UIButton) {
        startTimer()
    }
    
    //MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let datePickerVC = segue.destination as? DatePickerViewController else { return }
        datePickerVC.delegate = self
        } //(Set the DatePickerViewController object's delegate as the TimeCircuitsViewController object in the prepare method)
    }
    
//MARK: extension: make the class conform to the protocol from the date picker view controller (That means listing it after the VC's class name and at least stubbing out the required delegate functions)
extension TimeCircuitsViewController: DatePickerDelegate {
    func destinationDateWasChosen(date: Date) {
        destinationTimeLabel.text = dateFormatter.string(from: date) // set with the date received from the picker
    }
}
