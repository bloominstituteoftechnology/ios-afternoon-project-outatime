//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by Aaron Peterson on 4/27/20.
//  Copyright © 2020 Aaron Peterson. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {
    
    @IBOutlet weak var destinationTime: UILabel!
    @IBOutlet weak var presentTime: UILabel!
    @IBOutlet weak var lastTimeDeparted: UILabel!
    @IBOutlet weak var speed: UILabel!
    
    var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, yyyy"
        return formatter
    }()
    
    var timer: Timer?
    var currentSpeed = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presentTime.text = dateFormatter.string(from: Date())
        
        speed.text = String(currentSpeed) + " MPH"
        lastTimeDeparted.text = "--- -- ---"
    }
    
    @IBAction func travelBackTapped(_ sender: Any) {
        //countdown.start()
        startTimer()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let pickDateVC = segue.destination as? DatePickerViewController {
            pickDateVC.delegate = self
        }
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: updateSpeed(timer:))
    }
    
    func reset() {
        timer?.invalidate()
        timer = nil
    }

    func updateSpeed(timer: Timer) {
        if currentSpeed < 88 {
            currentSpeed += 1
            speed.text = String(currentSpeed)
        } else {
            lastTimeDeparted.text = presentTime.text
            presentTime.text = destinationTime.text
            currentSpeed = 0
            reset()
            showAlert()
        }
    }
    
    func showAlert() {
        if let present = presentTime.text {
            let alertmessage = "Your new date is \(present)"
            let alert = UIAlertController(title: "Time Travel Successful", message: alertmessage, preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            
            alert.addAction(okAction)
            
            self.present(alert, animated: true, completion: nil)
        }
    }

}

extension TimeCircuitsViewController: DatePickerDelegate {
    func destinationDateWasChosen(date: Date) {
        destinationTime.text = dateFormatter.string(from: date)
    }
    
}

