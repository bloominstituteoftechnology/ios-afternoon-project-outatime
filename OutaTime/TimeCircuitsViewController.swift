//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by Austin Potts on 8/21/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {

    
    
    @IBOutlet weak var destinationTimeLabel: UILabel!
    @IBOutlet weak var presentTimeLabel: UILabel!
    @IBOutlet weak var lastTimeDepartedLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    
    
    var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss.SS"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        return formatter
    }()
    
    
    
    var currentSpeed = 0
    var timer:Timer?
    
    
    @IBAction func travelBackTapped(_ sender: Any) {
        startTimer()
    }
    
    func startTimer(){
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: updateSpeed(timer:))
    }
    
    func updateSpeed(timer: Timer){
        if currentSpeed != 88 {
            currentSpeed += 1
            speedLabel.text = String(currentSpeed)
        } else if currentSpeed == 88 {
            cancelTimer()
            lastTimeDepartedLabel.text = presentTimeLabel.text
            presentTimeLabel.text = destinationTimeLabel.text
            currentSpeed = 0
            showAlert()
            
        }
    }
    
    
    private func showAlert() {
        let alert = UIAlertController(title: "Time Travel Success", message: "Your new date is", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    func cancelTimer() {
        // We must invalidate a timer, or it will continue to run even if we
        // start a new timer
        timer?.invalidate()
        timer = nil
            }
    
    @IBAction func setDestinationTime(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        
        presentTimeLabel.text = dateFormatter.string(from: Date())
        
        speedLabel.text = "\(currentSpeed)MPH"
        
        lastTimeDepartedLabel.text = "--- -- ----"
        
        destinationTimeLabel.text = dateFormatter.string(from: Date())
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let VC = segue.destination as? DatePickerViewController {
            VC.delegate = self
        }
    }
    
    

}


extension TimeCircuitsViewController: DatePickerDelegate {
    func destinationWasChosen(_ Date: Date) {
        destinationTimeLabel.text = dateFormatter.string(from: Date)
        
        
    }
    
}
