//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by Joel Groomer on 8/13/19.
//  Copyright © 2019 Julltron. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {

    @IBOutlet weak var lblDestinationDate: UILabel!
    @IBOutlet weak var lblPresentDate: UILabel!
    @IBOutlet weak var lblLastDepartedDate: UILabel!
    @IBOutlet weak var lblCurrentSpeed: UILabel!
    
    var currentSpeed: Int = 0
    var timer: Timer?
    
    var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd yyyy"
        return formatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblPresentDate.text = dateFormatter.string(from: Date())
        lblCurrentSpeed.text = "\(currentSpeed) MPH"
        lblLastDepartedDate.text = "--- -- ----"
    }
    


    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ModalDestinationDatePickerSegue" {
            if let vc = segue.destination as? DatePickerViewController {
                vc.delegate = self
            }
        }
    }

    
    @IBAction func travelBackTapped(_ sender: Any) {
        startTimer()
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { (timer) in
            self.updateSpeed()
        }
    }
    
    func updateSpeed() {
        lblCurrentSpeed.text = "\(currentSpeed) MPH"
        if currentSpeed < 88 {
            currentSpeed += 1
        } else {
            timer?.invalidate()
            lblLastDepartedDate.text = lblPresentDate.text
            lblPresentDate.text = lblDestinationDate.text
            
            let alert = UIAlertController(title: "Time Travel Successful!", message: "Your new date is \(lblPresentDate.text ?? "unknown").", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true)
            currentSpeed = 0
        }
    }
}

extension TimeCircuitsViewController: DatePickerDelegate {
    func destinationDateWasChosen(_ date: Date) {
        lblDestinationDate.text = dateFormatter.string(from: date)
    }
}
