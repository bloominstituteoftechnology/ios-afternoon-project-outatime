//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by macbook on 9/18/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var destinationTimeLabel: UILabel!
    @IBOutlet weak var presentTimeLabel: UILabel!
    @IBOutlet weak var lastTimeDepartedLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    
    
    // MARK: - Properties
     var currentSpeed = 0
    
    var timer: Timer?
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        
        formatter.dateFormat = "MM-dd-yyyy"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        
        return formatter
    }
    
    var destinationDate: Date?
    

    
    // VIEW DID LOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        presentTimeLabel.text = dateFormatter.string(from: Date())
        speedLabel.text = "\(currentSpeed) MPH"
        lastTimeDepartedLabel.text = "--- -- ----"
    }
    
    
    
    
    
    // IBAction
    @IBAction func travelBackButton(_ sender: UIButton) {
        startTimer()
        
    }
    
    
    func startTimer () {
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: updateSpeed(timer:))
        
        
    }
    
    
    func resetTimer() {
    
        timer?.invalidate()
        timer = nil
    }
    
    
    func updateSpeed(timer: Timer) {
        
        if currentSpeed <= 88 {
            currentSpeed += 1
            speedLabel.text = String(currentSpeed)
        } else {
            resetTimer()
            lastTimeDepartedLabel.text = presentTimeLabel.text
            presentTimeLabel.text = destinationTimeLabel.text
            currentSpeed = 0
            showAlert()
            
        }
        
    }
    
    
    
    private func showAlert() {
        let alert = UIAlertController(title: "Time Travel Successful", message: "Your new date is \(presentTimeLabel.text)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
        
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "ModalDestinationDatePickerSegue" {
            
            if let datePickerVC = segue.destination as? DatePickerViewController {
                datePickerVC.delegate = self

            }
            
        }
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
 

} // class


// Conforming to the DatePickerDelegate protocol
extension TimeCircuitsViewController: DatePickerDelegate {
    
    func destinationDateWasChosen(date: Date) {
        destinationDate = date
        destinationTimeLabel.text = dateFormatter.string(from: date)
        //updateViews()
    }
    
    
}
