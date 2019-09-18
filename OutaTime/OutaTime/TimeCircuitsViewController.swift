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
    
    var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, yyyy"
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
        presentTimeLabel.text = dateFormatter.string(from: Date())
    }
    
    //MARK: Timer & Speed Method
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: updateSpeed(timer:))
    }
    
    func resetTimer() {
        timer.invalidate()
    }
    
    func updateSpeed(timer: Timer) {
        if currentSpeed < 88 {
            currentSpeed += 1
            speedLabel.text = "\(currentSpeed) MPH"
        } else {
            speedLabel.text = "\(currentSpeed) MPH"
            currentSpeed = 0
            lastTimeLabel.text = presentTimeLabel.text
            presentTimeLabel.text = destinationTimeLabel.text
            let alert = UIAlertController(title: "Time Travel Successful", message: "Your new date is \(presentTimeLabel.text ?? "")", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
            resetTimer()
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
        }
    }
    
extension TimeCircuitsViewController: DatePickerDelegate {
    func destinationDateWasChosen(date: Date) {
        destinationTimeLabel.text = dateFormatter.string(from: date)
    }
}
