//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by Bradley Diroff on 2/26/20.
//  Copyright © 2020 Bradley Diroff. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {

    @IBOutlet var destinationText: UILabel!
    @IBOutlet var presentText: UILabel!
    @IBOutlet var departedText: UILabel!
    @IBOutlet var speedText: UILabel!
    
    @IBOutlet var travelBackButton: UIButton!
    
    @IBAction func travelBackTapped(_ sender: UIButton) {
        startTimer()
    }
    
    let dateFormatter: DateFormatter = {
         let formatter = DateFormatter()
         formatter.dateFormat = "MMM d yyyy"
         formatter.timeZone = TimeZone(secondsFromGMT: 0)
         return formatter
     }()
    
    var currentSpeed = 0
    var myTimer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let timeNow = Date()
        presentText?.text = dateFormatter.string(from: timeNow)
        speedText?.text = "\(currentSpeed) MPH"
        destinationText?.text = "--- -- ----"
        departedText?.text = "--- -- ----"
        
    }
    
    func startTimer() {
        myTimer = Timer(timeInterval: 0.1, repeats: true, block: updateSpeed(timer:))
        if let timer = myTimer {
            RunLoop.current.add(timer, forMode: .default)
        }
    }
    
    func updateSpeed(timer: Timer) {
        if currentSpeed < 88 {
            currentSpeed += 1
            speedText?.text = "\(currentSpeed) MPH"
        } else {
            resetTimer()
            departedText?.text = presentText?.text
            presentText?.text = destinationText?.text
            currentSpeed = 0
            showAlert()
        }
    }
    
    private func showAlert() {
        
        guard let lastText = presentText.text else {return}
        
        let alert = UIAlertController(title: "Time Travel Successful", message: "Your new date is \(lastText)", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        
        alert.addAction(okAction)
        
        present(alert, animated: true, completion: nil)
        
    }
    
    func resetTimer() {
        myTimer?.invalidate()
        myTimer = nil
    }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "ModalDestinationDatePickerSegue" {
        guard let datePickVC = segue.destination as? DatePickerViewController else {return}
                datePickVC.delegate = self
            }
    }
}

extension TimeCircuitsViewController: DatePickerDelegate {
    
    func destinationDateWasChosen(_ date: Date) {
        destinationText?.text = dateFormatter.string(from: date)
    }
}
