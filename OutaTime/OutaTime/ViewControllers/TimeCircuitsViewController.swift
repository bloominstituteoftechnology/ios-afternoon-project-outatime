//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by Lambda_School_Loaner_259 on 2/18/20.
//  Copyright © 2020 DeVitoC. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {
    
    // MARK: IBOutlets
    @IBOutlet var destinationLabel: UILabel!
    @IBOutlet var presentLabel: UILabel!
    @IBOutlet var lastTimeLabel: UILabel!
    @IBOutlet var speedLabel: UILabel!
    
    // MARK: Properties
    var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd, yyyy"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        return formatter
    }()
    var speed = "0"
    let datePickerViewController = DatePickerViewController()
    private var timer: Timer?
    private var stopDate: Date?
    
    
    // MARK: IBActions
    @IBAction func setDestinationTapped(_ sender: Any) {
        
    }
    
    @IBAction func travelBackTapped(_ sender: Any) {
        startTimer()
    }
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presentLabel.text = dateFormatter.string(from: Date())
        speedLabel.text = speed + " MPH"
        destinationLabel.text = dateFormatter.string(from: Date())
        // Do any additional setup after loading the view.
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: false, block: updateSpeed(timer:))
        //stopDate = Date(timeIntervalSinceNow: duration)
    }
    
    func resetTimer() {
        stopDate = nil
        timer?.invalidate()
        timer = nil
    }
    
    func updateSpeed(timer: Timer) {
        speedLabel.text = speed + " MPH"
    }
    


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ModalDestinationDatePickerSegue" {
            if let datePickerVC = segue.destination as? DatePickerViewController {
                datePickerVC.delegate = self
            }
        }
    }

}

extension TimeCircuitsViewController: DatePickerDelegate {
    func destinationDateWasChosen(date: Date) {
        destinationLabel.text = dateFormatter.string(from: date)
    }
}
