//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by Bhawnish Kumar on 2/26/20.
//  Copyright © 2020 Bhawnish Kumar. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {
    
    @IBOutlet weak var destinationLabel: UILabel!
    
    @IBOutlet weak var presentLabel: UILabel!
    
    @IBOutlet weak var lastTimeLabel: UILabel!
    
    @IBOutlet weak var speedLabel: UILabel!
    
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-mm-yyyy"
        formatter.locale = Locale(identifier: "en_US")
        
        
        
        return formatter
    }()
    
    var currentSpeed = 0
    
    
    
    
    override func viewDidLoad() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd,yyyy"
        
        let CurrentTime: Date = Date()
        print(dateFormatter.string(from: CurrentTime))
        presentLabel.text = "\(dateFormatter.string(from: CurrentTime))"
        
        
        lastTimeLabel.text = "--- -- ----"
        
        
        
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    private var timer: Timer?
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: updateSpeed(timer:))
    }
    func resetTime() {
        timer?.invalidate()
        timer = nil
    }
    
    func updateSpeed(timer: Timer) {
        if currentSpeed <= 88 {
            speedLabel.text = "\(currentSpeed) MPH"
            currentSpeed += 1
            resetTime()
            lastTimeLabel.text = presentLabel.text
            presentLabel.text = destinationLabel.text
            showAlert()
        } else {
            speedLabel.text = "\(currentSpeed) MPH"
            currentSpeed = 0
        }
    }
    
    private func showAlert() {
        let alert = UIAlertController(title: "Time Travel Successful", message: "Your new date is \(String(describing: presentLabel.text))", preferredStyle: .alert)
        // UIAlertcontroller inherits from view controller.
        
        let okAction = UIAlertAction(title: "Confirm", style: .default, handler: nil)
        
        // they both in order to be use let's do  thhis
        
        alert.addAction(okAction)
        
        present(alert, animated: true, completion: nil)
        
        // SHOW THE FUNCTION SHOW ALERT TO THHE DID FINISHED FUNCTION
    }
    //
    
    @IBAction func destinationButton(_ sender: Any) {
    }
    
    @IBAction func travelButtonTapped(_ sender: Any) {
        startTimer()
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "ModalDestinationDatePickerSegue" {
            guard let datePickerVC = segue.destination as? DatePickerViewController else {
                return
            }
            datePickerVC.delegate = self as? DatePickerDelegate
        }
    }
    
    
}
extension TimeCircuitsViewController: DatePickerDelegate {
    func destinationDateWasChosen(date: Date) {
        destinationLabel.text = dateFormatter.string(from: date)
    }
}




