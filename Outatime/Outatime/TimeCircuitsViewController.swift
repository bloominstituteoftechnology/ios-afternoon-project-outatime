//
//  TimeCircuitsViewController.swift
//  Outatime
//
//  Created by Harm on 7/19/22.
//

import UIKit

class TimeCircuitsViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var destinationTimeLabel: UILabel!
    @IBOutlet weak var presentTimeLabel: UILabel!
    @IBOutlet weak var lastTimeDepartedLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    
    var currentSpeed = 0
    
    var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd, yyyy"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        return formatter
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        presentTimeLabel.text = dateFormatter.string(from: Date())
        speedLabel.text = "\(currentSpeed) MPH"
        lastTimeDepartedLabel.text = "--- -- ----"
    }
    
//Set the DatePickerViewController object's delegate as the TimeCircuitsViewController object in the prepare method.

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        
        if segue.identifier == "ModalDestinationDatePickerSegue", let timeCircuitsVC = segue.destination as? DatePickerViewController {
            timeCircuitsVC.delegate = self
        }
    }
    
    var timer: Timer?
    func startTimer() {
//        timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block: updateSpeed())
//        timer?.fire()
        timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block: updateSpeed(timer:))
    }
    
    func updateSpeed(timer: Timer) {
//        guard let speedString = speedLabel.text, var speedInt = Int(speedString) else { return }
        if currentSpeed < 88 {
            currentSpeed += 1
            speedLabel.text = "\(currentSpeed) MPH"
        } else {
            timer.invalidate()
            lastTimeDepartedLabel.text = presentTimeLabel.text
            presentTimeLabel.text = destinationTimeLabel.text
            currentSpeed = 0
            speedLabel.text = "\(currentSpeed) MPH"
            showAlert()
        }
    }
    
    func resetTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    
    // MARK: - IBActions
    @IBAction func travelBackTapped(_ sender: UIButton) {
        startTimer()
    }
    
    private func showAlert() {
        guard let timeNow = presentTimeLabel.text else { return }
        let alert = UIAlertController(title: "Time Travel Successful", message: "Your new date is \(timeNow).", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        // Styles:
            // default: normal blue text
            // destructive: red text
            // cancel: bolded, blue text that always goes to the bottom
        // Handler: extra code you want to run
        
        alert.addAction(okAction) // you can sub UIAlert(...) in for the okAction variable
        
        present(alert, animated: true, completion: nil)
    }
}

extension TimeCircuitsViewController: DatePickerDelegate {
    func destinationDateWasChosen(date: Date) {
        destinationTimeLabel.text = dateFormatter.string(from: date)
    }
}
