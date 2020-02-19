//
//  TimeCircuitsViewController.swift
//  Outatime
//
//  Created by Juan M Mariscal on 2/17/20.
//  Copyright © 2020 Juan M Mariscal. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {

    @IBOutlet weak var destinationTimeLbl: UILabel!
    @IBOutlet weak var presentTimeLbl: UILabel!
    @IBOutlet weak var lastTimeDepartedLbl: UILabel!
    @IBOutlet weak var speedLbl: UILabel!
    
    var currentSpeed = 0
    var timer: Timer?
    
    var dateFormatter: DateFormatter = {
       let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd yyyy"

        return formatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        speedLbl.font = UIFont.monospacedDigitSystemFont(ofSize: speedLbl.font.pointSize, weight: .medium)
        updateViews()
        
    }
    
//    Alicia
//    168 7131
//    8779292637
//    ext 150 6441
    
    private func string(from date: Date) -> String{
        return dateFormatter.string(from: date)
        
    }
    
    private func updateViews() {
        let today = Date()
        presentTimeLbl.text = string(from: today)
        speedLbl.text = "\(currentSpeed) MPH"
        lastTimeDepartedLbl.text = "--- -- ----"
    }
    
    @IBAction func setDestinationBtnTapped(_ sender: Any) {
        
    }
    
    @IBAction func travelBackBtnTapped(_ sender: Any) {
        startTimer()
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: updateSpeed(timer:))
    }
    
    func resetTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    func updateSpeed(timer: Timer) {
        if currentSpeed == 88 {
            resetTimer()
            lastTimeDepartedLbl.text = presentTimeLbl.text
            presentTimeLbl.text = destinationTimeLbl.text
            currentSpeed = 0
            showAlert()
            
        } else {
            currentSpeed += 1
            speedLbl.text = "\(currentSpeed) MPH"
        }
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "You have succesfully Time Traveled!", message: "Current Date: \(presentTimeLbl.text ?? "Error")", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(okAction)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ModalDestinationDatePickerSegue" {
            if let destinationVC = segue.destination as? DatePickerViewController {
                destinationVC.delegate = self
            }
        }
    }
    

}

extension TimeCircuitsViewController: DatePickerDelegate {
    func destinationWasChosen(date: Date) {
        destinationTimeLbl.text = string(from: date)
    }


}
