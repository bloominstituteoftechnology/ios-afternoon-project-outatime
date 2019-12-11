//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by Osha Washington on 12/10/19.
//  Copyright © 2019 Osha Washington. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {
    
    
    // MARK: - IBOutlets
    @IBOutlet weak var destinationTime: UILabel!
    @IBOutlet weak var presentTime: UILabel!
    @IBOutlet weak var lastTimeDeparted: UILabel!
    @IBOutlet weak var speed: UILabel!
    
    // MARK: - IBActions
    
    @IBAction func setButtonTapped(_ sender: UIButton) {
        speed.text = "0 MPH"
    }
    @IBAction func travelBackTapped(_ sender: UIButton) {
        startTimer()
    }
    
    // MARK: - Methods
    func startTimer() {
        if currentSpeed == 0 {
            timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block: updateSpeed(timer:))
        } else { currentSpeed = 0 }
    }
    func resetTimer() {
        timer?.invalidate()
        timer = nil
    }
     
    func updateSpeed(timer: Timer) {
        if currentSpeed < 88 {
            currentSpeed += 1
            speed.text = "\(currentSpeed) MPH"
            lastTimeDeparted.text = destinationTime.text
        }
        if currentSpeed == 88 {
            presentTime.text = destinationTime.text
            resetTimer()
        }
    }
    
    func dateFormat() -> String {
        let date = Date()
        return dateFormatter.string(from: date)
    }
    
    private var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd, yyyy"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
            return formatter
        }()
    
    let currentDate = Date()
    var currentSpeed = 0
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presentTime.text = dateFormat()
        speed.text = String("\(currentSpeed) MPH")
        lastTimeDeparted.text = "--- -- ----"
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
