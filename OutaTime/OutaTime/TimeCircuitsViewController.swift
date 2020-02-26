//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by Wyatt Harrell on 2/26/20.
//  Copyright © 2020 Wyatt Harrell. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {

    @IBOutlet weak var destinationTimeLabel: UILabel!
    @IBOutlet weak var presentTimeLabel: UILabel!
    @IBOutlet weak var lastTimeDepartedLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    
    
    @IBOutlet weak var setDestinationButton: UIButton!
    @IBOutlet weak var travelBackButton: UIButton!
    
    
    var speed = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let presentDate = Date()
        presentTimeLabel.text = dateFormatter.string(from: presentDate)
        speedLabel.text = "\(speed) MPH"
        lastTimeDepartedLabel.text = "--- -- ----"
        destinationTimeLabel.text = "--- -- ----"
        setDestinationButton.layer.cornerRadius = 8
        travelBackButton.layer.cornerRadius = 8
        
    }
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, yyyy"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        return formatter
    }()
    
    @IBAction func travelBackButtonTapped(_ sender: Any) {
        startTimer()
    }
    
    private var timer: Timer?
    
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: updateSpeedLabel(timer:))
    }
    
    func resetTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    func updateSpeedLabel(timer: Timer) {
        if speed == 88 {
            speedLabel.text = "\(speed) MPH"
            resetTimer()
            lastTimeDepartedLabel.text = presentTimeLabel.text
            presentTimeLabel.text = destinationTimeLabel.text
            speed = 0
            
            guard let presentTime = presentTimeLabel.text else { return }
            
            let alert = UIAlertController(title: "Time Travel Successful", message: "You're new date is \(presentTime)", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "Dismiss", style: .default, handler: nil)
            
            alert.addAction(alertAction)
            present(alert, animated: true, completion: nil)
            
            
        } else {
            speedLabel.text = "\(speed) MPH"
            speed += 1
        }
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "ModalDestinationDatePickerSegue" {
            guard let DatePickerVC = segue.destination as? DatePickerViewController else { return }
            
            DatePickerVC.delegate = self
        }
        
    }

}

extension TimeCircuitsViewController: DatePickerDelegate {
    func destinationDateWasChosen(date: Date) {
        destinationTimeLabel.text = dateFormatter.string(from: date)
    }
}
