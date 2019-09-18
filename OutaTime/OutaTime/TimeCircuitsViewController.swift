//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by admin on 9/18/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {

    @IBOutlet weak var destinationLabel: UILabel!
    @IBOutlet weak var presentLabel: UILabel!
    @IBOutlet weak var lastLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    
    let currentDate = Date()
    
    var currentSpeed = 0
    
    var timer: Timer?
    
    var dateFormatter: DateFormatter  {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d yyyy"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        return formatter
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let customFont = UIFont(name: "Digital-7", size: UIFont.labelFontSize) else { return }
        
        presentLabel.text = dateFormatter.string(from: currentDate)
        presentLabel.font = UIFontMetrics.default.scaledFont(for: customFont)
        speedLabel.text = "\(currentSpeed) MPH"
        speedLabel.font = UIFontMetrics.default.scaledFont(for: customFont)
        lastLabel.text = "___ __ ____"
        lastLabel.font = UIFontMetrics.default.scaledFont(for: customFont)


        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func travelBackButton(_ sender: UIButton) {
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
        if currentSpeed < 88 {
            currentSpeed += 1
            speedLabel.text = "\(currentSpeed) MPH"
        } else {
            resetTimer()
            guard let presentTime = presentLabel.text else { return }
            lastLabel.text = presentLabel.text
            currentSpeed = 0
            let alert = UIAlertController(title: "Time Travel Successful!", message: "Your new date is \(presentTime)", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ModalDestinationDatePickerSegue" {
            if let datePickerVC = segue.destination as? DatPickerViewController {
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
