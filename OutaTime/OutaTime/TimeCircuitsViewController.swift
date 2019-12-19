//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by Ufuk Türközü on 13.11.19.
//  Copyright © 2019 Ufuk Türközü. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {
    
    @IBOutlet weak var destinationTime: UILabel!
    @IBOutlet weak var presentTime: UILabel!
    @IBOutlet weak var lastTimeDeparted: UILabel!
    @IBOutlet weak var speed: UILabel!
    
    @IBAction func travelBack(_ sender: Any) {
        startTimer()
    }
    
    private var timer: Timer?
    
    var destinationDate: Date?
    
    private var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd yyyy"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        return formatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getPresentTime()
        startTimer()
        
        // Do any additional setup after loading the view.
    }
    
    // FORMAT TIME

    func getPresentTime() {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd yyyy"
        presentTime.text = formatter.string(from: Date())
    }
    
    // FORMAT SPEED
    
    var currentSpeed = 0
    
    func updateSpeed(timer: Timer) {
        speed.text = "\(currentSpeed) MPH"
        if currentSpeed < 88 {
            currentSpeed += 1
            speed.text = "\(currentSpeed) MPH"
        } else {
            //stopTimer()
            lastTimeDeparted.text = presentTime.text
            currentSpeed = 0
            showAlert()
        }
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: false, block: updateSpeed(timer:))
    }
    
    func resetTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    private func showAlert() {
        
        let alert = UIAlertController(title: "Time Travel Successful!", message: "You're new date is \(String(describing: presentTime)).", preferredStyle: .alert)
        
        // now we need to add an action to our alert. A message that shows on the screen. The handler is called the completion handler. The alert controller is going to call it when the button is pressed. Now we dont want to do anything when the button is pressed, we want the alert controller to go away. That is why we choose nil. The last part of the code "completion: nil" is run whenever the alert is finished presenting. But since we dont anything to happen, we choose nil.
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
        // Spencer: let okAction = UIAlertController(title: "OK", style: .default, handler: nil)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
       if segue.identifier == "PickerVCSegue" {
            if let datePickerVC = segue.destination as? DatePickerViewController {
                datePickerVC.delegate = self
            }
        
        }
        
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}

extension TimeCircuitsViewController: DatePickerDelegate {
    func destinationDateWasChosen(chosenDate: Date) {
        destinationDate = chosenDate
        destinationTime.text = dateFormatter.string(from: chosenDate)
    }
}

