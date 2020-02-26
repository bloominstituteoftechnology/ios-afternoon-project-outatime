//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by Lydia Zhang on 2/26/20.
//  Copyright © 2020 Lydia Zhang. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {
    @IBOutlet weak var destinationLabel: UILabel!
    @IBOutlet weak var presentLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var departLabel: UILabel!
    
    var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM dd, yyyy"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        return formatter
    } ()
    var speed = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        presentLabel.text = dateFormatter.string(from: Date())
        speedLabel.text = "\(speed) MPH"
        departLabel.text = "--- -- ----"
    }
    
    var currentSpeed = 0
    private var timer: Timer?
    
    private func updatedSpeed(timer: Timer) {
        
        if currentSpeed <= 88 {
            speedLabel.text = String(currentSpeed)
            currentSpeed += 1
        } else {
            resetTimer()
            departLabel.text = presentLabel.text
            presentLabel.text = destinationLabel.text
            currentSpeed = 0
            showAlert(date: presentLabel.text!)
        }
    }
    private func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: updatedSpeed(timer:))
    }
    @IBAction func travelBack(_ sender: Any) {
        startTimer()
    }
    
    private func resetTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    private func showAlert(date: String) {
        let alert = UIAlertController(title: "Travel Success", message: "Your new date is \(date)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Done", style: .default, handler: nil))
        self.present(alert, animated: true)
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
            datePickerVC.delegate = self
        }
    }
    
}
extension TimeCircuitsViewController: DatePickerDelegate {
    func destinationDateWasChosen(date: Date) {
        departLabel.text = dateFormatter.string(from: date)
    }
}
