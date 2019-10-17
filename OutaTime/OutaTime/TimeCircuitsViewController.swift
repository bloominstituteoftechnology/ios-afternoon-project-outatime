//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by morse on 10/16/19.
//  Copyright © 2019 morse. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {
    
    @IBOutlet weak var destinationTimeLabel: UILabel!
    @IBOutlet weak var presentTimeLabel: UILabel!
    @IBOutlet weak var previousTimeLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    
    struct PropertyKeys {
        static let segue = "ModalDestinationDatePickerSegue"
    }
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "LLL dd yyyy"
        formatter.timeZone = TimeZone(secondsFromGMT: -25200)
        return formatter
    }
    
//    destDate var: Date?
//    speed var
//    presentDAte
//    last date
    
    var speed = 0
    var destinationDate: Date? = Date()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        presentTimeLabel.text = string(from: Date())
        destinationTimeLabel.text = string(from: Date())
//        speedLabel.text = "\(speed) MPH"
        
        overrideUserInterfaceStyle = .dark
    }
    
    func updateView() {
        guard let newLastDate = presentTimeLabel.text, let destinationDate = destinationDate else { return }

        presentTimeLabel.text = string(from: destinationDate)
        previousTimeLabel.text = newLastDate
        speed = 0
        destinationTimeLabel.text = string(from: destinationDate)
    }
    
    private func string(from date: Date) -> String {
        return dateFormatter.string(from: date).uppercased()
    }
    
    @IBAction func travelTapped(_ sender: Any) {
        updateSpeed()
        
    }
    
    func updateSpeed() {
        
        Timer.scheduledTimer(withTimeInterval: 0.03, repeats: true) { timer in
            self.speedLabel.text = "\(self.speed) MPH"
            self.speed += 1
            if self.speed == 89 {
                timer.invalidate()
                self.updateView()
                self.showAlert()
            }
        }
    }
    
    private func showAlert() {
        let alert = UIAlertController(title: "Timer Finished!", message: "Your countdown is over.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == PropertyKeys.segue {
            guard let datePickerVC = segue.destination as? DatePickerViewController else { return }
            datePickerVC.delegate = self
        }
    }
}

extension TimeCircuitsViewController: DatePickerDelegate {
    func destinationWasChosen(_ date: Date) {
        destinationDate = date
        destinationTimeLabel.text = string(from: date)
    }
}

