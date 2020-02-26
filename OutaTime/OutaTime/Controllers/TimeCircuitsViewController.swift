//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by Karen Rodriguez on 2/25/20.
//  Copyright © 2020 Hector Ledesma. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {

    @IBOutlet weak var destTimeLabel: UILabel!
    @IBOutlet weak var presentTimeLabel: UILabel!
    @IBOutlet weak var lastDepartLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    
    let date = Date()
    var speed: UInt = 0
    var timer: Timer?
    
    var dateFormatter: DateFormatter {
        get {
            let dateFormat = DateFormatter()
            dateFormat.dateFormat = "MMM dd yyyy"
            return dateFormat
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view
            print(dateFormatter.string(from: date))
        presentTimeLabel.text = dateFormatter.string(from: date)
        speedLabel.text = String(speed) + " MPH"
        lastDepartLabel.text = "--- -- ----"
    }
    

// MARK: - Button
    
    @IBAction func travelBack(_ sender: UIButton) {
        startTimer()
        }
    
// MARK: - Methods
    
    func startTimer() {
        if timer == nil {
            timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { _ in
                self.updateSpeed()
            })
        }
        
    }
    
    func resetTimer() {
        if timer != nil {
            timer!.invalidate()
            timer = nil
        }
    }
    
    func updateSpeed() {
        let alert = UIAlertController(title: "Time Travel Successful", message: "Your new date is \(destTimeLabel.text ?? "E R R O R !")", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        
        if speed == 88 {
            resetTimer()
            lastDepartLabel.text = presentTimeLabel.text
            presentTimeLabel.text = destTimeLabel.text
            speed = 0
            present(alert, animated: true, completion: nil)
            
        } else {
            speed += 1
            speedLabel.text = "\(speed) MPGH"
        }
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "ModalDestinationDatePickerSegue" {
            guard let datePickerVC = segue.destination as? DatePickerViewController else { fatalError() }
            datePickerVC.delegate = self
            
        }

    }
}

// MARK: - Extensions

extension TimeCircuitsViewController: DatePickerDelegate {
    func destinationDateWasChosen(for date: Date) {
        destTimeLabel.text = dateFormatter.string(from: date)
    }
    
    
}
