//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by Chris Dobek on 3/25/20.
//  Copyright © 2020 Chris Dobek. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {

    @IBOutlet weak var destinationTimeLabel: UILabel!
    @IBOutlet weak var presentTimeLabel: UILabel!
    @IBOutlet weak var lastTimeDepartedLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    
    
    override func viewDidLoad() {
    super.viewDidLoad()
    }
    
    
    @IBAction func travelBackButton(_ sender: Any) {
        startTimer()
    }
    
    private var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd yyyy"
        return formatter
    }()

    var speed = 0
    private var timer: Timer?
    
    func updateViews(){
    presentTimeLabel.text = dateFormatter.string(from: Date())
    speedLabel.text = "\(speed) MPH"
    lastTimeDepartedLabel.text = "--- --- ---"
    }
    

    private func startTimer(){
        timer = Timer.scheduledTimer(withTimeInterval: 0.03, repeats: true, block: updateSpeed(timer:))
    }
    
    private func resetTimer(){
        timer?.invalidate()
        timer = nil
    }
    
    
    private func updateSpeed(timer: Timer) {
        if speed <= 87 {
            speed += 1
            speedLabel.text = "\(speed) MPH"
        } else {
            if speed >= 88 {
            resetTimer()
            lastTimeDepartedLabel.text = presentTimeLabel.text
            presentTimeLabel.text = destinationTimeLabel.text
            speed = 0
            
            guard let date = presentTimeLabel.text else { return }
            showAlert(date: date)
        }
    }
}
    
    
    private func showAlert(date: String){
        let alert = UIAlertController(title: "Travel Successful", message: "Your new date is \(date)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Done", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ModalDestinationDatePickerSegue" {
            guard let datePickerVC = segue.destination as? DatePickerViewController else { return }
            datePickerVC.delegate = self
        }
       
    }
    

    
}

extension TimeCircuitsViewController: DatePickerDelegate {
    func destinationDateWasChosen(_ date: Date) {
        destinationTimeLabel.text = dateFormatter.string(from: date)
    }
    
}

extension TimeCircuitsViewController {
    func fadeIn(label: UILabel) {
        UIView.animate(withDuration: 2) { label.alpha = 1 }
    }
    func fadeOut(label: UILabel) {
        UIView.animate(withDuration: 2) { label.alpha = 0 }
    }
    func fadeIn(button: UIButton) {
        UIView.animate(withDuration: 2) { button.alpha = 1 }
    }
    func fadeOut(button: UIButton) {
        UIView.animate(withDuration: 2) { button.alpha = 0 }
    }
}

