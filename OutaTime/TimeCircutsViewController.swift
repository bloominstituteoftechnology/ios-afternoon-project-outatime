//
//  TimeCircutsViewController.swift
//  OutaTime
//
//  Created by Lambda_School_Losaner_256 on 1/29/20.
//  Copyright © 2020 Benglobal Creative. All rights reserved.
//

import UIKit

class TimeCircutViewController: UIViewController {
    
    var timer: Timer? = nil
    var currentSpeed: Int = 0
    
    var dateFormatter: DateFormatter {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd yyyy"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        return formatter
    }
    
    @IBOutlet weak var destinationTimeLabel: UILabel!
    @IBOutlet weak var presentTimeLabel: UILabel!
    @IBOutlet weak var lastTimeDepartedLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    
    @IBAction func travelBackTapped(_ sender: UIButton) {
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: updateSpeed(timer:))
    }
    
    
    func resetTimer(){
        timer?.invalidate()
        timer = nil
        
        
        
        var destinationDate: Date?
        
        
        
        let now = Date()
        
        
        
    }
    
    func dateString(date: Date) -> String {
        let timeRightNow = dateFormatter.string(from: date)
        return timeRightNow
        
    }
    
    func showAlert(){
        let alert = UIAlertController(title: "Time Travel Successful",message: "You're new date is \( presentTimeLabel.text!)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true,
                completion: nil)
    }
    
    func updateSpeed(timer: Timer) {
        if currentSpeed < 88{
            currentSpeed += 1
            speedLabel.text = "\(currentSpeed) MPH"
        } else {
            resetTimer()
            lastTimeDepartedLabel.text = presentTimeLabel.text
            presentTimeLabel.text = destinationTimeLabel.text
            currentSpeed = 0
            speedLabel.text = "0 MPH"
            showAlert()
            
            
            
            
            func updateViews() {
                presentTimeLabel.text = dateString(date: Date())
                speedLabel.text = "\(currentSpeed) MPH"
                lastTimeDepartedLabel.text = "--- -- ----"
            }
            
            
            func viewDidLoad() {
                super.viewDidLoad()
                
                updateViews()
                
                // Do any additional setup after loading the view.
            }
            
            func prepare(for segue: UIStoryboardSegue, sender: Any?) {
                if segue.identifier == "ModalDestinationDatePickerSegue"{
                    if let datePickerVC = segue.destination as? DatePickerViewController{
                        datePickerVC.delegate = (self as! DatePickerDelegate)
                        
                    }
                }
            }
        }
    }
}

extension TimeCircutViewController: DatePickerDelegate {
func destinationDateWasChosen(date: Date) {
    destinationTimeLabel.text = dateFormatter.string(from: date)
}
}
