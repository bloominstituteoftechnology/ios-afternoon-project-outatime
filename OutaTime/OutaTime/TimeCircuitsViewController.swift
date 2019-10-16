//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by Niranjan Kumar on 10/16/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {

    
    @IBOutlet weak var destinationTimeLabel: UILabel!
    
    @IBOutlet weak var presentTimeLabel: UILabel!
    @IBOutlet weak var timeDepartedLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, yyyy"
        formatter.timeZone = .current
        return formatter
    }
    
    var speed = 0
    let date = Date()
    
    //Have to declare this beforehand
    let timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presentTimeLabel.text = dateFormatter.string(from: date)
        speedLabel.text = "\(speed) MPH"
        timeDepartedLabel.text = "--- -- ----"
    }
    
    @IBAction func travelBackTapped(_ sender: UIButton) {
        startTimer()
        
    }
    // MARK: - Methods

    // In the startTimer method, initialize the timer object for a 0.1 sec time interval. Set it to fire a method that updates the speed label:
    private func startTimer() {
        let timer: TimeInterval
        
    }
    
    // In the resetTimer method, stop the timer (there is a method you can call to do this, see our project from today) and then set it to nil.
    private func resetTimer() {
        
    }
    
    private func updateSpeed() {
       
        
        
    }
    
    // MARK: - Navigation

    // Set the DatePickerViewController object's delegate as the TimeCircuitsViewController object in the prepare method:
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ModalDestinationDatePickerSegue" {
            if let datePickerVC = segue.destination as? DatePickerViewController {
                datePickerVC.delegate = self
            }
        }
    }
    

}

//
extension TimeCircuitsViewController: DatePickerDelegate {
    func destinationDateWasChosen(date: Date) {
        // Set the destinationTimeLabel with the date received from the picker view controller using the date formatter object in the destinationDateWasChosen method.
        destinationTimeLabel.text = dateFormatter.string(from: date)
    }
    
    
}
