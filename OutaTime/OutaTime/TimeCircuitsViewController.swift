//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by Bradley Yin on 7/24/19.
//  Copyright © 2019 bradleyyin. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {
    
    @IBOutlet weak var destinationLabel: UILabel!
    @IBOutlet weak var presentLabel: UILabel!
    @IBOutlet weak var lastLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    
    var dateFormatter : DateFormatter{
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd yyyy"
        formatter.timeZone = TimeZone(secondsFromGMT: -28800)
        return formatter
    }
    
    var currentSpeed = 0
    
    var timer : Timer?
    
    var reversing = false
    

    override func viewDidLoad() {
        super.viewDidLoad()
        presentLabel.text = dateFormatter.string(from: Date(timeIntervalSinceNow: 0))
        speedLabel.text = "\(currentSpeed) MPH"
        destinationLabel.text = "--- -- ----"

        // Do any additional setup after loading the view.
    }
    

    @IBAction func travelButtonTapped(_ sender: UIButton) {
        startTimer()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ModalDestinationDatePickerSegue"{
            guard let datePickerVC = segue.destination as? DatePickerViewController else {return}
            datePickerVC.delegate = self
        }
    }
    
    func startTimer(){
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { (timer) in
            self.updateSpeed()
        }
    }
    func resetTimer (){
        timer?.invalidate()
        timer = nil
    }
    
    func updateSpeed(){
        if currentSpeed != 88 && !reversing{
            currentSpeed += 1
            speedLabel.text = "\(currentSpeed) MPH"
        }else if currentSpeed != 0 && reversing{
            currentSpeed -= 1
            speedLabel.text = "\(currentSpeed) MPH"
        }else if currentSpeed == 0 && reversing{
            self.resetTimer()
            presentLabel.text = lastLabel.text
            lastLabel.text = "--- -- ----"

            showAlert(newDate: presentLabel.text ?? "")
        }else{
            self.resetTimer()
            lastLabel.text = presentLabel.text
            presentLabel.text = destinationLabel.text
            
            showAlert(newDate:presentLabel.text ?? "")
        }
    }
    
    func showAlert(newDate: String){
        let alertController = UIAlertController(title: "Time Travel Sucessful", message: "Your new date is \(newDate)", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Stay", style: .default) {(action) in
            self.destinationLabel.text = "--- -- ----"
            self.reversing = false
            self.currentSpeed = 0
        }
        let reverseAction = UIAlertAction(title: "Reverse", style: .default) { (action) in
            self.reversing = true
            self.startTimer()
        }
        alertController.addAction(okAction)
        if !reversing{
           alertController.addAction(reverseAction)
        }
        
        present(alertController, animated:  true)
    }

}

extension TimeCircuitsViewController : DatePickerDelegate{
    func destinationDateWasChosen(date: Date) {
        destinationLabel.text = dateFormatter.string(from: date)
    }
    
    
}
