//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by Clayton Watkins on 4/27/20.
//  Copyright © 2020 Clayton Watkins. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var destinationDateLabel: UILabel!
    @IBOutlet weak var presentTimeLabel: UILabel!
    @IBOutlet weak var lastDepatureLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    
    //MARK: - Properties
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd yyyy"
        formatter.timeZone = TimeZone.init(secondsFromGMT: 0)
        return formatter
    }
    
    var speed = 0
    var delegate : DatePickerDelegate?
    var timer: Timer?
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    //MARK: - IBActions
    @IBAction func travelBackTapped(_ sender: Any) {
        startTimer()
    }
    
    
    //MARK: - Helper Functions
    func updateViews(){
        setPresentDate()
        setLastDeparture()
        speedLabel.text = "\(String(speed)) MPH"
    }
        
    func setPresentDate(){
        let presentTime = Date()
        let dateString = dateFormatter.string(from: presentTime)
        presentTimeLabel.text = dateString
    }
    
    func setLastDeparture(){
        lastDepatureLabel.text = "--- -- ----"
    }
    
    func updateSpeed(timer: Timer){
        if speed < 88{
            speed += 1
            speedLabel.text = "\(speed)) MPH"
        } else {
        resetTimer()
        lastDepatureLabel.text = presentTimeLabel.text
        presentTimeLabel.text = destinationDateLabel.text
        speed = 0
        speedLabel.text = "\(speed) MPH"
        showAlert()
        }
    }
    
    func startTimer(){
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: updateSpeed(timer:))
    }
    
    func resetTimer(){
        if let timer = timer{
            timer.invalidate()
        }
        timer = nil
    }
    
    func showAlert(){
        let alert = UIAlertController(title: "Time Travel Successful", message: "Your new date is \(presentTimeLabel.text ?? "unknown date/time")", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Thank You!", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ModalDestinationDatePickerSegue"{
            guard let destinationVC = segue.destination as? DatePickerViewController else { return }
            destinationVC.delegate = self
        }
    }
    
}

extension TimeCircuitsViewController: DatePickerDelegate{
    func destinationDateWasChosen(date: Date) {
        let dateString = dateFormatter.string(from: date)
        destinationDateLabel.text = dateString
    }
}
