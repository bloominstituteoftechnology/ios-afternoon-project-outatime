//
//  TimeCurcuitViewController.swift
//  OutaTime
//
//  Created by Chris Gonzales on 1/29/20.
//  Copyright © 2020 Chris Gonzales. All rights reserved.
//

import UIKit

class TimeCurcuitViewController: UIViewController {
    
    var speed: Int = 0
    var timer: Timer? = nil
    
    var dateFormatter: DateFormatter{
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, yyyy"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        return formatter
    }
    
    @IBOutlet weak var destinationDateLabel: UILabel!
    @IBOutlet weak var presentDateLabel: UILabel!
    @IBOutlet weak var lastDateLabel: UILabel!
    @IBOutlet weak var mPHLabel: UILabel!
    
    @IBAction func travelBackTapped(_ sender: UIButton) {
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: updateSpeed(timer:)
        )}
    func resetTimer(){
        timer?.invalidate()
        timer = nil
    }
    
    func updateSpeed(timer: Timer){
        if speed < 88{
            speed += 1
            mPHLabel.text = "\(speed) MPH"
        }else {
            resetTimer()
            lastDateLabel.text = presentDateLabel.text
            presentDateLabel.text = destinationDateLabel.text
            speed = 0
            mPHLabel.text = "0 MPH"
            showAlert()
       
        }
    }
    
    func showAlert(){
        let alert = UIAlertController(title: "Time Travel Successful",message: "You're new date is \( presentDateLabel.text!)", preferredStyle: .alert)
                   alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                   present(alert, animated: true,
                           completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presentDateLabel.text = dateFormatter.string(from: Date())
        mPHLabel.text = "\(speed) MPH"
        lastDateLabel.text = " --- -- ----"
        
    }
    
    // MARK: - Navigation
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ModalDestinationDatePickerSegue"{
            if let datePickerVC = segue.destination as? DatePickerViewController{
                datePickerVC.delegate = self
//                if let destLabel = destinationDateLabel.text{
//                    destLabel = dateFormatter.string(from: datePickerVC.datePicker.date)
//                }
            }
        }
        
        
    }
    
    
}


extension TimeCurcuitViewController: DatePickerDelegate{
    func destinationDateWasChosen(date: Date) {
        destinationDateLabel.text = dateFormatter.string(from: date)
    }
    
    
}
