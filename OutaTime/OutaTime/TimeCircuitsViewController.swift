//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by Morgan Smith on 12/10/19.
//  Copyright © 2019 Morgan Smith. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {
    
    @IBOutlet weak var destinationTimeLabel: UILabel!
    
    @IBOutlet weak var presentTimeLabel: UILabel!
    
    @IBOutlet weak var lastTimeDeparted: UILabel!
    
    @IBOutlet weak var Speed: UILabel!
    
    @IBAction func setDestinationTime(_ sender: Any) {
    }
    
    @IBAction func travelBack(_ sender: Any) {
        startTimer()
    }
    
    private func showAlert() {
        
        let alert = UIAlertController(title: "Time Travel Successfull", message: "Your new date is \(presentTimeLabel.text).", preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    var currentSpeed = 0
    private var timer: Timer?
    
    func startTimer() {
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block: updateSpeed(timer:))
    }
    
    func reset() {
        timer?.invalidate()
        timer = nil
    }
 
    
    private func updateSpeed(timer: Timer) {
        if currentSpeed <= 88 {
            currentSpeed += 1
            viewDidLoad()
        } else {
            lastTimeDeparted.text = presentTimeLabel.text
            presentTimeLabel.text = destinationTimeLabel.text
            currentSpeed = 0
            showAlert()
            viewDidLoad()
        }
    }
    
     var dateFormatter: DateFormatter {
     let formatter = DateFormatter()
     formatter.dateFormat = "MMM dd, yyyy"
     formatter.timeZone = TimeZone(secondsFromGMT: 0)
     return formatter
     }
     
     var thePresentTime: String {
     let now = Date()
     let dateString = dateFormatter.string(from: now)
     return dateString
     }
 
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        presentTimeLabel.text = thePresentTime
        Speed.text = "\(currentSpeed)" + "MPH"
        lastTimeDeparted.text = "--- -- ----"
    }
    
    
    
     // MARK: - Navigation
     

     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
  if segue.identifier == "ModalDestinationDatePickerSegue" {
      if let addDate = segue.destination as? DatePickerViewController {
          addDate.delegate = self
      }
  }
     }
     
    
}
extension TimeCircuitsViewController: DatePickerDelegate {
    
    func destinationDateWasChosen(_ date: Date) {
        destinationTimeLabel.text = dateFormatter.string(from: date)
    }
    
}
