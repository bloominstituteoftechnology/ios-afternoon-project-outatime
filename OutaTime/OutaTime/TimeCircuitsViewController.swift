//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by Enrique Gongora on 1/29/20.
//  Copyright © 2020 Enrique Gongora. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {
    
    //IBOutlets/Actions & Variables
    @IBOutlet weak var destinationTimeLabel: UILabel!
    @IBOutlet weak var presentTimeLabel: UILabel!
    @IBOutlet weak var lastTimeDepartedLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    @IBAction func travelBackPressed(_ sender: UIButton) {
        startTimer()
    }
    
    // MARK: - Properties
    var speed = 0
    var timer: Timer?
    private var dateFormatter: DateFormatter{
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, yyyy"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        return formatter
    }
    
    // MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presentTimeLabel.text = dateFormatter.string(from: Date())
        speedLabel.text = "\(speed) MPH"
        lastTimeDepartedLabel.text = "--- -- ----"
    }
    
    // MARK: - Methods
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: updateSpeed(timer:))
    }
    
    func resetTimer(){
        timer?.invalidate()
        timer = nil
    }
    
    func updateSpeed(timer: Timer){
        if speed >= 88 {
            resetTimer()
            speedLabel.text = "0 MPH"
            lastTimeDepartedLabel.text = presentTimeLabel.text
            presentTimeLabel.text = destinationTimeLabel.text
            speed = 0
            showAlert()
        }else{
            speed += 1
            speedLabel.text = "\(speed) MPH"
        }
    }
    
    func showAlert(){
        let alert = UIAlertController(title: "Time Travel Successful", message: "Your new date: \(presentTimeLabel.text ?? "Error")", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true)
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ModalDestinationDatePickerSegue"{
            guard let datePickerVC = segue.destination as? DatePickerViewController else { return }
            datePickerVC.delegate = self
        }
    }
}

// MARK: - Extension
extension TimeCircuitsViewController: DatePickerDelegate {
    func destinationDateWasChosen(date: Date) {
        destinationTimeLabel.text = dateFormatter.string(from: date)
    }
}
