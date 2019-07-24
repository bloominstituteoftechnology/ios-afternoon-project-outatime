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
        if currentSpeed != 88{
            currentSpeed += 1
            speedLabel.text = "\(currentSpeed) MPH"
        }else{
            lastLabel.text = presentLabel.text
            presentLabel.text = destinationLabel.text
            destinationLabel.text = "--- -- ----"
            currentSpeed = 0
            resetTimer()
            showAlert(newDate:presentLabel.text ?? "")
        }
    }
    
    func showAlert(newDate: String){
        let alertController = UIAlertController(title: "Time Travel Sucessful", message: "Your new date is \(newDate)", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated:  true)
    }

}

extension TimeCircuitsViewController : DatePickerDelegate{
    func destinationDateWasChosen(date: Date) {
        destinationLabel.text = dateFormatter.string(from: date)
    }
    
    
}
