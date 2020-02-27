//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by Shawn James on 2/26/20.
//  Copyright © 2020 Shawn James. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {

    // MARK: - PROPERTIES
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd yyyy"
        return formatter
    }()
    var currentSpeed = 0
    private var timer: Timer?
    
    // MARK: - OUTLETS
    @IBOutlet weak var destinationTimeLabel: UILabel!
    @IBOutlet weak var presentTimeLabel: UILabel!
    @IBOutlet weak var lastTimeDepartedLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        presentTimeLabel.text = dateFormatter.string(from: Date())
        speedLabel.text = String("\(currentSpeed) MPH")
    }
    
    // MARK: - ACTIONS
    @IBAction func travelBackButtonTapped(_ sender: UIButton) {
        startTimer()
    }
    
    
    // MARK: - NAVIGATION

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        if segue.identifier == "ModalDestinationDatePickerSegue" {
            // Pass the selected object to the new view controller.
            guard let datePickerVC = segue.destination as? DatePickerViewController else { return }
            datePickerVC.delegate = self
        }
    }
    
    // MARK: - FUNCTIONS
    
    private func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: updateSpeed(timer: ) )
    }
    
    private func resetTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    private func updateSpeed(timer: Timer) {
        if currentSpeed <= 88 {
            currentSpeed += 1
            // FIXME: - update the speed label with the current speed
        } else {
            resetTimer()
//            Update the value of the lastTimeDepartedLabel with the value from the presentTimeLabel.
            lastTimeDepartedLabel.text = presentTimeLabel.text
//            Update the value of the presentTimeLabel with the value from the destinationTimeLabel.
            presentTimeLabel.text = destinationTimeLabel.text
//            Reset the value of the current speed variable to 0.
            currentSpeed = 0
//            Show an alert view with a title "Time Travel Successful" and a message that says "You're new date is [insert present time here].".
            guard let date = presentTimeLabel.text else { return }
            showAlert(date: date)
        }
    }
    
    private func showAlert(date: String) {
        let alert = UIAlertController(title: "Travel Success", message: "Your new date is \(date)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Done", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
}

//  Create an extension of the class at the bottom of the file and make the class conform to the protocol from the date picker view controller (That means listing it after the VC's class name and at least stubbing out the required delegate functions).
extension TimeCircuitsViewController: DatePickerDelegate {
    func destinationDateWasChosen(date: Date) {
        destinationTimeLabel.text = dateFormatter.string(from: date)
    }
    
    
    
}
