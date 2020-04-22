//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by Enzo Jimenez-Soto on 4/22/20.
//  Copyright © 2020 Enzo Jimenez-Soto. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {

    @IBOutlet weak var destinationTimeLabel: UILabel!
  
    @IBOutlet weak var presentTimeLabel: UILabel!
    
    @IBOutlet weak var lastTimeDepartedLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    
    var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, yyyy"
        return formatter
    }()
    
    var currentSpeed = 0
    var timer: Timer? = nil
    
    @IBAction func travelBackButtonTapped(_ sender: UIButton) {
    
        startTimer()
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: updateSpeedLabel(timer:))
    }
    
    func resetTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    func updateSpeedLabel(timer: Timer) {
        currentSpeed += 1
        speedLabel.text = "\(currentSpeed) MPH"
        if currentSpeed >= 88 {
            resetTimer()
            lastTimeDepartedLabel.text = presentTimeLabel.text
            presentTimeLabel.text = destinationTimeLabel.text
            currentSpeed = 0
            speedLabel.text = "\(currentSpeed) MPH"
            showAlert()
        }
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "Time Travel Successful", message: "Your new date is \n \(presentTimeLabel.text ?? "")", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presentTimeLabel.text = dateFormatter.string(from: Date())
        speedLabel.text = "\(currentSpeed) MPH"
        lastTimeDepartedLabel.text = "--- -- ----"
        
    }

 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      
        
        if segue.identifier == "ModalDestinationDatePickerSegue" {
            guard let datePickerVC = segue.destination as? DatePickerViewController else {return}
          
            datePickerVC.delegate = self
        }
        
    }

}

extension TimeCircuitsViewController: DatePickerDelegate {

    func destinationDateWasChosen(date: Date) {
        destinationTimeLabel.text = dateFormatter.string(from: date)
        
    }
    
}
