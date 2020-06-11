//
//  ViewController.swift
//  Outatime
//
//  Created by John McCants on 6/9/20.
//  Copyright © 2020 John McCants. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {

    //MARK: -Outlets
    @IBOutlet weak var destinationTimeLabel: UILabel!
    @IBOutlet weak var presentTimeLabel: UILabel!
    @IBOutlet weak var lastTimeDepartedLabel: UILabel!
    @IBOutlet weak var mphLabel: UILabel!
    
    //MARK: -Variables & Constants
    var timer: Timer?
    var currentMPH : Int = 0
    
    private let dateFormatter: DateFormatter = {
           let formatter = DateFormatter()
           formatter.dateFormat = "MMMM dd, yyyy"
           formatter.timeZone = TimeZone(secondsFromGMT: 0)
           return formatter
       }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presentTimeLabel.text = dateFormatter.string(from: Date())
        mphLabel.text = "\(currentMPH) MPH"
        lastTimeDepartedLabel.text = "___ __ ____"
        destinationTimeLabel.text = presentTimeLabel.text
        
    }
    
    //MARK: -Functions
    func startTime() {
        self.timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: updateSpeedLabel(timer:))
        
    }
    
    func resetTime() {
        timer?.invalidate()
        currentMPH = 0
        mphLabel.text = "\(currentMPH)"
        lastTimeDepartedLabel.text = presentTimeLabel.text
        presentTimeLabel.text = destinationTimeLabel.text
        
    }
    
    func updateSpeedLabel(timer: Timer) {
        if currentMPH == 88 {
            resetTime()
            
            guard let unwrappedLabelText = presentTimeLabel.text else {return}
            showAlert(label: unwrappedLabelText)
        } else {
            currentMPH += 1
            mphLabel.text = "\(currentMPH)"
        }
    }
    
    func showAlert(label: String) {
        let alert = UIAlertController(title: "Time Travel Successful", message: "You're new date is \(label)", preferredStyle: .alert)
           let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
           alert.addAction(okAction)
           present(alert, animated: true, completion: nil)
       }
    
    func showTravelBackAlert() {
        let alert = UIAlertController(title: "Broken Delorean", message: "Please contact customer support. If you traveled back in time then there's nothing we can do cause we don't exist yet.", preferredStyle: .actionSheet)
        let action = UIAlertAction(title: "Got it", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true)
    }
    
    
    @IBAction func setTimeTapped(_ sender: Any) {
        startTime()
    }
    

    @IBAction func travelBackTapped(_ sender: Any) {
        showTravelBackAlert()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "ModalDestinationDatePickerSegue" {
            
        guard let destinationVC = segue.destination as? DatePickerViewController else {
            return
        }
        destinationVC.delegate = self
    }
    }

}

extension TimeCircuitsViewController: DatePickerDelegate {
    func destinationDateWasChosen(date: Date) {
        destinationTimeLabel.text = dateFormatter.string(from: date)
    }
}

