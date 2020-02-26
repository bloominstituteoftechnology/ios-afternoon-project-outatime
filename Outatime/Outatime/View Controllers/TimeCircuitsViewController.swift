//
//  TimeCircuitsViewController.swift
//  Outatime
//
//  Created by Lambda_School_Loaner_259 on 2/26/20.
//  Copyright © 2020 DeVitoC. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet var destinationTimeLabel: UILabel!
    @IBOutlet var presentTimeLabel: UILabel!
    @IBOutlet var lastTimeLabel: UILabel!
    @IBOutlet var speedLabel: UILabel!
    
    // MARK: - Properties
    var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd yyyy"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        return formatter
    }()
    var speed: Int = 0
    var timer: Timer?
    
    
    // MARK: - IBActions
    @IBAction func travelBackButton(_ sender: Any) {
        startTimer()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presentTimeLabel.text = dateFormatter.string(from: Date())
        speedLabel.text = "\(speed) MPH"
        lastTimeLabel.text = "--- -- ----"
        // Do any additional setup after loading the view.
    }
    
    // MARK: - CRUD sort of
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: updateSpeed(timer: ))
    }
    
    func resetTimer() {
        timer?.invalidate()
        speedLabel.text = "\(0) MPH"
        timer = nil
    }
    
    func updateSpeed(timer: Timer) {
        if speed < 88 {
            speed += 1
            speedLabel.text = "\(speed) MPH"
        } else {
            resetTimer()
            lastTimeLabel.text = presentTimeLabel.text
            presentTimeLabel.text = destinationTimeLabel.text
            speed = 0
            let alert = UIAlertController(title: "Time Travel Successful!", message: "Your new date is \(presentTimeLabel.text ?? "")", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(okAction)
            
            self.present(alert, animated: true, completion: nil)
        }
    }

    // MARK: - Navigation


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ModalDestinationDatePickerSegue" {
            let datePickerVC = segue.destination as! DatePickerViewController
            datePickerVC.delegate = self
        }
    }


}

extension TimeCircuitsViewController: DatePickerDelegate {
    func destinationDateWasChosen(date: Date) {
        destinationTimeLabel.text = dateFormatter.string(from: date)
    }
    
    
}
